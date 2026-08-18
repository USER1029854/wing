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
    
    mapping(bytes32 => bytes32) storage_map_w;
    uint256 public reserveFactorMantissa;
    address public interestRateModel;
    mapping(bytes32 => bytes32) storage_map_al;
    mapping(bytes32 => bytes32) storage_map_am;
    mapping(bytes32 => bytes32) storage_map_ak;
    uint256 public borrowIndex;
    mapping(bytes32 => bytes32) storage_map_af;
    mapping(bytes32 => bytes32) storage_map_ac;
    uint256 public totalSupply;
    address public pendingAdmin;
    mapping(bytes32 => bytes32) storage_map_b;
    bool public decimals;
    uint256 public unresolved_6c4603b4;
    bytes32 store_g;
    mapping(bytes32 => bytes32) storage_map_x;
    mapping(bytes32 => bytes32) storage_map_i;
    address public comptroller;
    uint256 public exchangeRateCurrent;
    mapping(bytes32 => bytes32) storage_map_an;
    mapping(bytes32 => bytes32) storage_map_ae;
    string public name;
    mapping(bytes32 => bytes32) storage_map_o;
    address public admin;
    mapping(bytes32 => bytes32) storage_map_z;
    uint256 public totalReserves;
    mapping(bytes32 => bytes32) storage_map_ab;
    mapping(bytes32 => bytes32) storage_map_ad;
    mapping(bytes32 => bytes32) storage_map_t;
    uint256 public totalBorrows;
    uint256 public accrualBlockNumber;
    mapping(bytes32 => bytes32) storage_map_aa;
    mapping(bytes32 => bytes32) storage_map_ai;
    mapping(bytes32 => bytes32) storage_map_y;
    mapping(bytes32 => bytes32) storage_map_p;
    mapping(bytes32 => bytes32) storage_map_m;
    mapping(bytes32 => bytes32) storage_map_ag;
    mapping(bytes32 => bytes32) storage_map_l;
    bytes32 totalSupplyh;
    mapping(bytes32 => bytes32) storage_map_aj;
    
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
    event NewComptroller(address, address);
    
    /// @custom:selector    0x095ea7b3
    /// @custom:signature   approve(address arg0, uint256 arg1) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function approve(address arg0, uint256 arg1) public returns (bool) {
        var_a = address(arg0);
        storage_map_b[var_a] = arg1;
        emit Approval(msg.sender, address(arg0), arg1);
        return 0x01;
    }
    
    /// @custom:selector    0xe9c714f2
    /// @custom:signature   _acceptAdmin() public returns (uint256)
    function _acceptAdmin() public returns (uint256) {
        if (msg.sender == (address(pendingAdmin))) {
            if (!0x01 > 0x11) {
                if (!0 > 0x51) {
                    emit Failure(0x01, 0, 0);
                    if (!0x01 > 0x11) {
                        return 0x01;
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
    
    /// @custom:selector    0x42f82260
    /// @custom:signature   updateUnderlying(address arg0) public
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function updateUnderlying(address arg0) public {
        require(msg.sender == (address(admin)), "only admin may invoke the method");
        require(!address(decimals / 0x0100));
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).totalSupply(); // staticcall
        require(!ret0.length < 0x20);
        decimals = (uint96(decimals)) | (0x0100 * (address(arg0)));
        decimals = (uint96(decimals)) | (0x0100 * (address(arg0)));
    }
    
    /// @custom:selector    0xa9059cbb
    /// @custom:signature   transfer(address arg0, uint256 arg1) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function transfer(address arg0, uint256 arg1) public returns (bool) {
        require(bytes1(store_g));
        store_g = uint248(store_g);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_bdcdc258(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(msg.sender)) == (address(arg0)));
        require(!(address(msg.sender)) == (address(msg.sender)));
        var_g = address(msg.sender);
        require(arg1 > storage_map_i[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(msg.sender);
        require(arg1 > storage_map_i[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require((arg1 + storage_map_i[var_g]) < storage_map_i[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(msg.sender);
        storage_map_i[var_g] = 0;
        var_g = address(arg0);
        storage_map_i[var_g] = 0;
        require(storage_map_i[var_g] == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        emit Transfer(address(msg.sender), address(arg0), arg1);
        store_g = 0x01 | (uint248(store_g));
        return !(!0 == 0);
        var_g = address(msg.sender);
        storage_map_i[var_g] = 0;
        emit Transfer(address(msg.sender), address(arg0), arg1);
        store_g = 0x01 | (uint248(store_g));
        return !(!0 == 0);
        require(!0x09 > 0x11);
        require(!0x4d > 0x51);
        emit Failure(0x09, 0x4d, 0);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return !(!0x09 == 0);
        require(!0x09 > 0x11);
        require(!0x09 > 0x11);
        require(!0x03 > 0x11);
        require(!0x4a > 0x51);
        emit Failure(0x03, 0x4a, var_f.length);
        require(!0x03 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return !(!0x03 == 0);
    }
    
    /// @custom:selector    0x72f080b8
    /// @custom:signature   repayBehalfExplicit(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function repayBehalfExplicit(address arg0) public payable {
        address var_b = address(arg0);
        require(address(this).code.length);
        (bool success, bytes memory ret0) = address(this).{ value: 0 ether }Unresolved_17bfdfbc(var_b); // call
        require(!ret0.length < 0x40);
        require(!msg.value > var_c.length);
        var_b = address(arg0);
        require(address(this).code.length);
        (bool success, bytes memory ret0) = address(this).{ value: var_c.length }Unresolved_e5974619(var_b); // call
        (bool success, bytes memory ret0) = address(msg.sender).transfer(msg.value - var_c.length);
        var_b = address(arg0);
        require(address(this).code.length);
        (bool success, bytes memory ret0) = address(this).{ value: msg.value }Unresolved_e5974619(var_b); // call
    }
    
    /// @custom:selector    0x601a0bf1
    /// @custom:signature   _reduceReserves(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _reduceReserves(uint256 arg0) public returns (uint256) {
        require(bytes1(store_g), "reduce reserves unexpected underflow");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "reduce reserves unexpected underflow");
        require(!0, "reduce reserves unexpected underflow");
        require(!(0 > 0x11), "reduce reserves unexpected underflow");
        require(!(0 > 0x11), "reduce reserves unexpected underflow");
        require(!(0x30 > 0x51), "reduce reserves unexpected underflow");
        emit Failure(0, 0x30, 0);
        require(!(0 > 0x11), "reduce reserves unexpected underflow");
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(msg.sender == (address(admin)), "reduce reserves unexpected underflow");
        require(!(0x01 > 0x11), "reduce reserves unexpected underflow");
        require(!(0x31 > 0x51), "reduce reserves unexpected underflow");
        var_a = 0x01;
        emit Failure(0x01, 0x31, 0);
        require(!(0x01 > 0x11), "reduce reserves unexpected underflow");
        store_g = var_a | (uint248(store_g));
        return 0x01;
        require(accrualBlockNumber == block.number, "reduce reserves unexpected underflow");
        require(msg.value > address(this).balance, "reduce reserves unexpected underflow");
        require(!(0x03 > 0x03), "reduce reserves unexpected underflow");
        require(0x03 == 0, "reduce reserves unexpected underflow");
        require(!(0 < arg0), "reduce reserves unexpected underflow");
        require(!(arg0 > totalReserves), "reduce reserves unexpected underflow");
        require(!((totalReserves - arg0) > totalReserves), "reduce reserves unexpected underflow");
        totalReserves = totalReserves - arg0;
        (bool success, bytes memory ret0) = address(admin).transfer(arg0);
        emit ReservesReduced(address(admin), arg0, totalReserves - arg0);
        store_g = 0x01 | (uint248(store_g));
        return 0;
        if (msg.value > address(this).balance) {
        }
    }
    
    /// @custom:selector    0x3b1d21a2
    /// @custom:signature   getCash() public view returns (uint256)
    function getCash() public view returns (uint256) {
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        return 0;
    }
    
    /// @custom:selector    0x17bfdfbc
    /// @custom:signature   borrowBalanceCurrent(address arg0) public returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceCurrent(address arg0) public returns (bytes memory) {
        require(bytes1(store_g), "accrue interest failed");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        address var_e = address(arg0);
        require(storage_map_l[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_m[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_m[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_m[var_e])) / (storage_map_m[var_e]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_o[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x01 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x01 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_p[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_p[var_e], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_p[var_e])) / (storage_map_p[var_e]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        store_g = 0x01 | (uint248(store_g));
        return abi.encodePacked(0, 0);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_b = 0;
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
    
    /// @custom:selector    0x3af9e669
    /// @custom:signature   balanceOfUnderlying(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOfUnderlying(address arg0) public returns (uint256) {
        var_a = 0x20 + var_a;
        require(bytes1(store_g), "accrue interest failed");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "accrue interest failed");
        require(0 == 0, "accrue interest failed");
        require(totalSupply);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        require(!(0 > 0x03), "exchangeRateStored: exchangeRateStoredInternal failed");
        require(0 == 0, "exchangeRateStored: exchangeRateStoredInternal failed");
        store_g = 0x01 | (uint248(store_g));
        address var_i = address(arg0);
        require(var_l, "balance could not be calculated");
        require(var_l, "balance could not be calculated");
        require(storage_map_t[var_i] * (var_l) / (var_l) == storage_map_t[var_i], "balance could not be calculated");
        require(!(0x02 > 0x03), "balance could not be calculated");
        require(0x02 == 0, "balance could not be calculated");
        var_a = var_a + 0x20;
        require(!(0 > 0x03), "balance could not be calculated");
        require(0 == 0, "balance could not be calculated");
        require(!(0 > 0x03), "balance could not be calculated");
        require(0 == 0, "balance could not be calculated");
        return 0;
        require(!(0 > 0x03), "balance could not be calculated");
        require(0 == 0, "balance could not be calculated");
        return var_a.length / 0x0de0b6b3a7640000;
    }
    
    /// @custom:selector    0xdb006a75
    /// @custom:signature   redeem(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeem(uint256 arg0) public returns (uint256) {
        require(bytes1(store_g), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0x27 > 0x51), "one of redeemTokensIn or redeemAmountIn must be zero");
        emit Failure(0, 0x27, 0);
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(!arg0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(totalSupply);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_l) > 0x03);
        require(var_l == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        require(!0x2b > 0x51);
        emit Failure(0x09, 0x2b, var_l);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x09;
        require(!arg0);
        require(var_q);
        require(var_q);
        require((arg0 * (var_q)) / (var_q) == arg0);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_e = var_e + 0x20;
        uint256 var_r = 0;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_l) > 0x03);
        require(var_l == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        address var_t = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_r ether }Unresolved_eabe7d91(var_t); // call
        require(!ret0.length < 0x20);
        require(!var_e.length);
        require(accrualBlockNumber == block.number);
        require(!0x0a > 0x11);
        require(!0x2c > 0x51);
        emit Failure(0x0a, 0x2c, 0);
        require(!0x0a > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x0a;
        require(!0x03 > 0x11);
        require(!0x28 > 0x51);
        emit Failure(0x03, 0x28, var_e.length);
        require(!0x03 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x03;
        require(!(0 > 0x03), "re-entered");
        require(!(0 > 0x03), "re-entered");
    }
    
    /// @custom:selector    0xae9d70b0
    /// @custom:signature   supplyRatePerBlock() public returns (uint256)
    function supplyRatePerBlock() public returns (uint256) {
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_b = 0;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_b8168816(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_f.length;
    }
    
    /// @custom:selector    0xbf852237
    /// @custom:signature   Unresolved_bf852237(uint256 arg0, uint256 arg1) public
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_bf852237(uint256 arg0, uint256 arg1) public {
        require(!arg0 > 0x0100000000);
        require(!arg1 > 0x0100000000);
        var_a = var_a + (0x20 + (((0x1f + (arg1)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only admin may invoke the method");
        var_i = 0x01;
        if (0x1f < var_a.length) {
            name = var_i + (var_a.length + var_a.length);
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
    
    /// @custom:selector    0xf8f9da28
    /// @custom:signature   borrowRatePerBlock() public returns (uint256)
    function borrowRatePerBlock() public returns (uint256) {
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_b = 0;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_b); // staticcall
        require(!ret0.length < 0x20);
        return var_e.length;
    }
    
    /// @custom:selector    0x12c0710c
    /// @custom:signature   withdrawAllToken(uint256 arg0) public returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function withdrawAllToken(uint256 arg0) public returns (bool) {
        require(msg.sender == (address(admin)), "not admin");
        require(address(decimals / 0x0100));
        address var_b = address(this);
        require(address(decimals / 0x0100).code.length);
        (bool success, bytes memory ret0) = address(decimals / 0x0100).Unresolved_70a08231(var_b); // staticcall
        require(!ret0.length < 0x20);
        (bool success, bytes memory ret0) = address(admin).transfer(var_e.length);
        return 0x01;
    }
    
    /// @custom:selector    0x4340720f
    /// @custom:signature   Unresolved_4340720f(address arg0, address arg1, uint256 arg2, uint256 arg3, uint256 arg4, bool arg5, address arg6) public
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    /// @param              arg3 ["uint256", "bytes32", "int256"]
    /// @param              arg4 ["uint256", "bytes32", "int256"]
    /// @param              arg5 ["bool", "uint8", "bytes1", "int8"]
    /// @param              arg6 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_4340720f(address arg0, address arg1, uint256 arg2, uint256 arg3, uint256 arg4, bool arg5, address arg6) public {
        require(!arg3 > 0x0100000000);
        require(!arg4 > 0x0100000000);
        var_a = var_a + (0x20 + (((0x1f + (arg4)) / 0x20) * 0x20));
        require(msg.sender == (address(admin)), "only admin may initialize the market");
        require(accrualBlockNumber, "market may only be initialized once");
        require(!accrualBlockNumber, "market may only be initialized once");
        exchangeRateCurrent = arg2;
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
            name = var_e + (var_a.length + var_a.length);
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
    
    /// @custom:selector    0xc37f68e2
    /// @custom:signature   getAccountSnapshot(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAccountSnapshot(address arg0) public view returns (bytes memory) {
        var_a = address(arg0);
        require(storage_map_b[var_a]);
        require(!0 > 0x03);
        require(0 == 0);
        require(totalSupply);
        require(!0 > 0x03);
        require(0 == 0);
        return abi.encodePacked(storage_map_b[var_a], 0, 0, exchangeRateCurrent);
    }
    
    /// @custom:selector    0xe5974619
    /// @custom:signature   repayBorrowBehalf(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function repayBorrowBehalf(address arg0) public payable {
        require(bytes1(store_g), "                             ");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "                             ");
        require(!0, "                             ");
        require(!(0 > 0x11), "                             ");
        require(!(0 > 0x11), "                             ");
        require(!(0x35 > 0x51), "                             ");
        emit Failure(0, 0x35, 0);
        require(!(0 > 0x11), "                             ");
        store_g = 0x01 | (uint248(store_g));
        uint256 var_d = 0x40 + var_d;
        require(0, "                             ");
        var_d = var_d + (0x20 + (uint248(0x1f + (0x05 + var_d.length))));
        require(!(0x05 + var_d.length), "                             ");
        require(0x02 < var_d.length, "                             ");
        require(0x03 < var_d.length, "                             ");
        require(0x04 < var_d.length, "                             ");
        require(!0, "                             ");
        require(!(bytes1(var_d.length)), "                             ");
        address var_p = address(this);
        address var_q = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }repayBorrowAllowed(var_p, var_q); // call
        require(!(ret0.length < 0x20), "sender mismatch");
        require(!var_d.length, "sender mismatch");
        require(accrualBlockNumber == block.number, "sender mismatch");
        address var_y = address(arg0);
        var_y = address(arg0);
        require(storage_map_x[var_y], "sender mismatch");
        require(storage_map_y[var_y], "sender mismatch");
        require(storage_map_y[var_y], "sender mismatch");
        require((borrowIndex * (storage_map_y[var_y])) / (storage_map_y[var_y]) == borrowIndex, "sender mismatch");
        require(!(0x02 > 0x03), "sender mismatch");
        require(0x02 == 0, "sender mismatch");
        require(storage_map_w[var_y], "sender mismatch");
        require(!(0x01 > 0x03), "sender mismatch");
        require(0x01 == 0, "sender mismatch");
        require(storage_map_z[var_y], "sender mismatch");
        require(storage_map_z[var_y], "sender mismatch");
        require((borrowIndex * (storage_map_z[var_y])) / (storage_map_z[var_y]) == borrowIndex, "sender mismatch");
        require(!(0x02 > 0x03), "sender mismatch");
        require(0x02 == 0, "sender mismatch");
        require(storage_map_w[var_y], "sender mismatch");
        require(!(0x01 > 0x03), "sender mismatch");
        require(0x01 == 0, "sender mismatch");
        var_s = 0;
        require(!(0 > 0x03), "sender mismatch");
        require(!(0 > 0x03), "sender mismatch");
        require(!(var_aa > 0x03), "sender mismatch");
        require(var_aa == 0, "sender mismatch");
        require(!(var_aa > 0x03), "sender mismatch");
        require(!(0x09 > 0x11), "sender mismatch");
        require(!(0x37 > 0x51), "sender mismatch");
        emit Failure(0x09, 0x37, var_aa);
        require(!(0x09 > 0x11), "sender mismatch");
        store_g = 0x01 | (uint248(store_g));
        require(0x09, "sender mismatch");
        require(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "sender mismatch");
        require(!(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff), "sender mismatch");
        require(address(msg.sender) == msg.sender, "sender mismatch");
        require(msg.value == (var_ai), "value mismatch");
        require(var_ai > (var_ae));
        require(!0x03 > 0x03);
        require(!0x03 > 0x03);
        require(!(var_aa) > 0x03);
        require(var_aa == 0);
        require(var_aj > (var_ak));
        require(!unresolved_6c4603b4 < (var_am));
        require(!totalBorrows < (var_ak));
        var_y = address(arg0);
        storage_map_x[var_y] = var_an;
        storage_map_aa[var_y] = borrowIndex;
        totalBorrows = var_ao;
        unresolved_6c4603b4 = var_ap;
        storage_map_ab[var_y] = var_aq;
        emit RepayBorrow(address(msg.sender), address(arg0), var_ar, var_an, var_ao);
        var_af = address(this);
        var_ag = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }repayBorrowVerify(var_af, var_ag); // call
        store_g = 0x01 | (uint248(store_g));
        var_d = 0x40 + var_d;
        require(0, "REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION");
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_p = 0;
        var_q = totalBorrows;
        uint256 var_av = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_p, var_q, var_av); // staticcall
        require(!ret0.length < 0x20);
        require(!var_d.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_d = 0x20 + var_d;
        var_s = 0;
        var_d = 0x20 + var_d;
        require(var_aw);
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
        uint256 var_ax = address(this);
        var_af = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }repayBorrowAllowed(var_ax, var_af); // call
        if (!ret0.length < 0x20) {
            require(!ret0.length < 0x20);
            require(!var_d.length);
            var_y = address(arg0);
            require(accrualBlockNumber == block.number);
        }
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        if (var_aw) {
            require(var_aw, "could not calculate block delta");
        }
    }
    
    /// @custom:selector    0xc5cc93de
    /// @custom:signature   repayByInsurance(address arg0, uint256 arg1) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function repayByInsurance(address arg0, uint256 arg1) public returns (uint256) {
        require(msg.sender == (address(comptroller)), "only comptroller could invoke");
        require(!(block.number == accrualBlockNumber), "borrowBalance must be more than amount");
        require(!0, "borrowBalance must be more than amount");
        return 0;
        uint256 var_e = 0x80 + var_e;
        address var_i = address(arg0);
        require(storage_map_t[var_i], "borrowBalance must be more than amount");
        require(storage_map_ac[var_i], "borrowBalance must be more than amount");
        require(storage_map_ac[var_i], "borrowBalance must be more than amount");
        require((borrowIndex * (storage_map_ac[var_i])) / (storage_map_ac[var_i]) == borrowIndex, "borrowBalance must be more than amount");
        require(!(0x02 > 0x03), "borrowBalance must be more than amount");
        require(0x02 == 0, "borrowBalance must be more than amount");
        require(storage_map_ad[var_i], "borrowBalance must be more than amount");
        require(storage_map_ad[var_i], "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        require(0 == 0, "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        require(0 == 0, "borrowBalance must be more than amount");
        require(!(0 > 0x03), "borrowBalance must be more than amount");
        return 0;
        require(!(arg1 > var_e.length), "borrowBalance must be more than amount");
        var_e = 0x40 + var_e;
        require(!(arg1 > var_e.length), "                     ");
        var_t = 0x20;
        require(!var_e.length, "                     ");
        require(!(bytes1(var_e.length)), "                     ");
        var_i = address(arg0);
        storage_map_t[var_i] = var_e.length;
        storage_map_ae[var_i] = var_y;
        storage_map_af[var_i] = var_z;
        if (!arg1 < (var_y)) {
            var_i = address(arg0);
            storage_map_ag[var_i] = var_y;
            if (arg1 > totalBorrows) {
            }
            require(!arg1 < (var_y));
            require(storage_map_ag[var_i]);
            require(storage_map_ag[var_i]);
            require((borrowIndex * (storage_map_ag[var_i])) / (storage_map_ag[var_i]) == borrowIndex);
            require(!0x02 > 0x03);
            require(0x02 == 0);
            require(storage_map_ad[var_i]);
            require(storage_map_ad[var_i]);
            require(!0 > 0x03);
        }
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_b = 0;
        var_c = totalBorrows;
        var_d = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_b, var_c, var_d); // staticcall
        if (!ret0.length < 0x20) {
            require(!(ret0.length < 0x20), "could not calculate block delta");
            require(!(var_e.length > 0x048c27395000), "could not calculate block delta");
            require(accrualBlockNumber > block.number, "could not calculate block delta");
            require(!(0x03 > 0x03), "could not calculate block delta");
            var_e = var_t + var_e;
            var_e = var_t + var_e;
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
    /// @custom:signature   seize(address arg0, address arg1, uint256 arg2) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function seize(address arg0, address arg1, uint256 arg2) public returns (uint256) {
        require(bytes1(store_g));
        store_g = uint248(store_g);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_eafe967b(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(arg1)) == (address(arg0)));
        address var_g = address(arg1);
        require(arg2 > storage_map_i[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require((arg2 + storage_map_i[var_g]) < storage_map_i[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(arg1);
        storage_map_i[var_g] = 0;
        var_g = address(arg0);
        storage_map_i[var_g] = 0;
        emit Transfer(address(arg1), address(arg0), arg2);
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(!0x02 > 0x03);
        require(!0x09 > 0x11);
        require(!0x19 > 0x51);
        emit Failure(0x09, 0x19, 0x02);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x09;
        require(!0x03 > 0x03);
        require(!0x09 > 0x11);
        require(!0x06 > 0x11);
        require(!0x1c > 0x51);
        emit Failure(0x06, 0x1c, 0);
        require(!0x06 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x06;
    }
    
    /// @custom:selector    0x95d89b41
    /// @custom:signature   symbol() public view returns (string memory)
    function symbol() public view returns (string memory) {
        bytes1 var_a = 0x20 + (var_a + (0x20 * (((totalSupplyh & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!bytes1(totalSupplyh)))) / 0x02) + 0x1f) / 0x20)));
        if (!(totalSupplyh & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!totalSupplyh)))) / 0x02) {
            if (0x1f < (totalSupplyh & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!totalSupplyh))) / 0x02)) {
                var_c = 0x02;
                if ((var_a + 0x20) + (totalSupplyh & (0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff + (0x0100 * (!totalSupplyh))) / 0x02) > (0x20 + (var_a + 0x20))) {
                    if (!var_a.length) {
                        return abi.encodePacked(0x20, var_a.length, (~((0x0100 ** (0x20 - (bytes1(var_a.length)))) - 0x01)) & (var_g));
                        return abi.encodePacked(0x20, var_a.length);
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0xf2b3abbd
    /// @custom:signature   _setInterestRateModel(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setInterestRateModel(address arg0) public returns (uint256) {
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
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_e = 0;
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
    
    /// @custom:selector    0xa6afed95
    /// @custom:signature   accrueInterest() public returns (uint256)
    function accrueInterest() public returns (uint256) {
        require(!block.number == accrualBlockNumber);
        return 0;
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_b = 0;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_b); // staticcall
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
    
    /// @custom:selector    0x70a08231
    /// @custom:signature   balanceOf(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function balanceOf(address arg0) public view returns (uint256) {
        address var_a = address(arg0);
        return storage_map_b[var_a];
    }
    
    /// @custom:selector    0x4576b5db
    /// @custom:signature   _setComptroller(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setComptroller(address arg0) public returns (uint256) {
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
    
    /// @custom:selector    0x4e4d9fea
    /// @custom:signature   repayBorrow() public payable
    function repayBorrow() public payable {
        require(bytes1(store_g), "                       ");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "                       ");
        require(!0, "                       ");
        require(!(0 > 0x11), "                       ");
        require(!(0 > 0x11), "                       ");
        require(!(0x36 > 0x51), "                       ");
        emit Failure(0, 0x36, 0);
        require(!(0 > 0x11), "                       ");
        store_g = 0x01 | (uint248(store_g));
        uint256 var_d = 0x40 + var_d;
        require(0, "                       ");
        var_d = var_d + (0x20 + (uint248(0x1f + (0x05 + var_d.length))));
        require(!(0x05 + var_d.length), "                       ");
        require(0x02 < var_d.length, "                       ");
        require(0x03 < var_d.length, "                       ");
        require(0x04 < var_d.length, "                       ");
        require(!0, "                       ");
        require(!(bytes1(var_d.length)), "                       ");
        address var_p = address(this);
        address var_q = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }repayBorrowAllowed(var_p, var_q); // call
        require(!(ret0.length < 0x20), "sender mismatch");
        require(!var_d.length, "sender mismatch");
        require(accrualBlockNumber == block.number, "sender mismatch");
        address var_y = address(msg.sender);
        var_y = address(msg.sender);
        require(storage_map_x[var_y], "sender mismatch");
        require(storage_map_y[var_y], "sender mismatch");
        require(storage_map_y[var_y], "sender mismatch");
        require((borrowIndex * (storage_map_y[var_y])) / (storage_map_y[var_y]) == borrowIndex, "sender mismatch");
        require(!(0x02 > 0x03), "sender mismatch");
        require(0x02 == 0, "sender mismatch");
        require(storage_map_w[var_y], "sender mismatch");
        require(!(0x01 > 0x03), "sender mismatch");
        require(0x01 == 0, "sender mismatch");
        require(storage_map_z[var_y], "sender mismatch");
        require(storage_map_z[var_y], "sender mismatch");
        require((borrowIndex * (storage_map_z[var_y])) / (storage_map_z[var_y]) == borrowIndex, "sender mismatch");
        require(!(0x02 > 0x03), "sender mismatch");
        require(0x02 == 0, "sender mismatch");
        require(storage_map_w[var_y], "sender mismatch");
        require(!(0x01 > 0x03), "sender mismatch");
        require(0x01 == 0, "sender mismatch");
        var_s = 0;
        require(!(0 > 0x03), "sender mismatch");
        require(!(0 > 0x03), "sender mismatch");
        require(!(var_aa > 0x03), "sender mismatch");
        require(var_aa == 0, "sender mismatch");
        require(!(var_aa > 0x03), "sender mismatch");
        require(!(0x09 > 0x11), "sender mismatch");
        require(!(0x37 > 0x51), "sender mismatch");
        emit Failure(0x09, 0x37, var_aa);
        require(!(0x09 > 0x11), "sender mismatch");
        store_g = 0x01 | (uint248(store_g));
        require(0x09, "sender mismatch");
        require(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "sender mismatch");
        require(!(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff), "sender mismatch");
        require(address(msg.sender) == msg.sender, "sender mismatch");
        require(msg.value == (var_ai), "value mismatch");
        require(var_ai > (var_ae));
        require(!0x03 > 0x03);
        require(!0x03 > 0x03);
        require(!(var_aa) > 0x03);
        require(var_aa == 0);
        require(var_aj > (var_ak));
        require(!unresolved_6c4603b4 < (var_am));
        require(!totalBorrows < (var_ak));
        var_y = address(msg.sender);
        storage_map_x[var_y] = var_an;
        storage_map_aa[var_y] = borrowIndex;
        totalBorrows = var_ao;
        unresolved_6c4603b4 = var_ap;
        storage_map_ab[var_y] = var_aq;
        emit RepayBorrow(address(msg.sender), address(msg.sender), var_ar, var_an, var_ao);
        var_af = address(this);
        var_ag = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }repayBorrowVerify(var_af, var_ag); // call
        store_g = 0x01 | (uint248(store_g));
        var_d = 0x40 + var_d;
        require(0, "REPAY_BORROW_NEW_ACCOUNT_BORROW_BALANCE_CALCULATION");
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_p = 0;
        var_q = totalBorrows;
        uint256 var_av = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).getBorrowRate(var_p, var_q, var_av); // staticcall
        require(!ret0.length < 0x20);
        require(!var_d.length > 0x048c27395000);
        require(accrualBlockNumber > block.number);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_d = 0x20 + var_d;
        var_s = 0;
        var_d = 0x20 + var_d;
        require(var_aw);
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
        uint256 var_ax = address(this);
        var_af = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }repayBorrowAllowed(var_ax, var_af); // call
        if (!ret0.length < 0x20) {
            require(!ret0.length < 0x20);
            require(!var_d.length);
            var_y = address(msg.sender);
            require(accrualBlockNumber == block.number);
        }
        require(!0x0a > 0x11);
        require(!0x39 > 0x51);
        emit Failure(0x0a, 0x39, 0);
        require(!0x0a > 0x11);
        if (var_aw) {
            require(var_aw, "could not calculate block delta");
        }
    }
    
    /// @custom:selector    0x23b872dd
    /// @custom:signature   transferFrom(address arg0, address arg1, uint256 arg2) public returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg2 ["uint256", "bytes32", "int256"]
    function transferFrom(address arg0, address arg1, uint256 arg2) public returns (bool) {
        require(bytes1(store_g));
        store_g = uint248(store_g);
        address var_b = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }Unresolved_bdcdc258(var_b); // call
        require(!ret0.length < 0x20);
        require(!var_f.length);
        require(!(address(arg0)) == (address(arg1)));
        require(!(address(arg0)) == (address(msg.sender)));
        var_g = address(msg.sender);
        require(arg2 > storage_map_i[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg0);
        require(arg2 > storage_map_i[var_g]);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        var_g = address(arg1);
        require((arg2 + storage_map_i[var_g]) < storage_map_i[var_g]);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        var_g = address(arg0);
        storage_map_i[var_g] = 0;
        var_g = address(arg1);
        storage_map_i[var_g] = 0;
        require(storage_map_i[var_g] == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
        emit Transfer(address(arg0), address(arg1), arg2);
        store_g = 0x01 | (uint248(store_g));
        return !(!0 == 0);
        var_g = address(msg.sender);
        storage_map_i[var_g] = 0;
        emit Transfer(address(arg0), address(arg1), arg2);
        store_g = 0x01 | (uint248(store_g));
        return !(!0 == 0);
        require(!0x09 > 0x11);
        require(!0x4d > 0x51);
        emit Failure(0x09, 0x4d, 0);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return !(!0x09 == 0);
        require(!0x09 > 0x11);
        require(!0x09 > 0x11);
        require(!0x03 > 0x11);
        require(!0x4a > 0x51);
        emit Failure(0x03, 0x4a, var_f.length);
        require(!0x03 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return !(!0x03 == 0);
    }
    
    /// @custom:selector    0x8cd01307
    /// @custom:signature   Unresolved_8cd01307(uint256 arg0, uint256 arg1) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_8cd01307(uint256 arg0, uint256 arg1) public returns (uint256) {
        require(bytes1(store_g));
        store_g = uint248(store_g);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x08 > 0x51);
        emit Failure(0, 0x08, 0);
        require(!0 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(accrualBlockNumber == block.number);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        require(!0 < arg0);
        require(!0x0e > 0x11);
        require(!0x09 > 0x51);
        emit Failure(0x0e, 0x09, 0);
        require(!0x0e > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x0e;
        uint256 var_d = var_d + 0xe0;
        address var_i = address(msg.sender);
        require(storage_map_t[var_i]);
        require(storage_map_ac[var_i]);
        require(storage_map_ac[var_i]);
        require((borrowIndex * (storage_map_ac[var_i])) / (storage_map_ac[var_i]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_ad[var_i]);
        require(storage_map_ad[var_i]);
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!var_d.length > 0x03);
        require(var_d.length == 0);
        require(!(var_k) > 0x03);
        require(!0x09 > 0x11);
        require(!0x07 > 0x51);
        emit Failure(0x09, 0x07, var_k);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x09;
        require((arg0 + (var_o)) < (var_o));
        var_c = 0;
        require(!0x02 > 0x03);
        require(!0x02 > 0x03);
        require(!var_d.length > 0x03);
        require(var_d.length == 0);
        require(!(var_k) > 0x03);
        require(!0x09 > 0x11);
        require(storage_map_ag[var_i]);
        require(storage_map_ag[var_i]);
        require((borrowIndex * (storage_map_ag[var_i])) / (storage_map_ag[var_i]) == borrowIndex);
        require(!0x02 > 0x03);
        require(0x02 == 0);
        require(storage_map_ad[var_i]);
        require(storage_map_ad[var_i]);
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
    }
    
    /// @custom:selector    0x1249c58b
    /// @custom:signature   mint() public payable
    function mint() public payable {
        require(bytes1(store_g), "                ");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "                ");
        require(!0, "                ");
        require(!(0 > 0x11), "                ");
        require(!(0 > 0x11), "                ");
        require(!(0x1e > 0x51), "                ");
        emit Failure(0, 0x1e, 0);
        require(!(0 > 0x11), "                ");
        store_g = 0x01 | (uint248(store_g));
        uint256 var_d = 0x40 + var_d;
        require(0, "                ");
        var_d = var_d + (0x20 + (uint248(0x1f + (0x05 + var_d.length))));
        require(!(0x05 + var_d.length), "                ");
        require(0x02 < var_d.length, "                ");
        require(0x03 < var_d.length, "                ");
        require(0x04 < var_d.length, "                ");
        require(!0, "                ");
        require(!(bytes1(var_d.length)), "                ");
        address var_p = address(this);
        address var_q = address(msg.sender);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }mintAllowed(var_p, var_q); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        require(accrualBlockNumber == block.number);
        require(totalSupply);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        require(!(0 > 0x03), "sender mismatch");
        require(!(0 > 0x03), "sender mismatch");
        require(!(var_t > 0x03), "sender mismatch");
        require(var_t == 0, "sender mismatch");
        require(!(var_t > 0x03), "sender mismatch");
        require(!(0x09 > 0x11), "sender mismatch");
        require(!(0x21 > 0x51), "sender mismatch");
        emit Failure(0x09, 0x21, var_t);
        require(!(0x09 > 0x11), "sender mismatch");
        store_g = 0x01 | (uint248(store_g));
        require(0x09, "sender mismatch");
        require(address(msg.sender) == msg.sender, "sender mismatch");
        require(msg.value == msg.value, "value mismatch");
        var_x = 0x20;
        require(0x0de0b6b3a7640000, "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(0 == 0, "MINT_EXCHANGE_CALCULATION");
        var_d = var_d + 0x20;
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(0 == 0, "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(!(0 > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(!(var_t > 0x03), "MINT_EXCHANGE_CALCULATION");
        require(var_t == 0, "MINT_EXCHANGE_CALCULATION");
        require((var_ag + totalSupply) < totalSupply, "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(0x02 > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(0x02 > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(!(var_t > 0x03), "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        require(var_t == 0, "MINT_NEW_TOTAL_SUPPLY_CALCULATION");
        if (!0 > 0x03) {
            require(!0 > 0x03);
            require(!0 > 0x03);
            require(0x0de0b6b3a7640000);
        }
        require(!0x0a > 0x11);
        require(!0x22 > 0x51);
        emit Failure(0x0a, 0x22, 0);
        require(!0x0a > 0x11);
    }
    
    /// @custom:selector    0xb71d1a0c
    /// @custom:signature   _setPendingAdmin(address arg0) public returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPendingAdmin(address arg0) public returns (uint256) {
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x45 > 0x51);
        emit Failure(0x01, 0x45, 0);
        require(!0x01 > 0x11);
        return 0x01;
        pendingAdmin = (address(arg0)) | (uint96(pendingAdmin));
        emit NewPendingAdmin(address(pendingAdmin), address(arg0));
        return 0;
    }
    
    /// @custom:selector    0x852a12e3
    /// @custom:signature   redeemUnderlying(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function redeemUnderlying(uint256 arg0) public returns (uint256) {
        require(bytes1(store_g), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!(0x27 > 0x51), "one of redeemTokensIn or redeemAmountIn must be zero");
        emit Failure(0, 0x27, 0);
        require(!(0 > 0x11), "one of redeemTokensIn or redeemAmountIn must be zero");
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(!0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(!arg0, "one of redeemTokensIn or redeemAmountIn must be zero");
        require(totalSupply);
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_l) > 0x03);
        require(var_l == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        require(!0x2b > 0x51);
        emit Failure(0x09, 0x2b, var_l);
        require(!0x09 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x09;
        require(!0);
        uint256 var_o = 0;
        require(0x0de0b6b3a7640000);
        require(!0 > 0x03);
        require(0 == 0);
        var_e = var_e + 0x20;
        require(!0 > 0x03);
        require(0 == 0);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_l) > 0x03);
        require(var_l == 0);
        require(!(var_l) > 0x03);
        require(!0x09 > 0x11);
        address var_s = address(this);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_o ether }Unresolved_eabe7d91(var_s); // call
        require(!ret0.length < 0x20);
        require(!var_e.length);
        require(accrualBlockNumber == block.number);
        require(!0x0a > 0x11);
        require(!0x2c > 0x51);
        emit Failure(0x0a, 0x2c, 0);
        require(!0x0a > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x0a;
        require(!0x03 > 0x11);
        require(!0x28 > 0x51);
        emit Failure(0x03, 0x28, var_e.length);
        require(!0x03 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0x03;
        if (!0 > 0x03) {
            require(!(0 > 0x03), "re-entered");
            require(!(0 > 0x03), "re-entered");
            require(0x0de0b6b3a7640000, "re-entered");
        }
    }
    
    /// @custom:selector    0x95dd9193
    /// @custom:signature   borrowBalanceStored(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowBalanceStored(address arg0) public view returns (bytes memory) {
        address var_a = address(arg0);
        require(storage_map_b[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_aj[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_aj[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_aj[var_a])) / (storage_map_aj[var_a]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ak[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ak[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        uint256 var_h = 0;
        return abi.encodePacked(0, 0);
        require(storage_map_al[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_al[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require((borrowIndex * (storage_map_al[var_a])) / (storage_map_al[var_a]) == borrowIndex, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0x02 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0x02 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ak[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(storage_map_ak[var_a], "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(!(0 > 0x03), "borrowBalanceStored: borrowBalanceStoredInternal failed");
        require(0 == 0, "borrowBalanceStored: borrowBalanceStoredInternal failed");
        return abi.encodePacked(0 / (storage_map_ak[var_a]), 0 / (storage_map_ak[var_a]));
    }
    
    /// @custom:selector    0xaae40a2a
    /// @custom:signature   liquidateBorrow(address arg0, address arg1) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function liquidateBorrow(address arg0, address arg1) public payable {
        require(bytes1(store_g), "                           ");
        store_g = uint248(store_g);
        require(!(block.number == accrualBlockNumber), "                           ");
        require(!0, "                           ");
        require(!(0 > 0x11), "                           ");
        require(!(0 > 0x11), "                           ");
        require(!(0x0f > 0x51), "                           ");
        emit Failure(0, 0x0f, 0);
        require(!(0 > 0x11), "                           ");
        store_g = 0x01 | (uint248(store_g));
        uint256 var_d = 0x40 + var_d;
        require(0, "                           ");
        var_d = var_d + (0x20 + (uint248(0x1f + (0x05 + var_d.length))));
        require(!(0x05 + var_d.length), "                           ");
        require(0x02 < var_d.length, "                           ");
        require(0x03 < var_d.length, "                           ");
        require(0x04 < var_d.length, "                           ");
        require(!0, "                           ");
        require(!(bytes1(var_d.length)), "                           ");
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).{ value: 0 ether }accrueInterest(); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        address var_p = address(this);
        address var_q = address(arg1);
        address var_r = address(arg0);
        uint256 var_i = msg.value;
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }liquidateBorrowAllowed(var_p, var_q, var_r, var_i); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        require(accrualBlockNumber == block.number);
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).accrualBlockNumber(); // staticcall
        if (!ret0.length < 0x20) {
            require(!ret0.length < 0x20);
            require(var_d.length == block.number);
            require(!(address(arg0)) == (address(msg.sender)));
            require(msg.value);
            require(!msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff);
            require(!0x07 > 0x11);
            emit Failure(0x07, 0x14, 0);
            require(!0x14 > 0x51);
            store_g = 0x01 | (uint248(store_g));
            var_d = 0x40 + var_d;
            require(!0x07 > 0x11);
            var_d = var_d + (0x20 + (uint248(0x1f + (0x05 + var_d.length))));
            require(0x07);
        }
        var_p = address(this);
        var_q = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: 0 ether }repayBorrowAllowed(var_p, var_q); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        require(accrualBlockNumber == block.number);
        var_d = var_d + 0x0180;
        uint256 var_s = 0;
        address var_z = address(arg0);
        var_z = address(arg0);
        require(storage_map_an[var_z]);
        require(!0 > 0x03);
        require(!0 > 0x03);
        require(!(var_ab) > 0x03);
        require(var_ab == 0);
        require(!(var_ab) > 0x03);
        require(!0x09 > 0x11);
        require(!0x37 > 0x51);
        emit Failure(0x09, 0x37, var_ab);
        require(!0x09 > 0x11);
        require(!0x09);
        uint256 var_af = address(this);
        uint256 var_ag = address(arg1);
        uint256 var_ah = 0;
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).Unresolved_c488847b(var_af, var_ag, var_ah); // staticcall
        require(!ret0.length < 0x40);
        require(!var_d.length);
        var_af = address(arg0);
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).balanceOf(var_af); // staticcall
        require(!(ret0.length < 0x20), "LIQUIDATE_SEIZE_TOO_MUCH");
        require(!(var_d.length < (var_ai)), "LIQUIDATE_SEIZE_TOO_MUCH");
        require(!address(this) == (address(arg1)));
        var_af = address(msg.sender);
        var_ag = address(arg0);
        var_ah = var_aj;
        require(address(arg1).code.length);
        (bool success, bytes memory ret0) = address(arg1).{ value: var_s ether }Unresolved_b2a02ff1(var_af, var_ag, var_ah); // call
        require(!ret0.length < 0x20);
        require(!var_d.length);
        emit LiquidateBorrow(address(msg.sender), address(arg0), 0, address(arg1), var_aj);
        var_af = address(this);
        var_ag = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }liquidateBorrowVerify(var_af, var_ag); // call
        require(!ret0.length < 0x20);
        store_g = 0x01 | (uint248(store_g));
        var_d = 0x40 + var_d;
        require(0);
        var_af = address(this);
        var_ag = address(this);
        var_ah = address(msg.sender);
        uint256 var_am = address(arg0);
        require(address(comptroller).code.length);
        (bool success, bytes memory ret0) = address(comptroller).{ value: var_s ether }seizeAllowed(var_af, var_ag, var_ah, var_am); // call
        require(!(ret0.length < 0x20), "token seizure failed");
        require(!var_d.length, "token seizure failed");
        require(!(address(arg0) == (address(msg.sender))), "token seizure failed");
        var_z = address(arg0);
        require(var_aj > storage_map_an[var_z], "token seizure failed");
        require(!(0x03 > 0x03), "token seizure failed");
        require(0x03 == 0, "token seizure failed");
        var_z = address(msg.sender);
        require(var_aj + storage_map_an[var_z] < storage_map_an[var_z], "token seizure failed");
        require(!(0x02 > 0x03), "token seizure failed");
        require(0x02 == 0, "token seizure failed");
        var_z = address(arg0);
        storage_map_an[var_z] = 0;
        var_z = address(msg.sender);
        storage_map_an[var_z] = 0;
        emit Transfer(address(arg0), address(msg.sender), var_aj);
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
        require(!(0x09 > 0x11), "sender mismatch");
        require(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff, "sender mismatch");
        require(!(msg.value == 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff), "sender mismatch");
        require(address(msg.sender) == msg.sender, "sender mismatch");
        require(msg.value == (var_ap), "value mismatch");
        require(!var_d.length > 0x11);
    }
    
    /// @custom:selector    0xfca7820b
    /// @custom:signature   _setReserveFactor(uint256 arg0) public returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _setReserveFactor(uint256 arg0) public returns (uint256) {
        require(bytes1(store_g));
        store_g = uint248(store_g);
        require(!block.number == accrualBlockNumber);
        require(!0);
        require(!0 > 0x11);
        require(!0 > 0x11);
        require(!0x46 > 0x51);
        emit Failure(0, 0x46, 0);
        require(!0 > 0x11);
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(msg.sender == (address(admin)));
        require(!0x01 > 0x11);
        require(!0x47 > 0x51);
        var_a = 0x01;
        emit Failure(0x01, 0x47, 0);
        require(!0x01 > 0x11);
        store_g = var_a | (uint248(store_g));
        return 0x01;
        require(accrualBlockNumber == block.number);
        require(!arg0 > 0x0de0b6b3a7640000);
        reserveFactorMantissa = arg0;
        emit NewReserveFactor(reserveFactorMantissa, arg0);
        store_g = 0x01 | (uint248(store_g));
        return 0;
        require(msg.value > address(this).balance);
        require(!0x03 > 0x03);
        require(0x03 == 0);
        uint256 var_d = 0;
        var_e = totalBorrows;
        var_f = totalReserves;
        require(address(interestRateModel).code.length);
        (bool success, bytes memory ret0) = address(interestRateModel).Unresolved_15f24053(var_d, var_e, var_f); // staticcall
        require(!(ret0.length < 0x20), "could not calculate block delta");
        require(!(var_g.length > 0x048c27395000), "could not calculate block delta");
        require(accrualBlockNumber > block.number, "could not calculate block delta");
        require(!(0x03 > 0x03), "could not calculate block delta");
        require(0x03 == 0, "could not calculate block delta");
        var_g = 0x20 + var_g;
        var_g = 0x20 + var_g;
        require(var_o, "could not calculate block delta");
        require(!(0 > 0x03), "could not calculate block delta");
        require(0 == 0, "could not calculate block delta");
        var_g = var_g + 0x20;
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
        store_g = 0x01 | (uint248(store_g));
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
}