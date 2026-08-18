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
    
    mapping(bytes32 => bytes32) storage_map_f;
    mapping(bytes32 => bytes32) storage_map_w;
    mapping(bytes32 => bytes32) storage_map_ao;
    address public comptroller;
    mapping(bytes32 => bytes32) storage_map_al;
    uint256 public totalReserves;
    mapping(bytes32 => bytes32) storage_map_am;
    address public interestRateModel;
    mapping(bytes32 => bytes32) storage_map_af;
    mapping(bytes32 => bytes32) storage_map_ak;
    mapping(bytes32 => bytes32) storage_map_ac;
    mapping(bytes32 => bytes32) storage_map_j;
    mapping(bytes32 => bytes32) storage_map_ap;
    mapping(bytes32 => bytes32) storage_map_ar;
    uint256 public totalSupply;
    address public pendingAdmin;
    uint256 public unresolved_6c4603b4;
    mapping(bytes32 => bytes32) storage_map_b;
    uint256 public accrualBlockNumber;
    mapping(bytes32 => bytes32) storage_map_i;
    uint256 public totalBorrows;
    uint256 public borrowIndex;
    uint256 public reserveFactorMantissa;
    mapping(bytes32 => bytes32) storage_map_x;
    mapping(bytes32 => bytes32) storage_map_an;
    mapping(bytes32 => bytes32) storage_map_ae;
    bytes32 store_v;
    uint256 store_p;
    bytes32 store_d;
    mapping(bytes32 => bytes32) storage_map_z;
    mapping(bytes32 => bytes32) storage_map_ah;
    bool public decimals;
    mapping(bytes32 => bytes32) storage_map_ab;
    mapping(bytes32 => bytes32) storage_map_aq;
    mapping(bytes32 => bytes32) storage_map_g;
    mapping(bytes32 => bytes32) storage_map_ad;
    uint256 store_q;
    mapping(bytes32 => bytes32) storage_map_aa;
    mapping(bytes32 => bytes32) storage_map_ai;
    mapping(bytes32 => bytes32) storage_map_y;
    address public implementation;
    mapping(bytes32 => bytes32) storage_map_u;
    mapping(bytes32 => bytes32) storage_map_aj;
    address public admin;
    
    event NewPendingAdmin(address, address);
    event Transfer(address, address, uint256);
    event NewAdmin(address, address);
    event ReservesReduced(address, uint256, uint256);
    event NewReserveFactor(uint256, uint256);
    event RepayBorrow(address, address, uint256, uint256, uint256);
    event NewMarketInterestRateModel(address, address);
    event Approval(address, address, uint256);
    event LiquidateBorrow(address, address, uint256, address, uint256);
    event Failure(uint256, uint256, uint256);
    event ReservesAdded(address, uint256, uint256);
    event NewComptroller(address, address);
    
    /// @custom:selector    0x095ea7b3
    /// @custom:signature   approve(address arg0, uint256 arg1) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function approve(address arg0, uint256 arg1) public payable returns (bool) {
        var_a = address(arg0);
        storage_map_b[var_a] = arg1;
        emit Approval(msg.sender, address(arg0), arg1);
        return 0x01;
    }
    
    /// @custom:selector    0x17bfdfbc
    /// @custom:signature   borrowBalanceCurrent(address arg0) public payable returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceCurrent(address arg0) public payable returns (bytes memory) {
        require(bytes1(store_d), "accrue interest failed");
        store_d = uint248(store_d);
        require(!(block.number == accrualBlockNumber), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        address var_e = address(arg0);
        require(storage_map_f[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_g[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_g[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_g[var_e])) / (storage_map_g[var_e]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_i[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x01 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x01 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_j[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_j[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_j[var_e])) / (storage_map_j[var_e]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        store_d = 0x01 | (uint248(store_d));
        return abi.encodePacked(0, 0);
        var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_h.length;
        var_c = totalBorrows;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_b, var_c); // staticcall
        require(!(ret0.length < 0x20), "accrue interest failed");
        require(!(var_h.length > 0x048c27395000), "accrue interest failed");
        require(accrualBlockNumber > block.number, "accrue interest failed");
        require(!(0x03 > 0x03), "accrue interest failed");
        require(0x03 == 0, "accrue interest failed");
        var_h = 0x20 + var_h;
        var_h = 0x20 + var_h;
        require(var_r, "accrue interest failed");
        require(!(0 > 0x03), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        var_h = var_h + 0x20;
        require(!(0 > 0x03), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        require(!(0 > 0x03), "accrue interest failed");
        require(!(0x09 > 0x11), "accrue interest failed");
        require(!(0x06 > 0x51), "accrue interest failed");
        emit Failure(0x09, 0x06, 0);
        require(!(0x09 > 0x11), "accrue interest failed");
        require(0x09 == 0, "accrue interest failed");
        var_w = 0x20;
        require(var_z, "could not calculate block delta");
        require(var_z, "could not calculate block delta");
        require((totalBorrows * (var_z)) / (var_z) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0x601a0bf1
    /// @custom:signature   _reduceReserves(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _reduceReserves(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x30 > 0x51);
        emit Failure(0, 0x30, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x31 > 0x51);
        var_a = 0x01;
        var_c = 0;
        emit Failure(0x01, 0x31, 0);
        require(!0x01 > 0x11);
        store_d = var_a | (uint248(store_d));
        return 0x01;
        require(accrualBlockNumber == block.number);
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!(ret0.length < 0x20), "reduce reserves unexpected underflow");
        require(!(var_e.length < arg0), "reduce reserves unexpected underflow");
        require(!(arg0 > totalReserves), "reduce reserves unexpected underflow");
        require(!((totalReserves - arg0) > totalReserves), "reduce reserves unexpected underflow");
        totalReserves = totalReserves - arg0;
        var_d = address(admin);
        uint256 var_f = arg0;
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_c ether }transfer(var_d, var_f); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_OUT_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_OUT_FAILED");
        emit ReservesReduced(address(admin), arg0, totalReserves - arg0);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(ret0.length == 0x20, "TOKEN_TRANSFER_OUT_FAILED");
        require(var_i, "TOKEN_TRANSFER_OUT_FAILED");
        emit ReservesReduced(address(admin), arg0, totalReserves - arg0);
        store_d = 0x01 | (uint248(store_d));
        return 0;
    }
    
    /// @custom:selector    0x3e941010
    /// @custom:signature   _addReserves(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _addReserves(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x4e > 0x51);
        uint256 var_c = 0;
        emit Failure(0, 0x4e, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(accrualBlockNumber == block.number);
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        var_d = address(msg.sender);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_c ether }gasprice_bit_ether(var_d); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_IN_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_IN_FAILED");
        var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_g.length < var_g.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!((totalReserves + (var_g.length - var_g.length)) < totalReserves), "add reserves unexpected overflow");
        totalReserves = totalReserves + (var_g.length - var_g.length);
        emit ReservesAdded(msg.sender, var_g.length - var_g.length, totalReserves + (var_g.length - var_g.length));
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(ret0.length == 0x20);
        require(var_h);
        var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_g.length < var_g.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!0x0a > 0x11);
        require(!0x4f > 0x51);
        emit Failure(0x0a, 0x4f, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        var_d = var_g.length;
        var_e = totalBorrows;
        var_f = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_d, var_e, var_f); // staticcall
        require(!ret0.length < 0x20);
        require(!var_g.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = 0x20 + var_g;
        var_c = 0;
        var_g = 0x20 + var_g;
        require(var_p);
        require(!0 > 0x03);
        require(0 == 0);
        var_g = var_g + 0x20;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x51);
        emit Failure(0x09, 0x06, 0);
        require(!0x09 > 0x11);
        require(!0x09);
        require(accrualBlockNumber == block.number);
        address var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_u); // staticcall
        require(!ret0.length < 0x20);
        var_u = address(msg.sender);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_c ether }gasprice_bit_ether(var_u); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_IN_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_IN_FAILED");
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_g.length < var_g.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!((totalReserves + (var_g.length - var_g.length)) < totalReserves), "add reserves unexpected overflow");
        totalReserves = totalReserves + (var_g.length - var_g.length);
        emit ReservesAdded(msg.sender, var_g.length - var_g.length, totalReserves + (var_g.length - var_g.length));
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(ret0.length == 0x20);
        require(var_h);
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_g.length < var_g.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        var_u = 0x20;
        require(!(0x0a > 0x11), "could not calculate block delta");
        require(!(0x4f > 0x51), "could not calculate block delta");
        emit Failure(0x0a, 0x4f, 0);
        require(!(0x0a > 0x11), "could not calculate block delta");
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        require(var_x, "could not calculate block delta");
        require(var_x, "could not calculate block delta");
        require((totalBorrows * (var_x)) / (var_x) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0x1a31d465
    /// @custom:signature   Unresolved_1a31d465(address arg0, address arg1, address arg2, uint256 arg3, uint256 arg4, uint256 arg5, bool arg6) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["uint256", "bytes32", "int256"]
    /// @param              arg6 ["bool", "uint8", "bytes1", "int8"]
    function Unresolved_1a31d465(address arg0, address arg1, address arg2, uint256 arg3, uint256 arg4, uint256 arg5, bool arg6) public payable {
        require(!arg4 > 0x0100000000);
        require(!arg5 > 0x0100000000);
        var_a = var_a + (0x20 + (((0x1f + (arg5)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only admin may initialize the market");
        require(accrualBlockNumber, "market may only be initialized once");
        require(!accrualBlockNumber, "market may only be initialized once");
        store_p = arg3;
        if (arg3) {
            require(arg3, "setting interest rate model failed");
            require(msg.sender == (address(admin)), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            emit Failure(0x01, 0x3f, 0);
            require(!(0x3f > 0x51), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            accrualBlockNumber = block.number;
            borrowIndex = 0x0de0b6b3a7640000;
            require(!0x01, "setting interest rate model failed");
            require(msg.sender == (address(admin)), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            var_e = 0x01;
            emit Failure(0x01, 0x42, 0);
            require(!(0x42 > 0x51), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            require(!0x01, "setting interest rate model failed");
            store_q = var_e + (var_a.length + var_a.length);
            require(0x1f < var_a.length, "setting interest rate model failed");
            require(!var_a.length, "setting interest rate model failed");
            require(!(((var_a + 0x20) + var_a.length) > (var_a + 0x20)), "setting interest rate model failed");
        }
        require(accrualBlockNumber == block.number);
        require(address(arg2).code.length);
        (bool success, bytes memory ret0) = address(arg2).isInterestRateModel(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_a.length, "marker method returned false");
        interestRateModel = (address(arg2)) | (uint96(interestRateModel));
        emit NewMarketInterestRateModel(address(interestRateModel / 0x01), address(arg2));
        require(!0, "setting interest rate model failed");
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).isComptroller(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_a.length, "marker method returned false");
        comptroller = (address(arg1)) | (uint96(comptroller));
        emit NewComptroller(address(comptroller), address(arg1));
        require(!0, "setting comptroller failed");
    }
    
    /// @custom:selector    0xdb006a75
    /// @custom:signature   redeem(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeem(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_d = uint248(store_d);
        require(!(block.number == accrualBlockNumber), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0x27 > 0x51), "one of redeemTokensIn or redeemAmountIn must be zero");
        emit Failure(0, 0x27, 0);
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(!arg0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(totalSupply);
        address var_m = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_m); // staticcall
        if (!ret0.length < 0x20) {
            var_e = 0x20 + var_e;
            require(!ret0.length < 0x20);
            require((totalBorrows + var_e.length) < var_e.length);
            require(!0x02 > 0x03);
            require(0x02 == 0);
            require(totalReserves > 0);
            require(!0x03 > 0x03);
            require(0x03 == 0);
            require(0);
            require(!0 > 0x03);
            var_e = var_e + 0x20;
            require(0 == 0);
            require(!0 > 0x03);
            require(0 == 0);
            require(!0 > 0x03);
            require(!0 > 0x03);
            require(!(var_p) > 0x03);
            require(var_p == 0);
            require(!(var_p) > 0x03);
            require(!0x09 > 0x11);
            emit Failure(0x09, 0x2b, var_p);
            require(!0x2b > 0x51);
            store_d = 0x01 | (uint248(store_d));
            return 0x09;
            require(!0x09 > 0x11);
        }
        require(!0 > 0x03);
        require(!0 > 0x03);
    }
    
    /// @custom:selector    0xae9d70b0
    /// @custom:signature   supplyRatePerBlock() public payable returns (uint256)
    function supplyRatePerBlock() public payable returns (uint256) {
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_c.length;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_b8168816(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_c.length;
    }
    
    /// @custom:selector    0xbf852237
    /// @custom:signature   Unresolved_bf852237(uint256 arg0, uint256 arg1) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_bf852237(uint256 arg0, uint256 arg1) public payable {
        require(!arg0 > 0x0100000000);
        require(!arg1 > 0x0100000000);
        var_a = var_a + (0x20 + (((0x1f + (arg1)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only admin may invoke the method");
        var_i = 0x01;
        if (0x1f < var_a.length) {
            store_q = var_i + (var_a.length + var_a.length);
            require(0x1f < var_a.length);
            require(!var_a.length);
            require(!((var_a + 0x20) + var_a.length) > (var_a + 0x20));
        }
    }
    
    /// @custom:selector    0xdd62ed3e
    /// @custom:signature   allowance(address arg0, address arg1) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function allowance(address arg0, address arg1) public view returns (uint256) {
        var_a = address(arg1);
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x12c0710c
    /// @custom:signature   withdrawAllToken(uint256 arg0) public payable returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function withdrawAllToken(uint256 arg0) public payable returns (bool) {
        require(msg.sender == (address(admin)), "not admin");
        require(address(decimals / 0x0100));
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = address(admin);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: 0 ether }Unresolved_a9059cbb(var_b); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_OUT_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_OUT_FAILED");
        return 0x01;
        require(ret0.length == 0x20, "TOKEN_TRANSFER_OUT_FAILED");
        require(var_f, "TOKEN_TRANSFER_OUT_FAILED");
        return 0x01;
    }
    
    /// @custom:selector    0xc37f68e2
    /// @custom:signature   getAccountSnapshot(address arg0) public payable returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAccountSnapshot(address arg0) public payable returns (bytes memory) {
        var_a = address(arg0);
        require(storage_map_b[var_a]);
        require(!0 > 0x03);
        require(0 == 0);
        require(totalSupply);
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_d); // staticcall
        require(!ret0.length < 0x20);
        require(!0 > 0x03);
        require(0 == 0);
        return abi.encodePacked(storage_map_b[var_a], 0, 0, store_p);
    }
    
    /// @custom:selector    0xbd6d894d
    /// @custom:signature   exchangeRateCurrent() public payable returns (uint256)
    function exchangeRateCurrent() public payable returns (uint256) {
        require(bytes1(store_d), "accrue interest failed");
        store_d = uint248(store_d);
        require(!(block.number == accrualBlockNumber), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        require(totalSupply);
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!(ret0.length < 0x20), "exchangeRateStored: exchangeRateStoredInternal failed");
        uint256 var_e = 0x20 + var_e;
        require((totalBorrows + var_e.length) < var_e.length, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x02 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x02 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(totalReserves > 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x03 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x03 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        var_e = var_e + 0x20;
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        store_d = 0x01 | (uint248(store_d));
        return var_e.length;
    }
    
    /// @custom:selector    0x06fdde03
    /// @custom:signature   name() public view returns (string memory)
    function name() public view returns (string memory) {
        bytes1 var_a = 0x20 + (var_a + (0x20 * (((store_q & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!bytes1(store_q)))) / 0x02) + 0x1f) / 0x20)));
        if (!(store_q & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_q)))) / 0x02) {
            if (0x1f < (store_q & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_q))) / 0x02)) {
                var_c = 0x01;
                if ((var_a + 0x20) + (store_q & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_q))) / 0x02) > (0x20 + (var_a + 0x20))) {
                    if (!var_a.length) {
                        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_g));
                        return abi.encodePacked(0x20, var_a.length);
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x95d89b41
    /// @custom:signature   symbol() public view returns (string memory)
    function symbol() public view returns (string memory) {
        bytes1 var_a = 0x20 + (var_a + (0x20 * (((store_v & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!bytes1(store_v)))) / 0x02) + 0x1f) / 0x20)));
        if (!(store_v & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_v)))) / 0x02) {
            if (0x1f < (store_v & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_v))) / 0x02)) {
                var_c = 0x02;
                if ((var_a + 0x20) + (store_v & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!store_v))) / 0x02) > (0x20 + (var_a + 0x20))) {
                    if (!var_a.length) {
                        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_g));
                        return abi.encodePacked(0x20, var_a.length);
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x0e752702
    /// @custom:signature   repayBorrow(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function repayBorrow(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x36 > 0x51);
        uint256 var_c = 0;
        emit Failure(0, 0x36, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        address var_d = address(this);
        address var_e = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }repayBorrowAllowed(var_d, var_e); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(accrualBlockNumber == block.number);
        uint256 var_f = var_f + 0x0180;
        uint256 var_m = 0;
        address var_p = address(msg.sender);
        var_p = address(msg.sender);
        require(storage_map_x[var_p]);
        require(storage_map_y[var_p]);
        require(storage_map_y[var_p]);
        require((borrowIndex * (storage_map_y[var_p])) / (storage_map_y[var_p]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_w[var_p]);
        require(!0x01 > 0x03);
        require(0x01 == 0);
        require(storage_map_z[var_p]);
        require(storage_map_z[var_p]);
        require((borrowIndex * (storage_map_z[var_p])) / (storage_map_z[var_p]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(!0x02 > 0x03);
        require(!0x02 > 0x03);
        require(!(var_r) > 0x03);
        require(var_r == 0);
        require(arg0 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        require(!arg0 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        address var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_u); // staticcall
        require(!ret0.length < 0x20);
        var_u = address(msg.sender);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_m ether }Unresolved_23b872dd(var_u); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_IN_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_IN_FAILED");
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require((var_f.length - var_f.length) > (var_y));
        require(!0x03 > 0x03);
        require(!0x03 > 0x03);
        require(!(var_r) > 0x03);
        require(var_r == 0);
        require(var_z > (var_aa));
        var_k = 0;
        require(!unresolved_6c4603b4 < (var_ac));
        require(!totalBorrows < (var_aa));
        var_p = address(msg.sender);
        storage_map_x[var_p] = var_ad;
        storage_map_aa[var_p] = borrowIndex;
        totalBorrows = var_ae;
        unresolved_6c4603b4 = var_af;
        storage_map_ab[var_p] = var_ag;
        emit RepayBorrow(address(msg.sender), address(msg.sender), var_aj, var_ad, var_ae);
        var_u = address(this);
        var_v = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_k ether }repayBorrowVerify(var_u, var_v); // call
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(ret0.length == 0x20);
        require(var_p);
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        var_u = 0x20;
        require(!(var_r) > 0x03);
        require(!0x09 > 0x11);
        require(!0x37 > 0x51);
        emit Failure(0x09, 0x37, var_r);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x09;
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        var_d = var_f.length;
        var_e = totalBorrows;
        uint256 var_an = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_d, var_e, var_an); // staticcall
        require(!ret0.length < 0x20);
        require(!var_f.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_f = var_u + var_f;
        var_c = 0;
        var_f = var_u + var_f;
        require(var_ao);
        require(!0 > 0x03);
        require(0 == 0);
        var_f = var_f + 0x20;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x51);
        emit Failure(0x09, 0x06, 0);
        require(!0x09 > 0x11);
        require(!0x09);
        uint256 var_ap = address(this);
        var_u = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }repayBorrowAllowed(var_ap, var_u); // call
        if (!ret0.length < 0x20) {
            require(!ret0.length < 0x20);
            require(!var_f.length);
            var_p = address(msg.sender);
            require(accrualBlockNumber == block.number);
        }
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        if (var_ao) {
            require(var_ao, "could not calculate block delta");
        }
    }
    
    /// @custom:selector    0x6c321c8a
    /// @custom:signature   utilizationRate() public payable returns (uint256)
    function utilizationRate() public payable returns (uint256) {
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_c.length;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_6e71e2d8(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_c.length;
    }
    
    /// @custom:selector    0xf2b3abbd
    /// @custom:signature   _setInterestRateModel(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setInterestRateModel(address arg0) public payable returns (uint256) {
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x40 > 0x51);
        emit Failure(0, 0x40, 0);
        require(!0 > 0x11);
        return 0;
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x42 > 0x51);
        emit Failure(0x01, 0x42, 0);
        require(!0x01 > 0x11);
        return 0x01;
        require(accrualBlockNumber == block.number);
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isInterestRateModel(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_d.length, "marker method returned false");
        interestRateModel = (address(arg0)) | (uint96(interestRateModel));
        emit NewMarketInterestRateModel(address(interestRateModel / 0x01), address(arg0));
        return 0;
        address var_e = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_e); // staticcall
        require(!ret0.length < 0x20);
        var_e = var_d.length;
        var_f = totalBorrows;
        var_g = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_e, var_f, var_g); // staticcall
        require(!ret0.length < 0x20);
        require(!var_d.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_d = 0x20 + var_d;
        var_d = 0x20 + var_d;
        require(var_o);
        require(!0 > 0x03);
        require(0 == 0);
        var_d = var_d + 0x20;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x51);
        emit Failure(0x09, 0x06, 0);
        require(!0x09 > 0x11);
        require(!0x09);
        require(msg.sender == (address(admin)));
        require(accrualBlockNumber == block.number);
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isInterestRateModel(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_d.length, "marker method returned false");
        var_t = 0x20;
        interestRateModel = (address(arg0)) | (uint96(interestRateModel));
        emit NewMarketInterestRateModel(address(interestRateModel / 0x01), address(arg0));
        return 0;
        require(var_w, "could not calculate block delta");
        require(var_w, "could not calculate block delta");
        require((totalBorrows * (var_w)) / (var_w) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0x70a08231
    /// @custom:signature   balanceOf(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOf(address arg0) public view returns (uint256) {
        address var_a = address(arg0);
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x23b872dd
    /// @custom:signature   transferFrom(address arg0, address arg1, uint256 arg2) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function transferFrom(address arg0, address arg1, uint256 arg2) public payable returns (bool) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_bdcdc258(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(arg0)) == (address(arg1)));
        require(!(address(arg0)) == (address(msg.sender)));
        var_g = address(msg.sender);
        require(arg2 > storage_map_ac[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require(arg2 > storage_map_ac[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg1);
        require((arg2 + storage_map_ac[var_g]) < storage_map_ac[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(arg0);
        storage_map_ac[var_g] = 0;
        var_g = address(arg1);
        storage_map_ac[var_g] = 0;
        require(storage_map_ac[var_g] == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        emit Transfer(address(arg0), address(arg1), arg2);
        store_d = 0x01 | (uint248(store_d));
        return !(!0 == 0);
        var_g = address(msg.sender);
        storage_map_ac[var_g] = 0;
        emit Transfer(address(arg0), address(arg1), arg2);
        store_d = 0x01 | (uint248(store_d));
        return !(!0 == 0);
        require(!0x09 > 0x11);
        require(!0x4d > 0x51);
        emit Failure(0x09, 0x4d, 0);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return !(!0x09 == 0);
        require(!0x09 > 0x11);
        require(!0x09 > 0x11);
        require(!0x03 > 0x11);
        require(!0x4a > 0x51);
        emit Failure(0x03, 0x4a, var_f.length);
        require(!0x03 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return !(!0x03 == 0);
    }
    
    /// @custom:selector    0x4576b5db
    /// @custom:signature   _setComptroller(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setComptroller(address arg0) public payable returns (uint256) {
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x3f > 0x51);
        emit Failure(0x01, 0x3f, 0);
        require(!0x01 > 0x11);
        return 0x01;
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isComptroller(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_d.length, "marker method returned false");
        comptroller = (address(arg0)) | (uint96(comptroller));
        emit NewComptroller(address(comptroller), address(arg0));
        return 0;
    }
    
    /// @custom:selector    0x182df0f5
    /// @custom:signature   exchangeRateStored() public payable returns (uint256)
    function exchangeRateStored() public payable returns (uint256) {
        require(totalSupply);
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!(ret0.length < 0x20), "exchangeRateStored: exchangeRateStoredInternal failed");
        uint256 var_c = 0x20 + var_c;
        require((totalBorrows + var_c.length) < var_c.length, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x02 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x02 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(totalReserves > 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x03 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x03 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        var_c = var_c + 0x20;
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        return 0;
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        return var_c.length;
        if (totalSupply) {
            require(totalSupply);
            require(!0x01 > 0x03);
        }
    }
    
    /// @custom:selector    0x95dd9193
    /// @custom:signature   borrowBalanceStored(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceStored(address arg0) public view returns (bytes memory) {
        address var_a = address(arg0);
        require(storage_map_b[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ad[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ad[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_ad[var_a])) / (storage_map_ad[var_a]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ae[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ae[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        uint256 var_h = 0;
        return abi.encodePacked(0, 0);
        require(storage_map_af[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_af[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_af[var_a])) / (storage_map_af[var_a]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ae[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ae[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return abi.encodePacked(0 / (storage_map_ae[var_a]), 0 / (storage_map_ae[var_a]));
    }
    
    /// @custom:selector    0xfca7820b
    /// @custom:signature   _setReserveFactor(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _setReserveFactor(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x46 > 0x51);
        emit Failure(0, 0x46, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x47 > 0x51);
        var_a = 0x01;
        emit Failure(0x01, 0x47, 0);
        require(!0x01 > 0x11);
        store_d = var_a | (uint248(store_d));
        return 0x01;
        require(accrualBlockNumber == block.number);
        require(!arg0 > 0x0de0b6b3a7640000);
        reserveFactorMantissa = arg0;
        emit NewReserveFactor(reserveFactorMantissa, arg0);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        var_d = var_e.length;
        var_f = totalBorrows;
        var_g = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_d, var_f, var_g); // staticcall
        require(!(ret0.length < 0x20), "could not calculate block delta");
        require(!(var_e.length > 0x048c27395000), "could not calculate block delta");
        require(accrualBlockNumber > block.number, "could not calculate block delta");
        require(!(0x03 > 0x03), "could not calculate block delta");
        require(0x03 == 0, "could not calculate block delta");
        var_e = 0x20 + var_e;
        var_e = 0x20 + var_e;
        require(var_o, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        var_e = var_e + 0x20;
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
        require(!(0x06 > 0x51), "could not calculate block delta");
        emit Failure(0x09, 0x06, 0);
        require(!(0x09 > 0x11), "could not calculate block delta");
        require(!0x09, "could not calculate block delta");
        require(msg.sender == (address(admin)), "could not calculate block delta");
        require(accrualBlockNumber == block.number, "could not calculate block delta");
        require(!(arg0 > 0x0de0b6b3a7640000), "could not calculate block delta");
        reserveFactorMantissa = arg0;
        emit NewReserveFactor(reserveFactorMantissa, arg0);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(var_t, "could not calculate block delta");
        require(var_t, "could not calculate block delta");
        require((totalBorrows * (var_t)) / (var_t) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0xe9c714f2
    /// @custom:signature   _acceptAdmin() public payable returns (uint256)
    function _acceptAdmin() public payable returns (uint256) {
        if (msg.sender == (address(totalSupplyg))) {
            if (!0x01 > 0x11) {
                if (!0 > 0x51) {
                    emit Failure(0x01, 0, 0);
                    if (!0x01 > 0x11) {
                        return 0x01;
                        admin = (address(totalSupplyg)) | (uint96(admin));
                        totalSupplyg = uint96(totalSupplyg);
                        emit NewAdmin(address(admin), address(totalSupplyg | (uint96(admin))));
                        emit NewPendingAdmin(address(totalSupplyg), address(totalSupplyg));
                        return 0;
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x42f82260
    /// @custom:signature   updateUnderlying(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function updateUnderlying(address arg0) public payable {
        require(msg.sender == (address(admin)), "only admin may invoke the method");
        require(!address(decimals / 0x0100));
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).totalSupply(); // staticcall
        require(!ret0.length < 0x20);
        decimals = (uint96(decimals)) | (0x0100 * (address(arg0)));
        decimals = (uint96(decimals)) | (0x0100 * (address(arg0)));
    }
    
    /// @custom:selector    0x3b1d21a2
    /// @custom:signature   getCash() public payable returns (uint256)
    function getCash() public payable returns (uint256) {
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_c.length;
    }
    
    /// @custom:selector    0xa9059cbb
    /// @custom:signature   transfer(address arg0, uint256 arg1) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function transfer(address arg0, uint256 arg1) public payable returns (bool) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_bdcdc258(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(msg.sender)) == (address(arg0)));
        require(!(address(msg.sender)) == (address(msg.sender)));
        var_g = address(msg.sender);
        require(arg1 > storage_map_ac[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(msg.sender);
        require(arg1 > storage_map_ac[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require((arg1 + storage_map_ac[var_g]) < storage_map_ac[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(msg.sender);
        storage_map_ac[var_g] = 0;
        var_g = address(arg0);
        storage_map_ac[var_g] = 0;
        require(storage_map_ac[var_g] == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        emit Transfer(address(msg.sender), address(arg0), arg1);
        store_d = 0x01 | (uint248(store_d));
        return !(!0 == 0);
        var_g = address(msg.sender);
        storage_map_ac[var_g] = 0;
        emit Transfer(address(msg.sender), address(arg0), arg1);
        store_d = 0x01 | (uint248(store_d));
        return !(!0 == 0);
        require(!0x09 > 0x11);
        require(!0x4d > 0x51);
        emit Failure(0x09, 0x4d, 0);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return !(!0x09 == 0);
        require(!0x09 > 0x11);
        require(!0x09 > 0x11);
        require(!0x03 > 0x11);
        require(!0x4a > 0x51);
        emit Failure(0x03, 0x4a, var_f.length);
        require(!0x03 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return !(!0x03 == 0);
    }
    
    /// @custom:selector    0x3af9e669
    /// @custom:signature   balanceOfUnderlying(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOfUnderlying(address arg0) public payable {
        require(bytes1(store_d), "accrue interest failed");
        store_d = uint248(store_d);
        require(!(block.number == accrualBlockNumber), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        require(totalSupply);
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_d); // staticcall
        require(!(ret0.length < 0x20), "exchangeRateStored: exchangeRateStoredInternal failed");
        var_a = 0x20 + var_a;
        require((totalBorrows + var_a.length) < var_a.length, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x02 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x02 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(totalReserves > 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0x03 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0x03 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        var_a = var_a + 0x20;
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
    }
    
    /// @custom:selector    0x2608f818
    /// @custom:signature   repayBorrowBehalf(address arg0, uint256 arg1) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function repayBorrowBehalf(address arg0, uint256 arg1) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x35 > 0x51);
        uint256 var_c = 0;
        emit Failure(0, 0x35, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        address var_d = address(this);
        address var_e = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }repayBorrowAllowed(var_d, var_e); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(accrualBlockNumber == block.number);
        uint256 var_f = var_f + 0x0180;
        uint256 var_m = 0;
        address var_p = address(arg0);
        var_p = address(arg0);
        require(storage_map_x[var_p]);
        require(storage_map_y[var_p]);
        require(storage_map_y[var_p]);
        require((borrowIndex * (storage_map_y[var_p])) / (storage_map_y[var_p]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_w[var_p]);
        require(!0x01 > 0x03);
        require(0x01 == 0);
        require(storage_map_z[var_p]);
        require(storage_map_z[var_p]);
        require((borrowIndex * (storage_map_z[var_p])) / (storage_map_z[var_p]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(!0x02 > 0x03);
        require(!0x02 > 0x03);
        require(!(var_r) > 0x03);
        require(var_r == 0);
        require(arg1 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        require(!arg1 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        address var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_u); // staticcall
        require(!ret0.length < 0x20);
        var_u = address(msg.sender);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_m ether }Unresolved_23b872dd(var_u); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_IN_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_IN_FAILED");
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require((var_f.length - var_f.length) > (var_y));
        require(!0x03 > 0x03);
        require(!0x03 > 0x03);
        require(!(var_r) > 0x03);
        require(var_r == 0);
        require(var_z > (var_aa));
        var_k = 0;
        require(!unresolved_6c4603b4 < (var_ac));
        require(!totalBorrows < (var_aa));
        var_p = address(arg0);
        storage_map_x[var_p] = var_ad;
        storage_map_aa[var_p] = borrowIndex;
        totalBorrows = var_ae;
        unresolved_6c4603b4 = var_af;
        storage_map_ab[var_p] = var_ag;
        emit RepayBorrow(address(msg.sender), address(arg0), var_aj, var_ad, var_ae);
        var_u = address(this);
        var_v = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_k ether }repayBorrowVerify(var_u, var_v); // call
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(ret0.length == 0x20);
        require(var_p);
        var_u = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_u); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        var_u = 0x20;
        require(!(var_r) > 0x03);
        require(!0x09 > 0x11);
        require(!0x37 > 0x51);
        emit Failure(0x09, 0x37, var_r);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x09;
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        var_d = var_f.length;
        var_e = totalBorrows;
        uint256 var_an = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_d, var_e, var_an); // staticcall
        require(!ret0.length < 0x20);
        require(!var_f.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_f = var_u + var_f;
        var_c = 0;
        var_f = var_u + var_f;
        require(var_ao);
        require(!0 > 0x03);
        require(0 == 0);
        var_f = var_f + 0x20;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x51);
        emit Failure(0x09, 0x06, 0);
        require(!0x09 > 0x11);
        require(!0x09);
        uint256 var_ap = address(this);
        var_u = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }repayBorrowAllowed(var_ap, var_u); // call
        if (!ret0.length < 0x20) {
            require(!ret0.length < 0x20);
            require(!var_f.length);
            var_p = address(arg0);
            require(accrualBlockNumber == block.number);
        }
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
        if (var_ao) {
            require(var_ao, "could not calculate block delta");
        }
    }
    
    /// @custom:selector    0xf8f9da28
    /// @custom:signature   borrowRatePerBlock() public payable returns (uint256)
    function borrowRatePerBlock() public payable returns (uint256) {
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_c.length;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_c.length;
    }
    
    /// @custom:selector    0x153ab505
    /// @custom:signature   _resignImplementation() public view
    function _resignImplementation() public view {
        require(msg.sender == (address(admin)), "only the admin may call _resignImplementation");
    }
    
    /// @custom:selector    0x4340720f
    /// @custom:signature   Unresolved_4340720f(address arg0, address arg1, uint256 arg2, uint256 arg3, uint256 arg4, bool arg5, address arg6) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["bool", "uint8", "bytes1", "int8"]
    /// @param              arg6 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_4340720f(address arg0, address arg1, uint256 arg2, uint256 arg3, uint256 arg4, bool arg5, address arg6) public payable {
        require(!arg3 > 0x0100000000);
        require(!arg4 > 0x0100000000);
        var_a = var_a + (0x20 + (((0x1f + (arg4)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only admin may initialize the market");
        require(accrualBlockNumber, "market may only be initialized once");
        require(!accrualBlockNumber, "market may only be initialized once");
        store_p = arg2;
        if (arg2) {
            require(arg2, "setting interest rate model failed");
            require(msg.sender == (address(admin)), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            emit Failure(0x01, 0x3f, 0);
            require(!(0x3f > 0x51), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            accrualBlockNumber = block.number;
            borrowIndex = 0x0de0b6b3a7640000;
            require(!0x01, "setting interest rate model failed");
            require(msg.sender == (address(admin)), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            var_e = 0x01;
            emit Failure(0x01, 0x42, 0);
            require(!(0x42 > 0x51), "setting interest rate model failed");
            require(!(0x01 > 0x11), "setting interest rate model failed");
            require(!0x01, "setting interest rate model failed");
            store_q = var_e + (var_a.length + var_a.length);
            require(0x1f < var_a.length, "setting interest rate model failed");
            require(!var_a.length, "setting interest rate model failed");
            require(!(((var_a + 0x20) + var_a.length) > (var_a + 0x20)), "setting interest rate model failed");
        }
        require(accrualBlockNumber == block.number);
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).isInterestRateModel(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_a.length, "marker method returned false");
        interestRateModel = (address(arg1)) | (uint96(interestRateModel));
        emit NewMarketInterestRateModel(address(interestRateModel / 0x01), address(arg1));
        require(!0, "setting interest rate model failed");
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isComptroller(); // staticcall
        require(!(ret0.length < 0x20), "marker method returned false");
        require(var_a.length, "marker method returned false");
        comptroller = (address(arg0)) | (uint96(comptroller));
        emit NewComptroller(address(comptroller), address(arg0));
        require(!0, "setting comptroller failed");
    }
    
    /// @custom:selector    0xa0712d68
    /// @custom:signature   mint(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function mint(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x1e > 0x51);
        uint256 var_c = 0;
        emit Failure(0, 0x1e, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        address var_d = address(this);
        address var_e = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }mintAllowed(var_d, var_e); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(accrualBlockNumber == block.number);
        uint256 var_f = var_f + 0xe0;
        uint256 var_i = 0;
        require(totalSupply);
        address var_l = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_l); // staticcall
        require(!ret0.length < 0x20);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_m) > 0x03);
        require(var_m == 0);
        require(!(var_m) > 0x03);
        require(!0x09 > 0x11);
        require(!0x21 > 0x51);
        emit Failure(0x09, 0x21, var_m);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x09;
        var_l = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_l); // staticcall
        require(!ret0.length < 0x20);
        var_l = address(msg.sender);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).{ value: var_i ether }gasprice_bit_ether(var_l); // call
        require(ret0.length == 0, "TOKEN_TRANSFER_IN_FAILED");
        require(0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "TOKEN_TRANSFER_IN_FAILED");
        var_l = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_l); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        var_l = 0x20;
        require(0x0de0b6b3a7640000, "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(0 == 0, "MINT_EXCHANGE_CALCULATION");
        var_f = var_f + 0x20;
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(0 == 0, "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(!(var_m > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(var_m == 0, "MINT_EXCHANGE_CALCULATION");
        require((var_x + totalSupply) < totalSupply, "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(0x02 > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(0x02 > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(var_m > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(var_m == 0, "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        if (!0 > 0x03) {
            require(!0 > 0x03);
            require(!0 > 0x03);
            require(0x0de0b6b3a7640000);
        }
        require(ret0.length == 0x20);
        require(var_z);
        var_l = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_l); // staticcall
        require(!(ret0.length < 0x20), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!(var_f.length < var_f.length), "TOKEN_TRANSFER_IN_OVERFLOW");
        require(!0x0a > 0x11);
        require(!0x22 > 0x51);
        emit Failure(0x0a, 0x22, 0);
        require(!0x0a > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0a;
    }
    
    /// @custom:selector    0xf5e3c462
    /// @custom:signature   liquidateBorrow(address arg0, uint256 arg1, address arg2) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    /// @param              arg2 ["address", "uint160", "bytes20", "int160"]
    function liquidateBorrow(address arg0, uint256 arg1, address arg2) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x0f > 0x51);
        uint256 var_c = 0;
        emit Failure(0, 0x0f, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(address(arg2).code.length);
        (bool success, bytes memory ret0) = address(arg2).{ value: var_c ether }accrueInterest(); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        address var_e = address(this);
        address var_f = address(arg2);
        address var_g = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }Unresolved_6e2cf5af(var_e, var_f, var_g); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        require(accrualBlockNumber == block.number);
        require(address(arg2).code.length);
        (bool success, bytes memory ret0) = address(arg2).accrualBlockNumber(); // staticcall
        require(!ret0.length < 0x20);
        require(var_d.length == block.number);
        require(!(address(arg0)) == (address(msg.sender)));
        require(arg1);
        require(!arg1 == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        require(!0x07 > 0x11);
        require(!0x14 > 0x51);
        var_c = 0;
        emit Failure(0x07, 0x14, 0);
        require(!0x07 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x07;
        var_e = address(this);
        var_f = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }repayBorrowAllowed(var_e, var_f); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        require(accrualBlockNumber == block.number);
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        var_c = 0;
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        require(!0x0a);
        var_e = address(this);
        var_f = address(arg2);
        var_g = 0;
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).Unresolved_c488847b(var_e, var_f, var_g); // staticcall
        require(!ret0.length < 0x40);
        require(!var_d.length);
        var_e = address(arg0);
        require(address(arg2).code.length);
        (bool success, bytes memory ret0) = address(arg2).balanceOf(var_e); // staticcall
        require(!(ret0.length < 0x20), "LIQUIDATE_SEIZE_TOO_MUCH");
        require(!(var_d.length < (var_i)), "LIQUIDATE_SEIZE_TOO_MUCH");
        require(!address(this) == (address(arg2)));
        var_e = address(msg.sender);
        var_f = address(arg0);
        var_g = var_j;
        require(address(arg2).code.length);
        (bool success, bytes memory ret0) = address(arg2).{ value: var_c ether }Unresolved_b2a02ff1(var_e, var_f, var_g); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        var_c = 0;
        emit LiquidateBorrow(address(msg.sender), address(arg0), 0, address(arg2), var_j);
        var_e = address(this);
        var_f = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }liquidateBorrowVerify(var_e, var_f); // call
        require(!ret0.length < 0x20);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        var_e = address(this);
        var_f = address(this);
        var_g = address(msg.sender);
        var_h = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_c ether }seizeAllowed(var_e, var_f, var_g, var_h); // call
        require(!(ret0.length < 0x20), "token seizure failed");
        require(!var_d.length, "token seizure failed");
        require(!(address(arg0) == (address(msg.sender))), "token seizure failed");
        address var_m = address(arg0);
        require(var_j > storage_map_ah[var_m], "token seizure failed");
        require(!(0x03 > 0x03), "token seizure failed");
        require(0x03 == 0, "token seizure failed");
        var_m = address(msg.sender);
        require(var_j + storage_map_ah[var_m] < storage_map_ah[var_m], "token seizure failed");
        require(!(0x02 > 0x03), "token seizure failed");
        require(0x02 == 0, "token seizure failed");
        var_m = address(arg0);
        storage_map_ah[var_m] = 0;
        var_m = address(msg.sender);
        storage_map_ah[var_m] = 0;
        emit Transfer(address(arg0), address(msg.sender), var_j);
        require(!0, "token seizure failed");
        require(!0x02 > 0x03);
        require(!0x09 > 0x11);
        require(!0x19 > 0x51);
        emit Failure(0x09, 0x19, 0x02);
        require(!0x09 > 0x11);
        require(!0x03 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x11);
        require(!0x1c > 0x51);
        emit Failure(0x06, 0x1c, 0);
        require(!0x06 > 0x11);
        require(!0x0a > 0x11);
        require(!var_d.length > 0x11);
        var_e = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_e); // staticcall
        require(!ret0.length < 0x20);
        var_e = var_d.length;
        var_f = totalBorrows;
        var_g = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_e, var_f, var_g); // staticcall
        require(!(ret0.length < 0x20), "borrow rate is absurdly high");
        require(!(var_d.length > 0x048c27395000), "borrow rate is absurdly high");
    }
    
    /// @custom:selector    0xc5cc93de
    /// @custom:signature   repayByInsurance(address arg0, uint256 arg1) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function repayByInsurance(address arg0, uint256 arg1) public payable returns (uint256) {
        require(msg.sender == (address(comptroller)), "only comptroller could invoke");
        require(!(block.number == accrualBlockNumber), "borrowBalance must be more than amount");
        require(!0, "borrowBalance must be more than amount");
        return 0;
        uint256 var_e = 0x80 + var_e;
        address var_i = address(arg0);
        require(storage_map_ai[var_i], "borrowBalance must be more than amount");
        require(storage_map_aj[var_i], "borrowBalance must be more than amount");
        require(storage_map_aj[var_i], "borrowBalance must be more than amount");
        require((borrowIndex * (storage_map_aj[var_i])) / (storage_map_aj[var_i]) == borrowIndex, "borrowBalance must be more than amount");
        require(!(0x02 > 0x03), "borrowBalance must be more than amount");
        require(0x02 == 0, "borrowBalance must be more than amount");
        require(storage_map_ak[var_i], "borrowBalance must be more than amount");
        require(storage_map_ak[var_i], "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        require(0 == 0, "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        require(0 == 0, "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        return 0;
        require(!(arg1 > var_e.length), "borrowBalance must be more than amount");
        var_e = 0x40 + var_e;
        require(!(arg1 > var_e.length), "                     ");
        require(!(bytes1(var_e.length)), "                     ");
        var_i = address(arg0);
        storage_map_ai[var_i] = var_e.length;
        storage_map_al[var_i] = var_y;
        storage_map_am[var_i] = var_z;
        if (!arg1 < (var_y)) {
            var_i = address(arg0);
            storage_map_an[var_i] = var_y;
            if (arg1 > totalBorrows) {
            }
            require(!arg1 < (var_y));
            require(storage_map_an[var_i]);
            require(storage_map_an[var_i]);
            require((borrowIndex * (storage_map_an[var_i])) / (storage_map_an[var_i]) == borrowIndex);
            require(!0x02 > 0x03);
            require(0x02 == 0);
            require(storage_map_ak[var_i]);
            require(storage_map_ak[var_i]);
            require(!0 > 0x03);
        }
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_e.length;
        var_c = totalBorrows;
        var_d = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_b, var_c, var_d); // staticcall
        if (!ret0.length < 0x20) {
            require(!(ret0.length < 0x20), "could not calculate block delta");
            require(!(var_e.length > 0x048c27395000), "could not calculate block delta");
            require(accrualBlockNumber > block.number, "could not calculate block delta");
            require(!(0x03 > 0x03), "could not calculate block delta");
            var_e = 0x20 + var_e;
            var_e = 0x20 + var_e;
            require(0x03 == 0, "could not calculate block delta");
            require(var_aa, "could not calculate block delta");
            require(!(0 > 0x03), "could not calculate block delta");
            var_e = var_e + 0x20;
            require(0 == 0, "could not calculate block delta");
            require(!(0 > 0x03), "could not calculate block delta");
            require(0 == 0, "could not calculate block delta");
            require(!(0 > 0x03), "could not calculate block delta");
            require(!(0x09 > 0x11), "could not calculate block delta");
            emit Failure(0x09, 0x06, 0);
            require(!(0x06 > 0x51), "could not calculate block delta");
            require(!(0x09 > 0x11), "could not calculate block delta");
            require(!0x09, "could not calculate block delta");
        }
        return 0x09;
        require(var_ag, "could not calculate block delta");
        require(var_ag, "could not calculate block delta");
        require((totalBorrows * (var_ag)) / (var_ag) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0xb2a02ff1
    /// @custom:signature   seize(address arg0, address arg1, uint256 arg2) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function seize(address arg0, address arg1, uint256 arg2) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_eafe967b(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(arg1)) == (address(arg0)));
        address var_g = address(arg1);
        require(arg2 > storage_map_ac[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require((arg2 + storage_map_ac[var_g]) < storage_map_ac[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(arg1);
        storage_map_ac[var_g] = 0;
        var_g = address(arg0);
        storage_map_ac[var_g] = 0;
        emit Transfer(address(arg1), address(arg0), arg2);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(!0x02 > 0x03);
        require(!0x09 > 0x11);
        require(!0x19 > 0x51);
        emit Failure(0x09, 0x19, 0x02);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x09;
        require(!0x03 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x11);
        require(!0x1c > 0x51);
        emit Failure(0x06, 0x1c, 0);
        require(!0x06 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x06;
    }
    
    /// @custom:selector    0xa6afed95
    /// @custom:signature   accrueInterest() public payable returns (uint256)
    function accrueInterest() public payable returns (uint256) {
        require(!block.number == accrualBlockNumber);
        return 0;
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        var_b = var_c.length;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_b); // staticcall
        require(!(ret0.length < 0x20), "could not calculate block delta");
        require(!(var_c.length > 0x048c27395000), "could not calculate block delta");
        require(accrualBlockNumber > block.number, "could not calculate block delta");
        require(!(0x03 > 0x03), "could not calculate block delta");
        require(0x03 == 0, "could not calculate block delta");
        var_c = 0x20 + var_c;
        var_c = 0x20 + var_c;
        require(var_o, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        var_c = var_c + 0x20;
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
        require(!(0x06 > 0x51), "could not calculate block delta");
        emit Failure(0x09, 0x06, 0);
        require(!(0x09 > 0x11), "could not calculate block delta");
        return 0x09;
        require(var_t, "could not calculate block delta");
        require(var_t, "could not calculate block delta");
        require((totalBorrows * (var_t)) / (var_t) == totalBorrows, "could not calculate block delta");
        require(!(0x02 > 0x03), "could not calculate block delta");
        require(0x02 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(!(0x09 > 0x11), "could not calculate block delta");
    }
    
    /// @custom:selector    0x56e67728
    /// @custom:signature   Unresolved_56e67728(uint256 arg0) public view
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_56e67728(uint256 arg0) public view {
        require(!arg0 > 0x0100000000);
        uint256 var_a = var_a + (0x20 + (((0x1f + (arg0)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only the admin may call _becomeImplementation");
    }
    
    /// @custom:selector    0x8cd01307
    /// @custom:signature   Unresolved_8cd01307(uint256 arg0, uint256 arg1) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_8cd01307(uint256 arg0, uint256 arg1) public payable returns (uint256) {
        require(bytes1(store_d));
        store_d = uint248(store_d);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x08 > 0x51);
        emit Failure(0, 0x08, 0);
        require(!0 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(accrualBlockNumber == block.number);
        address var_d = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).balanceOf(var_d); // staticcall
        require(!ret0.length < 0x20);
        require(!var_e.length < (arg0 + totalReserves));
        require(!0x0e > 0x11);
        require(!0x09 > 0x51);
        emit Failure(0x0e, 0x09, 0);
        require(!0x0e > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x0e;
        uint256 var_e = var_e + 0xe0;
        uint256 var_f = 0;
        address var_j = address(msg.sender);
        require(storage_map_ao[var_j]);
        require(storage_map_ap[var_j]);
        require(storage_map_ap[var_j]);
        require((borrowIndex * (storage_map_ap[var_j])) / (storage_map_ap[var_j]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_aq[var_j]);
        require(storage_map_aq[var_j]);
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!var_e.length > 0x03);
        require(var_e.length == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        require(!0x07 > 0x51);
        emit Failure(0x09, 0x07, var_l);
        require(!0x09 > 0x11);
        store_d = 0x01 | (uint248(store_d));
        return 0x09;
        require((arg0 + (var_p)) < (var_p));
        require(!0x02 > 0x03);
        require(!0x02 > 0x03);
        require(!var_e.length > 0x03);
        require(var_e.length == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        require(storage_map_ar[var_j]);
        require(storage_map_ar[var_j]);
        require((borrowIndex * (storage_map_ar[var_j])) / (storage_map_ar[var_j]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_aq[var_j]);
        require(storage_map_aq[var_j]);
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
    }
    
    /// @custom:selector    0xb71d1a0c
    /// @custom:signature   _setPendingAdmin(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPendingAdmin(address arg0) public payable returns (uint256) {
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x45 > 0x51);
        emit Failure(0x01, 0x45, 0);
        require(!0x01 > 0x11);
        return 0x01;
        totalSupplyg = (address(arg0)) | (uint96(totalSupplyg));
        emit NewPendingAdmin(address(totalSupplyg), address(arg0));
        return 0;
    }
    
    /// @custom:selector    0x852a12e3
    /// @custom:signature   redeemUnderlying(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeemUnderlying(uint256 arg0) public payable returns (uint256) {
        require(bytes1(store_d), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_d = uint248(store_d);
        require(!(block.number == accrualBlockNumber), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0x27 > 0x51), "one of redeemTokensIn or redeemAmountIn must be zero");
        emit Failure(0, 0x27, 0);
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_d = 0x01 | (uint248(store_d));
        return 0;
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!arg0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(totalSupply);
        address var_m = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_m); // staticcall
        if (!ret0.length < 0x20) {
            var_e = 0x20 + var_e;
            require(!ret0.length < 0x20);
            require((totalBorrows + var_e.length) < var_e.length);
            require(!0x02 > 0x03);
            require(0x02 == 0);
            require(totalReserves > 0);
            require(!0x03 > 0x03);
            require(0x03 == 0);
            require(0);
            require(!0 > 0x03);
            var_e = var_e + 0x20;
            require(0 == 0);
            require(!0 > 0x03);
            require(0 == 0);
            require(!0 > 0x03);
            require(!0 > 0x03);
            require(!(var_p) > 0x03);
            require(var_p == 0);
            require(!(var_p) > 0x03);
            require(!0x09 > 0x11);
            emit Failure(0x09, 0x2b, var_p);
            require(!0x2b > 0x51);
            store_d = 0x01 | (uint248(store_d));
            return 0x09;
            require(!0x09 > 0x11);
        }
        require(!0 > 0x03);
        require(!0 > 0x03);
    }
}