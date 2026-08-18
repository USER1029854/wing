// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//
//@@@@@@@@&    (@@@@@@@@@@@@@    /@@@@@@@@@//
//@@@@@@          /@@@@@@@          /@@@@@@//
//@@@@@            (@@@@@            (@@@@@//
//@@@@@(            @@@@@(           &@@@@@//
//@@@@@@@           &@@@@@@         @@@@@@@//
//@@@@@@@@@@@@@@%    /@@@@@@@@@@@@@@@@@@@@@//
//@@@@@@@@@@@@@@@@@@@   @@@@@@@@@@@@@@@@@@@//
//@@@@@@@@@@@@@@@@@@@@@      (&@@@@@@@@@@@@//
//@@@@@@#         @@@@@@#           @@@@@@@//
//@@@@@/           %@@@@@            %@@@@@//
//@@@@@            #@@@@@            %@@@@@//
//@@@@@@          #@@@@@@@/         #@@@@@@//
//@@@@@@@@@&/ (@@@@@@@@@@@@@@&/ (&@@@@@@@@@//
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@//

import {IveSPA} from "IveSPA.sol";
import {IERC20, SafeERC20} from "SafeERC20.sol";
import "ReentrancyGuardUpgradeable.sol";
import "OwnableUpgradeable.sol";

/// @title RewardDistributor for veSPA holders
/// @notice Contracts serves as a medium to share the sperax-protocol revenue as well as distributing incentives for veSPA holders.
contract RewardDistributor_v3 is OwnableUpgradeable, ReentrancyGuardUpgradeable {
    using SafeERC20 for IERC20;

    uint256 public constant WEEK = 7 days; // 604800
    uint256 public constant PREC = 1 ether; // 1e18
    uint256 public constant MAX_REFILL_DURATION = 12;
    uint256 public constant MIN_REFILL_DURATION = 1;

    address public veSPA;
    uint64 public maxIterations; // Max number of past weeks for which users can claim rewards in a single transaction
    uint256 public startTime;
    uint256 public globalCheckpoint;

    address[] public rewardTokens;
    mapping(address => bool) public isRewardToken;
    mapping(uint256 => mapping(address => uint256)) public rewardsPerWeek;
    mapping(address => uint256) public timeCursorOf;
    mapping(uint256 => uint256) public veSPASupply;

    event Claimed(address indexed account, uint256 rewardsTill, uint256[] amount);
    event RecoveredERC20(address indexed token, uint256 amount);
    event RewardAdded(address indexed token, uint256 amount, uint256 numEpochs);
    event RewardTokenRecovered(address indexed token, address indexed recipient, uint256 totalAmount);
    event RewardTokenRegistered(address indexed token);

    error InvalidAddress();
    error InvalidAmount();
    error InvalidDuration();
    error NothingToRecover();
    error RewardTokenAlreadyRegistered();
    error RewardTokenNotRegistered();
    error RewardsAlreadyCommitted();
    error UserHasNoDeposit();

    constructor() initializer {
        // _disableInitializer();
    }

    function initialize(address _veSPA) external initializer {
        OwnableUpgradeable.__Ownable_init();
        ReentrancyGuardUpgradeable.__ReentrancyGuard_init();
        _isNonZeroAddr(_veSPA);
        veSPA = _veSPA;
        maxIterations = 30;
        startTime = _getWeek(block.timestamp + WEEK);
    }

    /// @notice Register a new reward token
    /// @dev RewardToken once added can't be removed from the list (due to accounting issues).
    /// @param _token Reward token address.
    function registerRewardToken(address _token) external onlyOwner {
        if (isRewardToken[_token]) revert RewardTokenAlreadyRegistered();
        rewardTokens.push(_token);
        isRewardToken[_token] = true;
        emit RewardTokenRegistered(_token);
    }

    /// @notice Recover all the scheduled `_token` rewards.
    /// @param _token Reward token address.
    function recoverAllUpcomingRewards(address _token) external onlyOwner nonReentrant {
        _isValidRewardToken(_token);
        uint256 weekCursor = _getWeek(block.timestamp + WEEK);
        uint256 totalAmount = 0;

        for (uint256 i; i < MAX_REFILL_DURATION;) {
            totalAmount += rewardsPerWeek[weekCursor][_token];
            delete rewardsPerWeek[weekCursor][_token];

            unchecked {
                weekCursor += WEEK;
                ++i;
            }
        }

        if (totalAmount == 0) revert NothingToRecover();
        IERC20(_token).safeTransfer(msg.sender, totalAmount);
        emit RewardTokenRecovered(_token, msg.sender, totalAmount);
    }

    /// @notice Recover `_token` from a pre scheduled epoch.
    /// @dev Rewards can only be reduced, preliminary step to recover token.
    /// @param _token Bribe token address.
    /// @param _ts Week's timestamp.
    /// @param _amount Amount to be recovered.
    function recoverRewardTokens(address _token, uint256 _ts, uint256 _amount) external onlyOwner nonReentrant {
        _isValidRewardToken(_token);
        _isNonZeroAmount(_amount);
        if (_amount > rewardsPerWeek[_ts][_token]) revert InvalidAmount();
        if (_ts < _getWeek(block.timestamp + WEEK)) revert RewardsAlreadyCommitted();

        // update the reward for the timestamp
        rewardsPerWeek[_ts][_token] -= _amount;
        IERC20(_token).safeTransfer(msg.sender, _amount);
        emit RewardTokenRecovered(_token, msg.sender, _amount);
    }

    /// @notice Recover ERC20 tokens from this contract
    /// @dev Tokens are sent to the owner wallet
    /// @param _token token address
    function recoverERC20(address _token) external onlyOwner nonReentrant {
        // Only the owner address can ever receive the recovery withdrawal
        uint256 amount = IERC20(_token).balanceOf(address(this));
        if (amount == 0) revert NothingToRecover();
        IERC20(_token).safeTransfer(msg.sender, amount);
        emit RecoveredERC20(_token, amount);
    }

    /// @notice Update the maxIterations for user's reward claim
    /// @dev To be updated only on request
    /// @param _maxIterations updated iteration number.
    function updateMaxIterations(uint64 _maxIterations) external onlyOwner {
        _isNonZeroAmount(_maxIterations);
        maxIterations = _maxIterations;
    }

    /// @notice Add rewards tokens for future epochs in uniform manner.
    /// @dev Any rewards tokens directly transferred to the contract are not considered for distribution.
    ///       They have to be recovered from the contract using `recoverERC20` function.
    /// @param _token Address of the reward token.
    /// @param _amount The total amount to be funded.
    /// @param _numEpochs The number of epochs the amount should be split. (2 = 2 epochs).
    function addRewards(address _token, uint256 _amount, uint256 _numEpochs) external nonReentrant {
        _isValidRewardToken(_token);
        _isNonZeroAmount(_amount);
        _validateDuration(_numEpochs);
        uint256 weekCursor = _getWeek(block.timestamp + WEEK);
        uint256 amountPerCycle = _amount / _numEpochs;
        uint256 residue = _amount - (amountPerCycle * _numEpochs);

        // schedule upcoming epoch rewards
        for (uint256 i; i < _numEpochs;) {
            rewardsPerWeek[weekCursor][_token] += amountPerCycle;

            unchecked {
                weekCursor += WEEK;
                ++i;
            }
        }
        // add residue to the last epoch
        rewardsPerWeek[weekCursor][_token] += residue;

        // Transfer the reward tokens to the contract.
        IERC20(_token).safeTransferFrom(msg.sender, address(this), _amount);
        emit RewardAdded(_token, _amount, _numEpochs);
    }

    /// @notice Claim rewards for the address
    function claim() external nonReentrant {
        // Calculate the entitled reward amount for the user
        (uint256 weekCursor, uint256[] memory amounts) = _computeRewards(msg.sender);

        // update time cursor for the user
        timeCursorOf[msg.sender] = weekCursor;

        for (uint256 i; i < amounts.length;) {
            if (amounts[i] > 0) {
                IERC20(rewardTokens[i]).safeTransfer(msg.sender, amounts[i]);
            }
            unchecked {
                ++i;
            }
        }

        emit Claimed(msg.sender, weekCursor, amounts);
    }

    /// @notice Function to get the user earnings at a given timestamp.
    /// @param _user The address of the user
    /// @dev This function gets only `maxIterations` weeks worth of rewards.
    /// @return total rewards earned by user, lastRewardCollectionTime, rewardsTill
    /// @dev lastRewardCollectionTime, rewardsTill are in terms of WEEK Cursor.
    function computeRewards(address _user)
        external
        view
        returns (
            uint256[] memory, // total rewards earned by user
            uint256, // lastRewardCollectionTime
            uint256 // rewardsTill
        )
    {
        uint256 numRewards = rewardTokens.length;
        uint256[] memory toDistribute = new uint256[](numRewards);

        // Get the user's reward time cursor.
        uint256 weekCursor = timeCursorOf[_user];
        if (weekCursor == 0) {
            // User constant has never claimed the reward before
            weekCursor = _initializeUser(_user);
        }

        uint256 lastRewardCollectionTime = weekCursor;
        // Iterate over the weeks
        for (uint256 i; i < maxIterations;) {
            // Users can't claim the reward for the ongoing week.
            if (weekCursor > block.timestamp) {
                break;
            }
            uint256 totalSupply = veSPASupply[weekCursor];
            if (totalSupply == 0 && weekCursor > globalCheckpoint) {
                totalSupply = IveSPA(veSPA).totalSupply(weekCursor);
            }

            // Get the week's balance for the user
            uint256 balance = IveSPA(veSPA).balanceOf(_user, weekCursor);
            if (balance > 0) {
                for (uint256 j; j < numRewards;) {
                    // Compute the user's share for the week.
                    toDistribute[j] +=
                        ((balance * rewardsPerWeek[weekCursor][rewardTokens[j]] * PREC) / totalSupply) / PREC;

                    unchecked {
                        ++j;
                    }
                }
            }
            unchecked {
                weekCursor += WEEK;
                ++i;
            }
        }
        return (toDistribute, lastRewardCollectionTime, weekCursor);
    }

    /// @notice Function to get the total rewards for the user.
    /// @dev This function gets only `maxIterations` weeks worth of rewards.
    /// @param _user The address of the user
    /// @return weekCursor week till which the rewards are computed
    /// @return toDistribute amounts to distribute
    function _computeRewards(address _user)
        internal
        returns (
            uint256 weekCursor, // WeekCursor
            uint256[] memory toDistribute // TotalRewards
        )
    {
        uint256 numRewards = rewardTokens.length;
        toDistribute = new uint256[](numRewards);

        // Get the user's reward time cursor.
        weekCursor = timeCursorOf[_user];

        if (weekCursor == 0) {
            // User constant has never claimed the reward before
            weekCursor = _initializeUser(_user);
        }

        // Iterate over the weeks
        for (uint256 i; i < maxIterations;) {
            // Users can't claim the reward for the ongoing week.
            if (weekCursor > block.timestamp) {
                break;
            }
            uint256 totalSupply = veSPASupply[weekCursor];
            if (totalSupply == 0 && weekCursor > globalCheckpoint) {
                totalSupply = IveSPA(veSPA).totalSupply(weekCursor);
                // Cache the total supply for the week
                veSPASupply[weekCursor] = totalSupply;
                globalCheckpoint = weekCursor;
            }

            // Get the week's balance for the user
            uint256 balance = IveSPA(veSPA).balanceOf(_user, weekCursor);
            if (balance > 0) {
                for (uint256 j; j < numRewards;) {
                    // Compute the user's share for the week.
                    toDistribute[j] +=
                        ((balance * rewardsPerWeek[weekCursor][rewardTokens[j]] * PREC) / totalSupply) / PREC;

                    unchecked {
                        ++j;
                    }
                }
            }

            unchecked {
                weekCursor += WEEK;
                ++i;
            }
        }
        return (weekCursor, toDistribute);
    }

    /// @notice Function to initialize user's reward weekCursor
    /// @param _user The address of the user
    /// @return weekCursor The weekCursor of the user
    function _initializeUser(address _user) internal view returns (uint256 weekCursor) {
        // Get the user's max epoch
        uint256 maxUserEpoch = IveSPA(veSPA).userPointEpoch(_user);

        if (maxUserEpoch == 0) revert UserHasNoDeposit();

        // Find the Timestamp corresponding to reward distribution start time
        uint256 userEpoch = _findUserTimestampEpoch(_user, startTime, maxUserEpoch);

        // In case the User deposits after the startTime
        // binary search returns userEpoch as 0
        if (userEpoch == 0) {
            userEpoch = 1;
        }
        // Get the user deposit timestamp
        uint256 userPointTs = IveSPA(veSPA).getUserPointHistoryTS(_user, userEpoch);
        // Compute the initial week cursor for the user for claiming the reward.
        weekCursor = ((userPointTs + WEEK - 1) / WEEK) * WEEK;
        // If the week cursor is less than the reward start time
        // Update it to the reward start time.
        if (weekCursor < startTime) {
            weekCursor = startTime;
        }
        return weekCursor;
    }

    /// @notice Get the nearest user epoch for a given timestamp
    /// @param _addr The address of the user
    /// @param _ts The timestamp
    /// @param _maxEpoch The maximum possible epoch for the user.
    function _findUserTimestampEpoch(address _addr, uint256 _ts, uint256 _maxEpoch) internal view returns (uint256) {
        uint256 min = 0;
        uint256 max = _maxEpoch;

        // Binary search
        for (uint256 i; i < 128;) {
            if (min >= max) {
                break;
            }
            uint256 mid = (min + max + 1) / 2;
            if (IveSPA(veSPA).getUserPointHistoryTS(_addr, mid) <= _ts) {
                min = mid;
            } else {
                max = mid - 1;
            }

            unchecked {
                ++i;
            }
        }
        return min;
    }

    /// @notice Validates a reward token is registered.
    /// @param _token Token address.
    function _isValidRewardToken(address _token) internal view {
        if (!isRewardToken[_token]) revert RewardTokenNotRegistered();
    }

    /// @notice Validates the provided duration for reward distribution.
    /// @param _numEpochs time to be validated.
    function _validateDuration(uint256 _numEpochs) internal pure {
        if (_numEpochs < MIN_REFILL_DURATION || _numEpochs > MAX_REFILL_DURATION) revert InvalidDuration();
    }

    /// @notice Get the based on the ts.
    /// @param _ts arbitrary time stamp.
    /// @return returns the 00:00 am UTC for THU after _ts
    function _getWeek(uint256 _ts) internal pure returns (uint256) {
        return (_ts / WEEK) * WEEK;
    }

    /// @notice Validate address
    function _isNonZeroAddr(address _addr) internal pure {
        if (_addr == address(0)) revert InvalidAddress();
    }

    /// @notice Validate amount
    function _isNonZeroAmount(uint256 _amount) internal pure {
        if (_amount == 0) revert InvalidAmount();
    }
}
