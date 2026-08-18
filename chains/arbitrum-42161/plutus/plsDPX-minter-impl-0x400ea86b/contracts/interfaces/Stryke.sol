// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.23;

import { IERC20 } from '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import { IERC20Metadata } from '@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol';

interface IXSykStaking {
  /// @notice Emitted when a bridge adapter is added or removed.
  /// @param bridgeAdapter Address of the bridge adapter.
  /// @param add Indicates whether the bridge adapter was added (true) or removed (false).
  event BridgeAdapterUpdated(address bridgeAdapter, bool add);

  /// @notice Emitted when the xSYK reward conversion percentage is updated.
  /// @param xSykRewardPercentage The percentage of SYK rewards to be sent in xSYK
  event XSykRewardPercentageUpdated(uint256 xSykRewardPercentage);

  /// @dev Emitted when tokens are staked in the contract.
  /// @notice This event is fired whenever a user stakes tokens, indicating the amount staked.
  /// @param account The address of the account that staked tokens.
  /// @param amount The amount of tokens that were staked by the account.
  event Staked(address indexed account, uint256 amount);

  /// @dev Emitted when staked tokens are withdrawn (unstaked) from the contract.
  /// @notice This event is fired whenever a user unstakes tokens, indicating the amount unstaked.
  /// @param account The address of the account that unstaked tokens.
  /// @param amount The amount of tokens that were unstaked by the account.
  event Unstaked(address indexed account, uint256 amount);

  /// @dev Emitted when rewards are claimed by a staker.
  /// @notice This event is fired whenever a user claims their staking rewards, indicating the amount claimed.
  /// @param account The address of the account that claimed rewards.
  /// @param amount The amount of rewards that were claimed by the account.
  event Claimed(address indexed account, uint256 amount);

  /// @dev Emitted when a new reward amount is notified to the contract.
  /// @notice This event signals the notification of a new reward amount and the time when the rewards distribution will finish.
  /// @param amount The amount of rewards that will be distributed.
  /// @param finishAt The timestamp when the reward distribution is scheduled to finish.
  event Notified(uint256 amount, uint256 finishAt);

  /// @dev Emitted when the rewards distribution duration is set or updated.
  /// @notice This event is fired whenever the duration for rewards distribution is set or changed, indicating the new duration period.
  /// @param duration The new duration (in seconds) over which rewards will be distributed.
  event RewardsDurationSet(uint256 duration);

  /// @dev Error thrown when an operation that requires a non-zero amount is attempted with a zero value.
  /// @notice Indicates that the operation cannot proceed because the amount specified is zero.
  error XSykStaking_AmountZero();

  /// @dev Error thrown when an operation requires the caller to be the same as a specified account, but it is not.
  /// @notice Indicates that the caller of the function must be the same as the account specified for the operation.
  error XSykStaking_AccountNotSender();

  /// @dev Error thrown when an attempt is made to set or change the rewards duration while a previous rewards duration is still active.
  /// @notice Indicates that the rewards duration cannot be modified while the current rewards period has not yet concluded.
  error XSykStaking_RewardsDurationActive();

  /// @dev Error thrown when an operation that requires a non-zero reward rate is attempted with a zero value.
  /// @notice Indicates that the reward rate for distributing rewards cannot be zero.
  error XSykStaking_RewardRateZero();

  /// @dev Error thrown when there are not enough rewards in the contract to cover a distribution or operation.
  /// @notice Indicates that the operation cannot proceed because the contract does not hold enough rewards to fulfill the request.
  error XSykStaking_NotEnoughRewardBalance();

  /// @notice Returns the saked balance of an account
  /// @param _account address of the account
  function balanceOf(address _account) external returns (uint256);

  /// @notice Allows a user or a bridge adapter to stake tokens on behalf of a user.
  /// @param _amount Amount of tokens to stake.
  /// @param _account Address of the user on whose behalf tokens are staked.
  function stake(uint256 _amount, address _account) external;

  /// @notice Unstakes staked tokens for a user.
  /// @param _amount Amount of tokens to withdraw.
  /// @param _account Address of the user withdrawing tokens.
  function unstake(uint256 _amount, address _account) external;

  /// @notice Calculates the total rewards earned by a user.
  /// @param _account Address of the user.
  /// @return The total rewards earned.
  function earned(address _account) external view returns (uint256);

  /// @notice Claims earned rewards for a user.
  /// @param _account Address of the user claiming rewards.
  /// @return reward The amount of rewards claimed.
  function claim(address _account) external returns (uint256 reward);

  /// @notice Withdraws staked tokens and claims rewards for a user.
  /// @param _account Address of the user exiting the staking contract.
  /// @return balance The staked token balance returned.
  /// @return reward The rewards claimed.
  function exit(address _account) external returns (uint256 balance, uint256 reward);

  function rewardsToken() external view returns (IERC20);
}

enum VestStatus {
  INACTIVE,
  ACTIVE,
  REDEEMED,
  CANCELLED
}

struct VestData {
  address account; // The account participating in the vesting.
  uint256 sykAmount; // SYK amount to be received upon vesting completion.
  uint256 xSykAmount; // xSYK amount being redeemed for SYK.
  uint256 maturity; // Timestamp when the vesting period ends.
  VestStatus status; // Current status of the vesting process.
}

struct RedeemSettings {
  uint256 minRatio; // Minimum conversion ratio from xSYK to SYK.
  uint256 maxRatio; // Maximum conversion ratio from xSYK to SYK.
  uint256 minDuration; // Minimum duration for vesting.
  uint256 maxDuration; // Maximum duration for vesting.
}

interface IXStrykeToken {
  /// @dev Emitted when incorrect ratio values are provided for redeem settings.
  error XStrykeToken_WrongRatioValues();

  /// @dev Emitted when incorrect duration values are provided for redeem settings.
  error XStrykeToken_WrongDurationValues();

  /// @dev Emitted when the provided amount for a transaction cannot be zero.
  error XStrykeToken_AmountZero();

  /// @dev Emitted when the provided duration for vesting is below the minimum allowed.
  error XStrykeToken_DurationTooLow();

  /// @dev Emitted when the provided address for whitelist is the xSYK address itself.
  error XStrykeToken_InvalidWhitelistAddress();

  /// @dev Emitted when someone tries to redeem before their vesting is completed.
  error XStrykeToken_VestingHasNotMatured();

  /// @dev Emitted when someone tries to redeem a non-active vesting.
  error XStrykeToken_VestingNotActive();

  /// @dev Emitted when a transfer of xSYK is happening between non-whitelisted accounts.
  error XStrykeToken_TransferNotAllowed();

  /// @notice  Emitted when the excess receiver is updated.
  /// @param excessReceiver The new excess receiver address
  event ExcessReceiverUpdated(address excessReceiver);

  /// @notice Emitted when redeem settings are updated.
  /// @param redeemSettings The new redeem settings applied.
  event RedeemSettingsUpdated(RedeemSettings redeemSettings);

  /// @notice Emitted when an account's whitelist status is updated.
  /// @param account The account whose whitelist status is updated.
  /// @param add Boolean indicating whether the account was added to (true) or removed from (false) the whitelist.
  event WhitelistUpdated(address account, bool add);

  /// @notice Emitted when SYK tokens are converted to xSYK tokens.
  /// @param from The address of the account converting SYK to xSYK.
  /// @param to The address of the account receiving the xSYK tokens.
  /// @param amount The amount of SYK tokens being converted.
  event Converted(address indexed from, address to, uint256 amount);

  /// @notice Emitted when xSYK tokens are vested for SYK redemption.
  /// @param account The account initiating the vest.
  /// @param xSykAmount The amount of xSYK tokens vested.
  /// @param sykAmount The amount of SYK tokens to be received upon vest completion.
  /// @param duration The duration of the vest in seconds.
  /// @param vestIndex The vest index
  event Vested(
    address indexed account,
    uint256 xSykAmount,
    uint256 sykAmount,
    uint256 duration,
    uint256 vestIndex
  );

  /// @notice Emitted when vested xSYK tokens are redeemed for SYK.
  /// @param account The account redeeming the vested xSYK.
  /// @param xSykAmount The amount of xSYK tokens redeemed.
  /// @param sykAmount The amount of SYK tokens received in exchange.
  event Redeemed(address indexed account, uint256 xSykAmount, uint256 sykAmount);

  /// @notice Emitted when a vesting operation is cancelled.
  /// @param account The account cancelling the vest.
  /// @param vestIndex The index of the vesting operation being cancelled.
  /// @param xSykAmount The amount of xSYK associated with the cancelled vest.
  event VestCancelled(address indexed account, uint256 vestIndex, uint256 xSykAmount);

  /// @notice Converts SYK to xSYK
  /// @param _amount amount of SYK to convert to xSYK
  /// @param _to address of the receiving account
  function convert(uint256 _amount, address _to) external;

  /// @notice Vest xSYK to get back SYK
  /// @param _amount amount of xSYK to vest for getting back SYK
  /// @param _duration duration of the vesting
  function vest(uint256 _amount, uint256 _duration) external;

  /// @notice Redeem vested xSYK
  /// @param _vestIndex Index of the vest
  function redeem(uint256 _vestIndex) external;

  /// @notice Cancel a redeem vested xSYK
  /// @param _vestIndex Index of the vest
  function cancelVest(uint256 _vestIndex) external;
}

/// @dev Struct to hold information about each gauge.
struct GaugeInfo {
  uint8 gaugeType;
  uint256 chainId;
  uint256 baseReward;
  address gaugeAddress;
}

/// @dev Struct for the parameters to pass to vote().
struct VoteParams {
  uint256 power;
  uint256 totalPower;
  bytes32 gaugeId; // keccak256(abi.encode(chainId, gauge address))
  bytes32 accountId; // keccak256(abi.encode(chainId, account address))
}

/// @dev Struct for the parameters to pass to pull().
struct PullParams {
  uint256 epoch;
  bytes32 gaugeId;
  address gaugeAddress;
}

interface IGaugeController {
  /// @dev Error thrown when trying to pull rewards for a gauge in the current epoch.
  error GaugeController_EpochActive();

  /// @dev Error thrown when the total reward available is insufficient to cover the base rewards.
  error GaugeController_NotEnoughRewardAvailable();

  /// @dev Error thrown when an account does not have enough power to vote as requested.
  error GaugeController_NotEnoughPowerAvailable();

  /// @dev Error thrown when an invalid gauge address is provided.
  error GaugeController_InvalidGauge();

  /// @dev Error thrown when an action is attempted on a gauge that does not exist.
  error GaugeController_GaugeNotFound();

  /// @dev Error thrown when the msg.sender for pull() is not a gauge or a approved bridge adapter.
  error GaugeController_NotGauge();

  /// @dev Error thrown when a gauge tries to pull rewards for an epoch which already had its rewards pulled.
  error GaugeController_RewardAlreadyPulled();

  /// @notice Emitted when a vote is cast.
  /// @param voteParams The parameters for the vote.
  event Voted(VoteParams voteParams);

  /// @notice Emitted when a gauge pulls its reward for the epoch.
  /// @param pullParams The parameters for the pull.
  /// @param reward Amount of reward.
  event RewardPulled(PullParams pullParams, uint256 reward);

  /// @notice Emitted when a bridge adapter's status is updated.
  /// @param bridgeAdapter The address of the bridge adapter.
  /// @param add True if the adapter is added, false if removed.
  event BridgeAdapterUpdated(address bridgeAdapter, bool add);

  /// @notice Emitted when the total rewards per epoch is changed
  /// @param totalRewardsPerEpoch uint256 amount for total reward per epoch
  event SetTotalRewardsPerEpoch(uint256 totalRewardsPerEpoch);

  /// @notice Emitted when a new gauge is added
  /// @param gaugeInfo The GaugeInfo struct
  event GaugeAdded(GaugeInfo gaugeInfo);

  /// @notice Emitted when a gauge is removed
  /// @param gaugeInfo The GaugeInfo struct
  event GaugeRemoved(GaugeInfo gaugeInfo);

  /// @notice Calculates the current epoch based on the genesis time and epoch length.
  /// @return _epoch current epoch number.
  function epoch() external view returns (uint256 _epoch);

  /// @notice Computes the rewards for a gauge based on votes in a given epoch.
  /// @param _id The unique identifier of the gauge.
  /// @param _epoch The epoch for which to compute rewards.
  /// @return reward The amount of reward computed.
  function computeRewards(bytes32 _id, uint256 _epoch) external view returns (uint256 reward);

  /// @notice Allows an account to vote on a gauge with its voting power.
  /// @param _voteParams Parameters including the gauge ID, power to allocate, and total power.
  function vote(VoteParams calldata _voteParams) external;

  /// @notice Pulls computed rewards for a gauge for a given epoch.
  /// @param _pullParams Parameters including the gauge ID and the epoch.
  /// @return reward The amount of reward pulled.
  function pull(PullParams calldata _pullParams) external returns (uint256 reward);
}

interface ISykMigrator {
  function dpxConversionRate() external returns (uint256);
  function migrate(address _token, uint256 _amount) external;
}

interface IStrykeTokenBase is IERC20Metadata {
  /// @notice Mints tokens for authorized parties
  /// @dev Can only be called by admin
  /// @param _to address to mint tokens to
  /// @param _amount amount of tokens to mint
  function mint(address _to, uint256 _amount) external;

  /// @notice Burns tokens for authorized parties
  /// @dev Can only be called by admin
  /// @param _account address to burn tokens from
  /// @param _amount amount of tokens to burn
  function burn(address _account, uint256 _amount) external;
}

interface IStrykeTokenRoot is IStrykeTokenBase {
  /// @notice Emitted on changes to inflation per year
  /// @param inflationPerYear the inflation per year
  /// @param emissionRatePerSecond the emission rate per second
  event InflationPerYearSet(uint256 inflationPerYear, uint256 emissionRatePerSecond);

  /// @notice Reverts with this error if more tokens are trying to be emitted than the allowed emissions
  error StrykeTokenRoot_InflationExceeding();

  /// @notice Returns the timestamp of the deployment of this contract
  function genesis() external view returns (uint256);

  /// @notice Returns the amount of tokens that can be emitted per year
  function inflationPerYear() external view returns (uint256);

  /// @notice Returns the token emission per second based on the inflation per year
  function emissionRatePerSecond() external view returns (uint256);

  /// @notice Returns the max supply of the token
  function maxSupply() external view returns (uint256);

  function availableSupply() external view returns (uint256);

  /// @notice Function for token emission
  /// @dev Ensures no more tokens than the allowed inflation can be minted. Can only be called by authorized addresses.
  /// @param _amount amount of tokens to mint
  function stryke(uint256 _amount) external;

  /// @notice Function to set token inflation per year
  /// @dev Can only be called by admin
  /// @param _inflationPerYear the inflation per year to set
  function setInflationPerYear(uint256 _inflationPerYear) external;
}
