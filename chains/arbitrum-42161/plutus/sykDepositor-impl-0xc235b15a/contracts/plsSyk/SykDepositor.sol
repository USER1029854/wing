// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol';
import '@openzeppelin/contracts-upgradeable/access/Ownable2StepUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/utils/PausableUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/utils/ReentrancyGuardUpgradeable.sol';
import '@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol';
import { ISykStaker, ITokenMinterMulti, IWhitelist } from '../interfaces/Common.sol';

contract SykDepositor is Ownable2StepUpgradeable, PausableUpgradeable, ReentrancyGuardUpgradeable, UUPSUpgradeable {
  using SafeERC20 for IERC20;

  IERC20 public syk;
  address public minter;
  address public staker;
  IWhitelist public whitelist;

  mapping(address => bool) handlers;

  /// @custom:oz-upgrades-unsafe-allow constructor
  constructor() {
    _disableInitializers();
  }

  function initialize(address _syk, address _staker, address _minter) public initializer {
    OwnableUpgradeable.__Ownable_init(msg.sender);
    Ownable2StepUpgradeable.__Ownable2Step_init();
    UUPSUpgradeable.__UUPSUpgradeable_init();
    PausableUpgradeable.__Pausable_init();
    ReentrancyGuardUpgradeable.__ReentrancyGuard_init();

    syk = IERC20(_syk);
    staker = _staker;
    minter = _minter;
    _pause();
  }

  /**
   * Deposit asset for plsAsset
   */
  function deposit(uint256 _amount) public whenNotPaused {
    _isEligibleSender();
    _deposit(msg.sender, msg.sender, _amount);
  }

  function depositAll() external {
    deposit(syk.balanceOf(msg.sender));
  }

  function handleDepositFor(address _user, uint256 _amount) external whenNotPaused {
    if (handlers[msg.sender] == false) revert UNAUTHORIZED();
    _deposit(msg.sender, _user, _amount);
  }

  /** PRIVATE FUNCTIONS */
  function _deposit(address _from, address _user, uint256 _amount) internal nonReentrant {
    if (_amount < 0.01 ether) revert FAILED('min deposit: 0.01 Syk');

    syk.safeTransferFrom(_from, address(this), _amount);
    syk.approve(staker, _amount);
    ISykStaker(staker).stake(_amount);
    ITokenMinterMulti(minter).mint(_from, _amount);

    emit Deposited(_user, _amount);
  }

  function _isEligibleSender() internal view {
    if (msg.sender != tx.origin && whitelist.isWhitelisted(msg.sender) == false)
      revert UNAUTHORIZED();
  }

  /** OWNER FUNCTIONS */
  function _authorizeUpgrade(address newImplementation) internal virtual override onlyOwner {}

  function setWhitelist(address _whitelist) external onlyOwner {
    emit WhitelistUpdated(_whitelist, address(whitelist));
    whitelist = IWhitelist(_whitelist);
  }

  function setHandler(address _handler, bool _isActive) external onlyOwner {
    handlers[_handler] = _isActive;
    emit HandlerUpdated(_handler, _isActive);
  }

  /**
    Retrieve stuck funds
   */
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

  event WhitelistUpdated(address _new, address _old);
  event HandlerUpdated(address _address, bool _isActive);
  event Deposited(address indexed _user, uint256 _amount);

  error FAILED(string reason);
  error UNAUTHORIZED();
}
