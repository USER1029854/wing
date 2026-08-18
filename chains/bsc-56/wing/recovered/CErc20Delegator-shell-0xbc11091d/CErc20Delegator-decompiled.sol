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
    bool public constant isFToken = 0xBool(true);
    
    address public admin;
    mapping(bytes32 => bytes32) storage_map_f;
    uint256 public totalReserves;
    uint256 public reserveFactorMantissa;
    address public pendingAdmin;
    uint256 public accrualBlockNumber;
    bool public decimals;
    address public implementation;
    uint256 public totalSupply;
    uint256 public unresolved_6c4603b4;
    bytes32 store_e;
    address public comptroller;
    uint256 public totalBorrows;
    uint256 public borrowIndex;
    string public name;
    address public interestRateModel;
    
    event NewImplementation(address, address);
    
    /// @custom:selector    0x095ea7b3
    /// @custom:signature   approve(address arg0, uint256 arg1) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function approve(address arg0, uint256 arg1) public returns (bool) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        return var_c;
        require(!success == 0);
    }
    
    /// @custom:selector    0xe9c714f2
    /// @custom:signature   _acceptAdmin() public returns (uint256)
    function _acceptAdmin() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(var_b.length < 0x20);
        require((var_b.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation)._acceptAdmin(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_a;
        require(!success == 0);
    }
    
    /// @custom:selector    0x3b1d21a2
    /// @custom:signature   getCash() public returns (uint256)
    function getCash() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(!bytes1(var_b.length));
        var_b = var_b.length + (0x20 + (0x20 + (0x24 + var_b)));
        require(var_b.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_j < 0x20);
        require(!var_a > 0x0100000000);
        require(!((0x80 + var_a) + 0x20) > (0x80 + var_j));
        require(!((0x80 + var_j) < (var_k + ((0x80 + var_a) + 0x20))) | (var_k > 0x0100000000));
        require(!0 < (var_k));
        require(!bytes1(var_k));
        var_b = (var_k) + (0x20 + var_b);
        require(!var_b.length < 0x20);
        return ;
        require(!success == 0);
    }
    
    /// @custom:selector    0xa9059cbb
    /// @custom:signature   transfer(address arg0, uint256 arg1) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function transfer(address arg0, uint256 arg1) public returns (bool) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        return var_c;
        require(!success == 0);
    }
    
    /// @custom:selector    0x601a0bf1
    /// @custom:signature   _reduceReserves(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _reduceReserves(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x3e941010
    /// @custom:signature   _addReserves(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _addReserves(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x17bfdfbc
    /// @custom:signature   borrowBalanceCurrent(address arg0) public returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceCurrent(address arg0) public returns (bytes memory) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        uint224 var_d = 0x17bfdfbc00000000000000000000000000000000000000000000000000000000 | (uint224(var_e));
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x40);
        return abi.encodePacked(var_b, var_d);
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x3af9e669
    /// @custom:signature   balanceOfUnderlying(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOfUnderlying(address arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0xdb006a75
    /// @custom:signature   redeem(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeem(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0xae9d70b0
    /// @custom:signature   supplyRatePerBlock() public returns (uint256)
    function supplyRatePerBlock() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(!bytes1(var_b.length));
        var_b = var_b.length + (0x20 + (0x20 + (0x24 + var_b)));
        require(var_b.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_j < 0x20);
        require(!var_a > 0x0100000000);
        require(!((0x80 + var_a) + 0x20) > (0x80 + var_j));
        require(!((0x80 + var_j) < (var_k + ((0x80 + var_a) + 0x20))) | (var_k > 0x0100000000));
        require(!0 < (var_k));
        require(!bytes1(var_k));
        var_b = (var_k) + (0x20 + var_b);
        require(!var_b.length < 0x20);
        return ;
        require(!success == 0);
    }
    
    /// @custom:selector    0xa3e94ddd
    /// @custom:signature   getBorrowSnapshot(address arg0) public returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getBorrowSnapshot(address arg0) public returns (bytes memory) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(!bytes1(var_c.length));
        var_c = var_c.length + (0x20 + (0x20 + (0x24 + var_c)));
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        require(!var_b > 0x0100000000);
        require(!((0x80 + var_b) + 0x20) > (0x80 + var_k));
        require(!((0x80 + var_k) < (var_l + ((0x80 + var_b) + 0x20))) | (var_l > 0x0100000000));
        require(!0 < (var_l));
        require(!bytes1(var_l));
        var_c = 0x20 + (var_l + (0x20 + var_c) - (bytes1(var_l)));
        require(!var_c.length < 0x40);
        return abi.encodePacked(var_p, var_r);
        require(!success == 0);
    }
    
    /// @custom:selector    0x2608f818
    /// @custom:signature   repayBorrowBehalf(address arg0, uint256 arg1) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function repayBorrowBehalf(address arg0, uint256 arg1) public returns (uint256) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        return var_c;
        require(!success == 0);
    }
    
    /// @custom:selector    0x0933c1ed
    /// @custom:signature   Unresolved_0933c1ed(uint256 arg0) public returns (bytes memory)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_0933c1ed(uint256 arg0) public returns (bytes memory) {
        require(!arg0 > 0x0100000000);
        uint256 var_a = var_a + (0x20 + (((0x1f + (arg0)) / 0x20) * 0x20));
        var_c = msg.data[36:36];
        require(var_a.length < 0x20);
        require((var_a.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation).Unresolved_(var_h); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!0 < var_l);
        require(!bytes1(var_l));
        return abi.encodePacked(0x20, var_l, (~((0x0100 ** (0x20 - (bytes1(var_l)))) - 0x01)) & (var_n));
        return abi.encodePacked(0x20, var_l);
        var_a = var_a + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        require(!bytes1(var_a.length));
        return abi.encodePacked(0x20, var_a.length);
        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_s));
    }
    
    /// @custom:selector    0xdd62ed3e
    /// @custom:signature   allowance(address arg0, address arg1) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function allowance(address arg0, address arg1) public returns (uint256) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(!bytes1(var_d.length));
        var_d = var_d.length + (0x20 + (0x20 + (0x24 + var_d)));
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        require(!var_c > 0x0100000000);
        require(!((0x80 + var_c) + 0x20) > (0x80 + var_l));
        require(!((0x80 + var_l) < (var_m + ((0x80 + var_c) + 0x20))) | (var_m > 0x0100000000));
        require(!0 < (var_m));
        require(!bytes1(var_m));
        var_d = 0x20 + (var_m + (0x20 + var_d) - (bytes1(var_m)));
        require(!var_d.length < 0x20);
        return var_q;
        require(!success == 0);
    }
    
    /// @custom:selector    0xf8f9da28
    /// @custom:signature   borrowRatePerBlock() public returns (uint256)
    function borrowRatePerBlock() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(!bytes1(var_b.length));
        var_b = var_b.length + (0x20 + (0x20 + (0x24 + var_b)));
        require(var_b.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_j < 0x20);
        require(!var_a > 0x0100000000);
        require(!((0x80 + var_a) + 0x20) > (0x80 + var_j));
        require(!((0x80 + var_j) < (var_k + ((0x80 + var_a) + 0x20))) | (var_k > 0x0100000000));
        require(!0 < (var_k));
        require(!bytes1(var_k));
        var_b = (var_k) + (0x20 + var_b);
        require(!var_b.length < 0x20);
        return ;
        require(!success == 0);
    }
    
    /// @custom:selector    0x4487152f
    /// @custom:signature   Unresolved_4487152f(uint256 arg0) public returns (bytes memory)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_4487152f(uint256 arg0) public returns (bytes memory) {
        require(!arg0 > 0x0100000000);
        uint256 var_a = var_a + (0x20 + (((0x1f + (arg0)) / 0x20) * 0x20));
        uint256 var_b = (arg0);
        require(!bytes1(var_a.length));
        var_a = 0x20 + ((var_a.length + (0x20 + (0x20 + (0x24 + var_a)))) - (bytes1(var_a.length)));
        require(var_a.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        require(!var_b > 0x0100000000);
        require(!((0x80 + var_b) + 0x20) > (0x80 + var_l));
        require(!((0x80 + var_l) < (var_m + ((0x80 + var_b) + 0x20))) | (var_m > 0x0100000000));
        require(!0 < (var_m));
        require(!bytes1(var_m));
        var_a = 0x20 + (var_m + (0x20 + var_a) - (bytes1(var_m)));
        require(!bytes1(var_a.length));
        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_s));
        return abi.encodePacked(0x20, var_a.length);
        require(!success == 0);
    }
    
    /// @custom:selector    0x12c0710c
    /// @custom:signature   withdrawAllToken(uint256 arg0) public returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function withdrawAllToken(uint256 arg0) public returns (bool) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0xa0712d68
    /// @custom:signature   mint(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function mint(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0xf5e3c462
    /// @custom:signature   liquidateBorrow(address arg0, uint256 arg1, address arg2) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["address", "uint160", "bytes20", "int160"]
    function liquidateBorrow(address arg0, uint256 arg1, address arg2) public returns (uint256) {
        uint256 var_d = 0x64 + (var_e - var_e);
        uint256 var_e = var_e + 0x84;
        require(var_e.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_d;
        require(!success == 0);
    }
    
    /// @custom:selector    0xc37f68e2
    /// @custom:signature   getAccountSnapshot(address arg0) public returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAccountSnapshot(address arg0) public returns (bytes memory) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(!bytes1(var_c.length));
        var_c = var_c.length + (0x20 + (0x20 + (0x24 + var_c)));
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        require(!var_b > 0x0100000000);
        require(!((0x80 + var_b) + 0x20) > (0x80 + var_k));
        require(!((0x80 + var_k) < (var_l + ((0x80 + var_b) + 0x20))) | (var_l > 0x0100000000));
        require(!0 < (var_l));
        require(!bytes1(var_l));
        var_c = 0x20 + (var_l + (0x20 + var_c) - (bytes1(var_l)));
        require(!var_c.length < 0x80);
        return abi.encodePacked(var_p, var_r, var_t, var_v);
        require(!success == 0);
    }
    
    /// @custom:selector    0xc5cc93de
    /// @custom:signature   repayByInsurance(address arg0, uint256 arg1) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function repayByInsurance(address arg0, uint256 arg1) public returns (uint256) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        return var_c;
        require(!success == 0);
    }
    
    /// @custom:selector    0xb2a02ff1
    /// @custom:signature   seize(address arg0, address arg1, uint256 arg2) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function seize(address arg0, address arg1, uint256 arg2) public returns (uint256) {
        uint256 var_d = 0x64 + (var_e - var_e);
        uint256 var_e = var_e + 0x84;
        require(var_e.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_d;
        require(!success == 0);
    }
    
    /// @custom:selector    0xbd6d894d
    /// @custom:signature   exchangeRateCurrent() public returns (uint256)
    function exchangeRateCurrent() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(var_b.length < 0x20);
        require((var_b.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation).exchangeRateCurrent(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_a;
        require(!success == 0);
    }
    
    /// @custom:selector    0x95d89b41
    /// @custom:signature   symbol() public view returns (string memory)
    function symbol() public view returns (string memory) {
        bytes1 var_a = 0x20 + (var_a + (0x20 * (((store_e & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!bytes1(store_e)))) / 0x02) + 0x1f) / 0x20)));
        if (!(store_e & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_e)))) / 0x02) {
            if (0x1f < (store_e & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_e))) / 0x02)) {
                var_c = 0x02;
                if ((var_a + 0x20) + (store_e & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_e))) / 0x02) > (0x20 + (var_a + 0x20))) {
                    if (!var_a.length) {
                        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_g));
                        return abi.encodePacked(0x20, var_a.length);
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x0e752702
    /// @custom:signature   repayBorrow(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function repayBorrow(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0xf2b3abbd
    /// @custom:signature   _setInterestRateModel(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setInterestRateModel(address arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x70a08231
    /// @custom:signature   balanceOf(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOf(address arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(!bytes1(var_c.length));
        var_c = var_c.length + (0x20 + (0x20 + (0x24 + var_c)));
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        require(!var_b > 0x0100000000);
        require(!((0x80 + var_b) + 0x20) > (0x80 + var_k));
        require(!((0x80 + var_k) < (var_l + ((0x80 + var_b) + 0x20))) | (var_l > 0x0100000000));
        require(!0 < (var_l));
        require(!bytes1(var_l));
        var_c = 0x20 + (var_l + (0x20 + var_c) - (bytes1(var_l)));
        require(!var_c.length < 0x20);
        return var_p;
        require(!success == 0);
    }
    
    /// @custom:selector    0xa6afed95
    /// @custom:signature   accrueInterest() public returns (uint256)
    function accrueInterest() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(var_b.length < 0x20);
        require((var_b.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation).accrueInterest(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_a;
        require(!success == 0);
    }
    
    /// @custom:selector    0x555bcc40
    /// @custom:signature   Unresolved_555bcc40(address arg0, uint256 arg1, uint256 arg2) public
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function Unresolved_555bcc40(address arg0, uint256 arg1, uint256 arg2) public {
        require(!arg2 > 0x0100000000);
        uint256 var_a = var_a + (0x20 + (((0x1f + (arg2)) / 0x20) * 0x20));
        var_c = msg.data[36:36];
        require(msg.sender == (address(admin)), "CErc20Delegator::_setImplementation: Caller must be admin");
        require(!arg1);
        var_a = var_a + 0x24;
        require(var_a.length < 0x20);
        require((var_a.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation)._resignImplementation(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        var_m = 0x20;
        implementation = (uint96(implementation)) | (address(arg0));
        require(!bytes1(var_a.length));
        var_a = var_m + ((var_a.length + (var_a + 0x64)) - (bytes1(var_a.length)));
        require(var_a.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        emit NewImplementation(address(implementation), address(implementation));
        require(!success == 0);
        emit NewImplementation(address(implementation), address(implementation));
    }
    
    /// @custom:selector    0x4576b5db
    /// @custom:signature   _setComptroller(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setComptroller(address arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x23b872dd
    /// @custom:signature   transferFrom(address arg0, address arg1, uint256 arg2) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function transferFrom(address arg0, address arg1, uint256 arg2) public returns (bool) {
        uint256 var_d = 0x64 + (var_e - var_e);
        uint256 var_e = var_e + 0x84;
        require(var_e.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_d;
        require(!success == 0);
    }
    
    /// @custom:selector    0x8cd01307
    /// @custom:signature   Unresolved_8cd01307(uint256 arg0, uint256 arg1) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_8cd01307(uint256 arg0, uint256 arg1) public returns (uint256) {
        uint256 var_c = 0x44 + (var_d - var_d);
        uint256 var_d = var_d + 0x64;
        require(var_d.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_l < 0x20);
        return var_c;
        require(!success == 0);
    }
    
    /// @custom:selector    0x73acee98
    /// @custom:signature   totalBorrowsCurrent() public returns (uint256)
    function totalBorrowsCurrent() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(var_b.length < 0x20);
        require((var_b.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20);
        (bool success, bytes memory ret0) = address(implementation).totalBorrowsCurrent(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_m < 0x20);
        return var_a;
        require(!success == 0);
    }
    
    /// @custom:selector    0xb71d1a0c
    /// @custom:signature   _setPendingAdmin(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPendingAdmin(address arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x182df0f5
    /// @custom:signature   exchangeRateStored() public returns (uint256)
    function exchangeRateStored() public returns (uint256) {
        var_a = 0x04;
        uint256 var_b = var_b + 0x24;
        require(!bytes1(var_b.length));
        var_b = var_b.length + (0x20 + (0x20 + (0x24 + var_b)));
        require(var_b.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_j < 0x20);
        require(!var_a > 0x0100000000);
        require(!((0x80 + var_a) + 0x20) > (0x80 + var_j));
        require(!((0x80 + var_j) < (var_k + ((0x80 + var_a) + 0x20))) | (var_k > 0x0100000000));
        require(!0 < (var_k));
        require(!bytes1(var_k));
        var_b = (var_k) + (0x20 + var_b);
        require(!var_b.length < 0x20);
        return ;
        require(!success == 0);
    }
    
    /// @custom:selector    0x852a12e3
    /// @custom:signature   redeemUnderlying(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeemUnderlying(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
    
    /// @custom:selector    0x95dd9193
    /// @custom:signature   borrowBalanceStored(address arg0) public returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceStored(address arg0) public returns (bytes memory) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(!bytes1(var_c.length));
        var_c = var_c.length + (0x20 + (0x20 + (0x24 + var_c)));
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(this).adfepixw(); // staticcall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        require(!var_b > 0x0100000000);
        require(!((0x80 + var_b) + 0x20) > (0x80 + var_k));
        require(!((0x80 + var_k) < (var_l + ((0x80 + var_b) + 0x20))) | (var_l > 0x0100000000));
        require(!0 < (var_l));
        require(!bytes1(var_l));
        var_c = 0x20 + (var_l + (0x20 + var_c) - (bytes1(var_l)));
        require(!var_c.length < 0x40);
        return abi.encodePacked(var_p, var_r);
        require(!success == 0);
    }
    
    /// @custom:selector    0xfca7820b
    /// @custom:signature   _setReserveFactor(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _setReserveFactor(uint256 arg0) public returns (uint256) {
        uint256 var_b = 0x24 + (var_c - var_c);
        uint256 var_c = var_c + 0x44;
        require(var_c.length < 0x20);
        (bool success, bytes memory ret0) = address(implementation).adfepixw(); // delegatecall
        require(ret0.length == 0);
        require(!success == 0);
        require(!var_k < 0x20);
        return var_b;
        var_c = var_c + (uint248(ret0.length + 0x3f));
        require(!success == 0);
        if ((var_c.length + 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0) < 0x20) {
        }
    }
}