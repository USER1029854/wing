// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import '@openzeppelin/contracts/access/Ownable.sol';
import { IERC20 } from '@openzeppelin/contracts/token/ERC20/IERC20.sol';

interface IWhitelist {
  function isWhitelisted(address) external view returns (bool);
}

interface ITokenMinterMulti {
  function mint(address, uint256) external;

  function burn(address, uint256) external;

  function updateMinter(address _minter, bool _isActive) external;

  function updateHandler(address _handler, bool _isActive) external;

  event HandlerUpdated(address indexed _address, bool _isActive);

  event MinterUpdated(address indexed _address, bool _isActive);
}

interface IPlsDpxMini {
  function setOperator(address _operator) external;
}

interface ISykDepositor {
  /**
   * @notice Deposit Syk, msg.sender receives plsSyk
   * @param amount The amount of Syk to deposit.
   */
  function deposit(uint amount) external;

  /**
   * @notice Deposit msg.sender's entire balance of Syk, receive equivalent amount of plsSyk
   */
  function depositAll() external;

  /**
   * @notice Deposit account's Syk, receive equivalent amount of plsSyk. Called by handler's only.
   * @param amount The amount of Syk to deposit.
   */
  function handleDepositFor(address account, uint256 amount) external;

  function setHandler(address _handler, bool _isActive) external;
}

interface ISykStaker {
  /**
   * @notice Handler assigns the specified amount of staker's power to a gauge.
   * @param power The amount of power to assign.
   */
  function handleVote(uint256 power, bytes32 gaugeId) external;

  function handleClaim()
    external
    returns (IERC20 rewardsToken, uint rewardsAmount, uint xSykAmount);

  /**
   * @notice Depositor calls this function to stake Syk to various reward contracts.
   * @param amount The amount of Syk to stake.
   */
  function stake(uint amount) external;

  function setDepositor(address _newDepositor) external;

  function setHandler(address _handler, bool _isActive) external;
}

interface ISykStakerV4 {
  /**
   * @notice Handler assigns the specified amount of staker's power to a gauge.
   * @param power The amount of power to assign.
   */
  function handleVote(uint256 power, uint256 epochId, bytes32 gaugeId) external;

  function handleClaim()
    external
    returns (IERC20 rewardsToken, uint rewardsAmount, uint xSykAmount);

  /**
   * @notice Depositor calls this function to stake Syk to various reward contracts.
   * @param amount The amount of Syk to stake.
   */
  function stake(uint amount) external;

  function setDepositor(address _newDepositor) external;

  function setHandler(address _handler, bool _isActive) external;
}

interface IPlsSykMigrator {
  /**
   * @notice User calls migrate function to migrate their balance of plsDPX into plsSyk.
   */
  function migrate() external;
}

interface IFeeCollector {
  /**
   * @notice Harvest from all reward contracts and distribute to treasury and to elsewhere.
   */
  function harvest() external;

  function setTreasury(address treasury) external;

  function setTreasuryPercentage(uint _treasuryPercentage) external;
}

interface IFeeDistributor {
  /**
   * @notice Distribute fees to reward contracts.
   */
  function notifyRewardAmount(IERC20 token, uint amount) external;

  function setLpStakerPercentage(uint _lpStakerPercentage) external;

  function setSingleStaker(IReward _singleStaker) external;

  function setLpStaker(IReward _lpStaker) external;
}

interface IReward {
  /**
   * @notice Distribute fees a reward contract.
   */
  function notifyRewardAmount(IERC20 token, uint amount) external;

  function rewardContract() external returns (address);

  function rewardTokens() external returns (address[] memory);

  function setHandler(address _handler, bool _isActive) external;
}

interface INitroPool {
  function addRewards(uint256 amountToken1, uint256 amountToken2) external;
  function rewardsToken1()
    external
    view
    returns (IERC20 token, uint256 amount, uint256 remainingAmount, uint256 accRewardsPerShare);
  function rewardsToken2()
    external
    view
    returns (IERC20 token, uint256 amount, uint256 remainingAmount, uint256 accRewardsPerShare);
}

interface IPlsSykRewards {
  error UNAUTHORIZED();

  /**
   * @notice Set or unset an address as a handler
   * @param _handler The address to be set or unset as handler
   * @param _isActive Boolean representing whether the handler is active
   * @dev Emits a HandlerUpdated event upon successful execution
   */
  function setHandler(address _handler, bool _isActive) external;

  function stake(uint256 amount) external;

  function withdraw(uint256 amount) external;

  function notifyRewardAmount(address _rewardsToken, uint256 reward) external;

  event HandlerUpdated(address indexed _address, bool _isActive);

  function totalSupply() external view returns (uint256);
}
