// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import { IERC20 } from '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import { SafeERC20 } from '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import { Ownable2StepUpgradeable, OwnableUpgradeable } from '@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol';
import { PausableUpgradeable } from '@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol';
import { UUPSUpgradeable } from '@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol';
import { ReentrancyGuardUpgradeable } from '@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol';
import { ITokenMinterMulti, ISykDepositor } from '../interfaces/Common.sol';
import { ISykMigrator } from '../interfaces/Stryke.sol';

/**
 * @notice Contract that allows users to migrate their balance of plsDPX into plsSyk.
 */
contract PlsSykMigratorV2 is
  Ownable2StepUpgradeable,
  PausableUpgradeable,
  ReentrancyGuardUpgradeable,
  UUPSUpgradeable
{
  using SafeERC20 for IERC20;

  event Migrated(address indexed sender, uint256 amount);
  error INSUFFICIENT_BALANCE();
  error INVALID_CONVERSION();

  IERC20 public plsSyk;
  IERC20 public plsDpx;
  IERC20 public dpx;
  IERC20 public syk;
  ISykMigrator public sykMigrator;
  ISykDepositor public sykDepositor;

  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  function initialize(
    address _plsSyk,
    address _plsDpx,
    address _dpx,
    address _syk,
    address _sykMigrator,
    address _sykDepositor
  ) public initializer {
    OwnableUpgradeable.__Ownable_init(msg.sender);
    Ownable2StepUpgradeable.__Ownable2Step_init();
    UUPSUpgradeable.__UUPSUpgradeable_init();
    PausableUpgradeable.__Pausable_init();
    ReentrancyGuardUpgradeable.__ReentrancyGuard_init();

    plsSyk = IERC20(_plsSyk);
    plsDpx = IERC20(_plsDpx);
    dpx = IERC20(_dpx);
    syk = IERC20(_syk);

    sykMigrator = ISykMigrator(_sykMigrator);
    sykDepositor = ISykDepositor(_sykDepositor);

    _pause();
  }

  /**
   * @dev user plsDpx balance must be greater than zero.
   * @dev DPX balance of contract must be greater than or equal to user plsDpx balance.
   */
  function migrate() external nonReentrant whenNotPaused {
    uint256 amount = plsDpx.balanceOf(msg.sender);
    if (amount == 0) revert INSUFFICIENT_BALANCE();
    ITokenMinterMulti(address(plsDpx)).burn(msg.sender, amount);

    uint256 plsSykToUser = (amount * sykMigrator.dpxConversionRate()) / 1e4;
    if (plsSykToUser == 0 || plsSykToUser > plsSyk.balanceOf(address(this))) {
      revert INSUFFICIENT_BALANCE();
    }

    plsSyk.safeTransfer(msg.sender, plsSykToUser);

    emit Migrated(msg.sender, amount);
  }

  /** OWNER FUNCTIONS */

  function adminMigrate() external onlyOwner {
    uint256 dpxBalance = dpx.balanceOf(address(this));
    uint256 prevSykBalance = IERC20(syk).balanceOf(address(this));

    dpx.approve(address(sykMigrator), dpxBalance);
    sykMigrator.migrate(address(dpx), dpxBalance);

    uint256 newSykBalance = IERC20(syk).balanceOf(address(this));
    uint256 sykReceived = newSykBalance - prevSykBalance;

    if (sykReceived == 0) revert INVALID_CONVERSION();
    if (sykReceived != (dpxBalance * sykMigrator.dpxConversionRate()) / 1e4) {
      revert INVALID_CONVERSION();
    }
    syk.approve(address(sykDepositor), sykReceived);
    sykDepositor.deposit(sykReceived);

    ///@dev plsSyk will be minted to this contract
  }
  function _authorizeUpgrade(address newImplementation) internal virtual override onlyOwner {}

  function recoverErc20(IERC20 _erc20, uint _amount) external onlyOwner {
    IERC20(_erc20).safeTransfer(owner(), _amount);
  }

  function setPaused(bool _pauseContract) external onlyOwner {
    if (_pauseContract) {
      _pause();
    } else {
      _unpause();
    }
  }
}
