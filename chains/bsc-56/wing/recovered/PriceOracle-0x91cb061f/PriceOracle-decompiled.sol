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
    bool public constant isPriceOracle = 0xBool(true);
    
    uint256 public unresolved_d851e05d;
    address public owner;
    mapping(bytes32 => bytes32) storage_map_f;
    address public operator;
    bytes32 store_e;
    mapping(bytes32 => bytes32) storage_map_d;
    
    event OwnershipTransferred(address, address);
    
    /// @custom:selector    0x715018a6
    /// @custom:signature   renounceOwnership() public payable
    function renounceOwnership() public payable {
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_d = var_d;
        emit OwnershipTransferred(address(owner), 0);
        owner = uint96(owner);
    }
    
    /// @custom:selector    0x6bc98166
    /// @custom:signature   Unresolved_6bc98166(uint256 arg0, uint256 arg1) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_6bc98166(uint256 arg0, uint256 arg1) public view {
        require(!arg0 > 0x0100000000);
        require(!arg1 > 0x0100000000);
        var_a = var_a + (0x20 + (0x20 * (arg1)));
        var_c = msg.data[36:36];
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_h = var_h;
        require(var_a.length == var_a.length);
        require(!(address(var_c) == 0), "invalid priceAddress");
    }
    
    /// @custom:selector    0xac7475ed
    /// @custom:signature   updateOperator(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function updateOperator(address arg0) public payable {
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_d = var_d;
        operator = (address(arg0)) | (uint96(operator));
    }
    
    /// @custom:selector    0xbcf8a99e
    /// @custom:signature   Unresolved_bcf8a99e(uint256 arg0, uint256 arg1) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_bcf8a99e(uint256 arg0, uint256 arg1) public view {
        require(!arg0 > 0x0100000000);
        require(!arg1 > 0x0100000000);
        var_a = var_a + (0x20 + (0x20 * (arg1)));
        require(msg.sender == (address(operator)), "Ownable: caller is not the operator");
        require(var_a.length == var_a.length);
    }
    
    /// @custom:selector    0x16345f18
    /// @custom:signature   getLatestPrice(address arg0) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getLatestPrice(address arg0) public payable returns (bool) {
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).latestRoundData(); // staticcall
        require(!ret0.length < 0xa0);
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).decimals(); // staticcall
        require(!ret0.length < 0x20);
        address var_b = address(arg0);
        require(!bytes1(storage_map_d[var_b]));
        require(address(store_e).code.length);
        (bool success, bytes memory ret0) = address(store_e).latestRoundData(); // staticcall
        require(!ret0.length < 0xa0);
        require(address(store_e).code.length);
        (bool success, bytes memory ret0) = address(store_e).decimals(); // staticcall
        require(!ret0.length < 0x20);
        require(0x0a ** (bytes1(var_d.length)));
        require(0x0a ** (bytes1(var_d.length)));
        return (var_e * (var_e) / (0x0a ** (bytes1(var_d.length))) * (0x0a ** unresolved_d851e05d)) / (0x0a ** (bytes1(var_d.length)));
    }
    
    /// @custom:selector    0xf2fde38b
    /// @custom:signature   transferOwnership(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function transferOwnership(address arg0) public payable {
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_d = var_d;
        require(address(arg0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(address(owner), address(arg0));
        owner = (address(arg0)) | (uint96(owner));
    }
    
    /// @custom:selector    0x170eaa0f
    /// @custom:signature   Unresolved_170eaa0f(address arg0) public view returns (address)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_170eaa0f(address arg0) public view returns (address) {
        address var_a = address(arg0);
        return address(storage_map_f[var_a]);
    }
    
    /// @custom:selector    0xda055fa7
    /// @custom:signature   Unresolved_da055fa7(uint256 arg0) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_da055fa7(uint256 arg0) public view {
        require(!arg0 > 0x0100000000);
        var_c = msg.data[36:36];
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_g = var_g;
        require(!(address(var_c) == 0), "invalid priceAddress");
    }
    
    /// @custom:selector    0xb2771263
    /// @custom:signature   Unresolved_b2771263(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_b2771263(address arg0) public view returns (uint256) {
        address var_b = address(arg0);
        return storage_map_d[var_b];
    }
    
    /// @custom:selector    0xadac5cd7
    /// @custom:signature   Unresolved_adac5cd7(address arg0) public view returns (address)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_adac5cd7(address arg0) public view returns (address) {
        address var_b = address(arg0);
        return address(storage_map_d[var_b]);
    }
    
    /// @custom:selector    0x6ae028a3
    /// @custom:signature   Unresolved_6ae028a3(uint256 arg0) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_6ae028a3(uint256 arg0) public view {
        require(!arg0 > 0x0100000000);
        var_c = msg.data[36:36];
        require(msg.sender == (address(owner)), "Ownable: caller is not the owner");
        var_g = var_g;
        require(!(address(var_c) == 0), "invalid priceAddress");
    }
    
    /// @custom:selector    0xfc57d4df
    /// @custom:signature   getUnderlyingPrice(address arg0) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getUnderlyingPrice(address arg0) public payable returns (bool) {
        address var_a = address(arg0);
        require(storage_map_f[var_a]);
        require(storage_map_f[var_a]);
        require(address(arg0));
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).decimals(); // staticcall
        require(!ret0.length < 0x20);
        require(0x0a ** (bytes1(var_d.length)));
        return storage_map_f[var_a] / (0x0a ** (bytes1(var_d.length)));
        var_a = address(arg0);
        require(address(storage_map_f[var_a]));
        require(address(storage_map_f[var_a]).code.length);
        (bool success, bytes memory ret0) = address(storage_map_f[var_a]).latestRoundData(); // staticcall
        require(!ret0.length < 0xa0);
        require(address(storage_map_f[var_a]).code.length);
        (bool success, bytes memory ret0) = address(storage_map_f[var_a]).decimals(); // staticcall
        require(!ret0.length < 0x20);
        var_a = address(storage_map_f[var_a]);
        require(!bytes1(storage_map_f[var_a]));
        require(address(store_e).code.length);
        (bool success, bytes memory ret0) = address(store_e).latestRoundData(); // staticcall
        require(!ret0.length < 0xa0);
        require(address(store_e).code.length);
        (bool success, bytes memory ret0) = address(store_e).decimals(); // staticcall
        require(!ret0.length < 0x20);
        require(0x0a ** (bytes1(var_d.length)));
        require(0x0a ** (bytes1(var_d.length)));
    }
    
    /// @custom:selector    0x976fc79e
    /// @custom:signature   Unresolved_976fc79e(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_976fc79e(address arg0) public view returns (bool) {
        address var_b = address(arg0);
        return !(!bytes1(storage_map_d[var_b]));
    }
}