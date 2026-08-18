// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/// @title            Decompiled Contract
/// @author           Jonathan Becker <jonathan@jbecker.dev>
/// @custom:version   heimdall-rs v0.9.2
///
/// @notice           This contract was decompiled using the heimdall-rs decompiler.
///                     It was generated directly by tracing the EVM opcodes from this contract.
///                     As a result, it may not compile or even be valid solidity code.
///                     Despite this, it should be obvious what each function does. Overall
///                     logic should have been preserved throughout decompiling.
///
/// @custom:github    You can find the open-source decompiler here:
///                       https://heimdall.rs

contract DecompiledContract {
    address public admin;
    address public pendingAdmin;
    address public pendingComptrollerImplementation;
    address public comptrollerImplementation;
    address public operator;
    
    event NewPendingAdmin(address, address);
    event NewImplementation(address, address);
    event NewAdmin(address, address);
    event Failure(uint256, uint256, uint256);
    event NewPendingImplementation(address, address);
    
    /// @custom:selector    0xe9c714f2
    /// @custom:signature   _acceptAdmin() public returns (uint256)
    function _acceptAdmin() public returns (uint256) {
        if (!msg.sender == (address(pendingAdmin))) {
            if (msg.sender == (address(pendingAdmin))) {
                if (!0x01 > 0x16) {
                    if (!0 > 0x14) {
                        emit Failure(0x01, 0, 0);
                        if (!0x01 > 0x16) {
                            return 0x01;
                            admin = (address(pendingAdmin)) | (uint96(admin));
                            pendingAdmin = uint96(pendingAdmin);
                            emit NewAdmin(address(admin), address(pendingAdmin | (uint96(admin))));
                            emit NewPendingAdmin(address(pendingAdmin), address(pendingAdmin));
                            return 0;
                            if (msg.sender) {
                                admin = (address(pendingAdmin)) | (uint96(admin));
                                pendingAdmin = uint96(pendingAdmin);
                                emit NewAdmin(address(admin), address(pendingAdmin | (uint96(admin))));
                                emit NewPendingAdmin(address(pendingAdmin), address(pendingAdmin));
                                return 0;
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0xb71d1a0c
    /// @custom:signature   _setPendingAdmin(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPendingAdmin(address arg0) public returns (uint256) {
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x16);
        require(!0x0e > 0x14);
        emit Failure(0x01, 0x0e, 0);
        require(!0x01 > 0x16);
        return 0x01;
        pendingAdmin = (address(arg0)) | (uint96(pendingAdmin));
        emit NewPendingAdmin(address(pendingAdmin), address(arg0));
        return 0;
    }
    
    /// @custom:selector    0xc1e80334
    /// @custom:signature   _acceptImplementation() public returns (uint256)
    function _acceptImplementation() public returns (uint256) {
        if (!msg.sender == (address(pendingComptrollerImplementation))) {
            if (msg.sender == (address(pendingComptrollerImplementation))) {
                if (!0x01 > 0x16) {
                    if (!0x01 > 0x14) {
                        emit Failure(0x01, 0x01, 0);
                        if (!0x01 > 0x16) {
                            return 0x01;
                            comptrollerImplementation = (address(pendingComptrollerImplementation)) | (uint96(comptrollerImplementation));
                            pendingComptrollerImplementation = uint96(pendingComptrollerImplementation);
                            emit NewImplementation(address(comptrollerImplementation), address(pendingComptrollerImplementation | (uint96(comptrollerImplementation))));
                            emit NewPendingImplementation(address(pendingComptrollerImplementation), address(pendingComptrollerImplementation));
                            return 0;
                            if (address(pendingComptrollerImplementation)) {
                                comptrollerImplementation = (address(pendingComptrollerImplementation)) | (uint96(comptrollerImplementation));
                                pendingComptrollerImplementation = uint96(pendingComptrollerImplementation);
                                emit NewImplementation(address(comptrollerImplementation), address(pendingComptrollerImplementation | (uint96(comptrollerImplementation))));
                                emit NewPendingImplementation(address(pendingComptrollerImplementation), address(pendingComptrollerImplementation));
                                return 0;
                            }
                        }
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0xe992a041
    /// @custom:signature   _setPendingImplementation(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPendingImplementation(address arg0) public returns (uint256) {
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x16);
        require(!0x0f > 0x14);
        emit Failure(0x01, 0x0f, 0);
        require(!0x01 > 0x16);
        return 0x01;
        pendingComptrollerImplementation = (uint96(pendingComptrollerImplementation)) | (address(arg0));
        emit NewPendingImplementation(address(pendingComptrollerImplementation), address(uint96(pendingComptrollerImplementation) | (arg0)));
        return 0;
    }
}