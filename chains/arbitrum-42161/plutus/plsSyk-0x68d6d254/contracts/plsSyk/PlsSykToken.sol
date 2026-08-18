// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;
import '@openzeppelin/contracts/token/ERC20/ERC20.sol';
import '@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol';
import '@openzeppelin/contracts/access/Ownable2Step.sol';
import { ITokenMinterMulti } from '../interfaces/Common.sol';

contract PlsSykToken is ITokenMinterMulti, ERC20, Ownable2Step, ERC20Permit {
  mapping(address => bool) public isHandler;
  mapping(address => bool) public isMinter;

  constructor()
    ERC20('PlsSyk by Plutus', 'PlsSyk')
    ERC20Permit('PlsSyk by Plutus')
    Ownable(msg.sender)
  {}

  function mint(address _to, uint256 _amount) external {
    if (!isMinter[msg.sender]) revert UNAUTHORIZED();
    _mint(_to, _amount);
  }

  function burn(address _from, uint256 _amount) external {
    if (!isMinter[msg.sender]) revert UNAUTHORIZED();
    _burn(_from, _amount);
  }

  /** OWNER FUNCTIONS */
  function updateMinter(address _minter, bool _isActive) external onlyOwner {
    isMinter[_minter] = _isActive;
    emit MinterUpdated(_minter, _isActive);
  }

  function updateHandler(address _handler, bool _isActive) external onlyOwner {
    isHandler[_handler] = _isActive;
    emit HandlerUpdated(_handler, _isActive);
  }

  event InPrivateTransferMode(bool _isInPrivateTransferMode);

  error UNAUTHORIZED();
}
