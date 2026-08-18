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
    uint256 public constant unresolved_9b57cb8f = 1000000000000000000000000000000000000;
    uint256 public constant unresolved_c05361e0 = 1000000;
    bytes public constant unresolved_1f7f6f64 = ;
    
    mapping(bytes32 => bytes32) storage_map_f;
    mapping(bytes32 => bytes32) storage_map_w;
    address public pendingAdmin;
    address public comptrollerImplementation;
    uint256 public unresolved_55072cba;
    mapping(bytes32 => bytes32) storage_map_s;
    address public operator;
    mapping(bytes32 => bytes32) storage_map_af;
    mapping(bytes32 => bytes32) storage_map_j;
    address public insurance;
    address public admin;
    mapping(bytes32 => bytes32) storage_map_k;
    address public getWingAddress;
    address adming;
    uint256 public maxAssets;
    bool public transferGuardianPaused;
    mapping(bytes32 => bytes32) storage_map_e;
    address public pendingComptrollerImplementation;
    bytes32 store_d;
    mapping(bytes32 => bytes32) storage_map_z;
    mapping(bytes32 => bytes32) storage_map_v;
    uint256 public unresolved_d757ca5a;
    mapping(bytes32 => bytes32) storage_map_ab;
    mapping(bytes32 => bytes32) storage_map_h;
    address public oracle;
    mapping(bytes32 => bytes32) storage_map_aa;
    mapping(bytes32 => bytes32) storage_map_y;
    mapping(bytes32 => bytes32) storage_map_p;
    uint256 public closeFactorMantissa;
    mapping(bytes32 => bytes32) storage_map_m;
    uint256 public unresolved_0335c369;
    mapping(bytes32 => bytes32) storage_map_l;
    uint256 public unresolved_593336ba;
    
    
    /// @custom:selector    0x4ce729a8
    /// @custom:signature   Unresolved_4ce729a8(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_4ce729a8(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x6cd7751f
    /// @custom:signature   setInsurance(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setInsurance(address arg0) public payable {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)), "admin");
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isIToken(); // staticcall
        uint256 var_e = var_e + (uint248(ret0.length + 0x1f));
        require(!((var_e + ret0.length) - var_e) < 0x20);
        require(var_e.length == var_e.length);
        require(var_e.length);
        insurance = (address(arg0)) | (uint96(insurance));
    }
    
    /// @custom:selector    0xe1068dd0
    /// @custom:signature   Unresolved_e1068dd0(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_e1068dd0(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x85353faf
    /// @custom:signature   Unresolved_85353faf(uint256 arg0, uint256 arg1) public pure
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["uint256", "bytes32", "int256"]
    function Unresolved_85353faf(uint256 arg0, uint256 arg1) public pure {
        require(!arg0 > 0xffffffffffffffff);
        require(!(arg0) > 0xffffffffffffffff);
        require(!arg1 > 0xffffffffffffffff);
    }
    
    /// @custom:selector    0x3205e017
    /// @custom:signature   Unresolved_3205e017(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_3205e017(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x43f12f0c
    /// @custom:signature   unpauseMarkets() public payable returns (bool)
    function unpauseMarkets() public payable returns (bool) {
        require(msg.sender == (address(admin)));
        if (!0 < store_d) {
            if (0 < store_d) {
                address var_a = address(storage_map_e[var_a]);
                storage_map_f[var_a] = 0 | (uint248(storage_map_f[var_a]));
                if (0 < store_d) {
                    var_a = address(storage_map_e[var_a]);
                    storage_map_f[var_a] = 0 | (uint248(storage_map_f[var_a]));
                    if (0 < store_d) {
                        if (!0) {
                        }
                        transferGuardianPaused = uint248(transferGuardianPaused);
                        return 0x01;
                    }
                }
            }
        }
    }
    
    /// @custom:selector    0x1d736361
    /// @custom:signature   Unresolved_1d736361(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_1d736361(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0xd6143971
    /// @custom:signature   Unresolved_d6143971(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_d6143971(address arg0) public view returns (bytes memory) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return abi.encodePacked(uint224(storage_map_h[var_b]), uint32(storage_map_h[var_b] / 0x0100000000000000000000000000000000000000000000000000000000));
    }
    
    /// @custom:selector    0x4e79238f
    /// @custom:signature   Unresolved_4e79238f(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_4e79238f(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x6d154ea5
    /// @custom:signature   borrowGuardianPaused(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function borrowGuardianPaused(address arg0) public view returns (bool) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return !(!bytes1(storage_map_h[var_b]));
    }
    
    /// @custom:selector    0x4eb324e8
    /// @custom:signature   wingSpeeds(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function wingSpeeds(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0x1ad4aa42
    /// @custom:signature   setPauseOperator(address arg0) public payable returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setPauseOperator(address arg0) public payable returns (bool) {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)));
        var_a = 0x20;
        storage_map_j[var_f] = address(arg0);
        return 0x01;
    }
    
    /// @custom:selector    0x5c0689a7
    /// @custom:signature   Unresolved_5c0689a7() public payable
    function Unresolved_5c0689a7() public payable {
        uint256 var_a = var_a + (0x20 + (0x20 * store_d));
        require(!store_d);
        var_c = 0x0f;
        require((0x20 + var_a) + (0x20 * store_d) > (0x20 + (0x20 + var_a)));
        require(address(var_f).code.length);
        (bool success, bytes memory ret0) = address(var_f).borrowIndex(); // staticcall
        var_a = var_a + (uint248(ret0.length + 0x1f));
        require(!((var_a + ret0.length) - var_a) < 0x20);
        require(var_a.length == var_a.length);
        address var_c = address(var_f);
        var_a = 0x40 + var_a;
        require(!(uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000) > block.number), "                     ");
        var_l = 0x20;
        require(!(0 > var_a.length), "                     ");
        require(!(0x20 > var_a.length), "subtraction underflow");
        require(!(block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) > 0);
        require((block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) > 0);
        var_c = address(var_f);
        require(!storage_map_k[var_c]);
        require(address(var_f).code.length);
        (bool success, bytes memory ret0) = address(var_f).totalSupply(); // staticcall
        var_a = var_a + (uint248(ret0.length + 0x1f));
        require(!((var_a + ret0.length) - var_a) < 0x20);
        require(var_a.length == var_a.length);
        require(!(block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))), "                 ");
        require(!(!block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))), "                 ");
        var_c = address(var_f);
        var_a = 0x40 + var_a;
        require(!((storage_map_k[var_c] + 0) < 0), "                 ");
        var_v = 0x20;
        require(!(0 > var_a.length), "                 ");
        require(!(0x20 > var_a.length), "addition overflow");
        var_c = address(var_f);
        storage_map_k[var_c] = 0;
        var_a = var_v + var_a;
        require(var_a.length > 0, "                 ");
        var_a = 0x40 + var_a;
        require(!(var_af + (var_af) < (var_af)), "                 ");
        uint256 var_ah = 0x20;
        require(!(0 > var_a.length), "                 ");
        require(!(0x20 > var_a.length), "addition overflow");
        var_aj = 0;
        if (var_af < 0x0100000000000000000000000000000000000000000000000000000000) {
            var_a = 0x40 + var_a;
            require(var_af < 0x0100000000000000000000000000000000000000000000000000000000);
            var_c = address(var_f);
            storage_map_k[var_c] = (uint224(uint32(storage_map_k[var_c]) | (var_a.length))) | (0x0100000000000000000000000000000000000000000000000000000000 * (uint32(var_ar)));
            var_c = address(var_f);
            require(block.number < 0x0100000000);
            require(!(uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000)) > block.number);
            require(!(block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) > 0);
            require(!(block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) > 0);
        }
        require(address(var_f).code.length);
        (bool success, bytes memory ret0) = address(var_f).Unresolved_6c4603b4(var_av); // staticcall
        var_a = var_a + (uint248(ret0.length + 0x1f));
        require(!((var_a + ret0.length) - var_a) < 0x20);
        require(var_a.length == var_a.length);
        var_a = 0x40 + var_a;
        if (!var_a.length) {
            require(!var_a.length);
            var_a = 0x40 + var_a;
            require(var_a.length);
            require(var_a.length);
            require(var_a.length);
            require(var_a.length);
        }
        if (!storage_map_k[var_c] > 0) {
        }
        if (!storage_map_k[var_c] + 0) {
            require(!storage_map_k[var_c] + 0);
            var_a = 0x40 + var_a;
            require(0xc097ce7bc90715b34b9f1000000000);
            require(var_a.length);
            require(var_a.length);
            require(storage_map_k[var_c] + 0);
            var_a = 0x40 + var_a;
            require((0xc097ce7bc90715b34b9f1000000000 * (storage_map_k[var_c] + 0)) / (storage_map_k[var_c] + 0) == 0xc097ce7bc90715b34b9f1000000000);
            require(var_a.length);
            require(var_a.length);
        }
        if (!block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) {
            var_c = address(var_f);
            if (!(uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000)) > block.number) {
            }
            if (!(block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000))) > 0) {
            }
            require(!block.number - (uint32(storage_map_k[var_c] / 0x0100000000000000000000000000000000000000000000000000000000)));
        }
        require(address(insurance / 0x01).code.length);
        (bool success, bytes memory ret0) = address(insurance / 0x01).{ value: var_aj ether }Unresolved_0a323ef4(var_ba); // call
    }
    
    /// @custom:selector    0x5ec88c79
    /// @custom:signature   getAccountLiquidity(address arg0) public view
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAccountLiquidity(address arg0) public view {
        require(arg0 == (address(arg0)));
        var_a = 0x20 + var_a;
        var_a = 0x20 + var_a;
        var_a = 0x20 + var_a;
        var_a = 0x20 + var_a;
        address var_q = address(arg0);
        if (!storage_map_l[var_q]) {
            var_q = keccak256(var_q);
            require(!storage_map_l[var_q]);
        }
    }
    
    /// @custom:selector    0xc488847b
    /// @custom:signature   Unresolved_c488847b(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_c488847b(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xdce15449
    /// @custom:signature   Unresolved_dce15449(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_dce15449(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x263aed32
    /// @custom:signature   Unresolved_263aed32(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_263aed32(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x2d70db78
    /// @custom:signature   Unresolved_2d70db78(uint256 arg0) public payable returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_2d70db78(uint256 arg0) public payable returns (bool) {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)));
        transferGuardianPaused = (arg0 * 0x0100) | (uint248(transferGuardianPaused));
        return arg0;
    }
    
    /// @custom:selector    0x5c3f0ed4
    /// @custom:signature   Unresolved_5c3f0ed4(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_5c3f0ed4(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x731f0c2b
    /// @custom:signature   mintGuardianPaused(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function mintGuardianPaused(address arg0) public view returns (bool) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return !(!bytes1(storage_map_h[var_b]));
    }
    
    /// @custom:selector    0xeafe967b
    /// @custom:signature   Unresolved_eafe967b(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_eafe967b(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x1d504dc6
    /// @custom:signature   _become(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _become(address arg0) public payable {
        require(arg0 == (address(arg0)));
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).admin(); // staticcall
        uint256 var_b = var_b + (uint248(ret0.length + 0x1f));
        require(!((var_b + ret0.length) - var_b) < 0x20);
        require(var_b.length == (address(var_b.length)));
        require(address(msg.sender) == (address(var_b.length)));
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).{ value: 0 ether }_acceptImplementation(); // call
        var_b = var_b + (uint248(ret0.length + 0x1f));
        require(!((var_b + ret0.length) - var_b) < 0x20);
        require(var_b.length == var_b.length);
        require(!var_b.length);
    }
    
    /// @custom:selector    0x5e089b4f
    /// @custom:signature   Unresolved_5e089b4f() public view returns (address)
    function Unresolved_5e089b4f() public view returns (address) {
        var_a = 0x20;
        return address(storage_map_m[var_g]);
    }
    
    /// @custom:selector    0x9caf5021
    /// @custom:signature   Unresolved_9caf5021(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_9caf5021(uint256 arg0) public payable {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)), "admin");
        require(msg.sender == (address(operator)), "admin");
        unresolved_593336ba = arg0;
    }
    
    /// @custom:selector    0x59e81259
    /// @custom:signature   Unresolved_59e81259(uint256 arg0, address arg1) public pure
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_59e81259(uint256 arg0, address arg1) public pure {
        require(!arg0 > 0xffffffffffffffff);
        require(!(arg0) > 0xffffffffffffffff);
        require(!((var_a + ((0x20 * (arg0)) + 0x20)) < var_a) | ((var_a + ((0x20 * (arg0)) + 0x20)) > 0xffffffffffffffff));
        uint256 var_a = var_a + ((0x20 * (arg0)) + 0x20);
        require(!0 < (arg0));
        require(!((var_a + 0x40) < var_a) | ((var_a + 0x40) > 0xffffffffffffffff));
        require((arg0 + 0x20) == (address(arg0 + 0x20)));
    }
    
    /// @custom:selector    0xd88a0665
    /// @custom:signature   Unresolved_d88a0665(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_d88a0665(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xede4edd0
    /// @custom:signature   exitMarket(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function exitMarket(address arg0) public payable {
        require(arg0 == (address(arg0)));
        address var_b = address(msg.sender);
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).Unresolved_c37f68e2(var_b); // staticcall
        uint256 var_c = var_c + (uint248(ret0.length + 0x1f));
        require(!((var_c + ret0.length) - var_c) < 0x80);
        require(var_c.length == var_c.length);
    }
    
    /// @custom:selector    0xf7f866f2
    /// @custom:signature   Unresolved_f7f866f2(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_f7f866f2(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0x52d84d1e
    /// @custom:signature   allMarkets(uint256 arg0) public view returns (address)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function allMarkets(uint256 arg0) public view returns (address) {
        require(arg0 == arg0);
        require(arg0 < store_d);
        var_a = 0x0f;
        return address(storage_map_p[var_a]);
    }
    
    /// @custom:selector    0x1c4f3f31
    /// @custom:signature   pauseMarkets() public payable returns (bool)
    function pauseMarkets() public payable returns (bool) {
        var_a = 0x20;
        require(!address(storage_map_j[var_f]));
        require(address(storage_map_j[var_f]) == msg.sender);
        if (!0 < store_d) {
            require(!0 < store_d);
            address var_g = address(storage_map_s[var_g]);
            storage_map_m[var_g] = 0x01 | (uint248(storage_map_m[var_g]));
            require(0 < store_d);
            var_g = address(storage_map_s[var_g]);
            storage_map_m[var_g] = 0x01 | (uint248(storage_map_m[var_g]));
            require(0 < store_d);
            require(0 < store_d);
        }
        transferGuardianPaused = 0x0100 | (uint248(transferGuardianPaused));
        return 0x01;
        require(address(storage_map_j[var_f]));
    }
    
    /// @custom:selector    0xb70a3fcf
    /// @custom:signature   Unresolved_b70a3fcf(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_b70a3fcf(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0xc3ea6d56
    /// @custom:signature   Unresolved_c3ea6d56(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_c3ea6d56(uint256 arg0) public payable returns (uint256) {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)));
        unresolved_0335c369 = arg0;
        return 0;
    }
    
    /// @custom:selector    0x8e8f294b
    /// @custom:signature   markets(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function markets(address arg0) public view returns (bool) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return abi.encodePacked(!(!bytes1(storage_map_h[var_b])), storage_map_v[var_b], (bytes1(storage_map_w[var_b])));
    }
    
    /// @custom:selector    0x42cbb15c
    /// @custom:signature   getBlockNumber() public view returns (uint256)
    function getBlockNumber() public view returns (uint256) {
        return block.number;
    }
    
    /// @custom:selector    0xe592e843
    /// @custom:signature   Unresolved_e592e843(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_e592e843(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x317b0b77
    /// @custom:signature   _setCloseFactor(uint256 arg0) public payable returns (uint256)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function _setCloseFactor(uint256 arg0) public payable returns (uint256) {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)));
        require(arg0 > 0xb1a2bc2ec50000);
        require(arg0 < 0x0c7d713b49da0000);
        closeFactorMantissa = arg0;
        return 0;
    }
    
    /// @custom:selector    0xa1860a5e
    /// @custom:signature   Unresolved_a1860a5e(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_a1860a5e(address arg0) public view returns (bytes memory) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return abi.encodePacked(uint224(storage_map_h[var_b]), uint32(storage_map_h[var_b] / 0x0100000000000000000000000000000000000000000000000000000000));
    }
    
    /// @custom:selector    0xf196980a
    /// @custom:signature   Unresolved_f196980a(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_f196980a(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xba600042
    /// @custom:signature   Unresolved_ba600042(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_ba600042(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0x8ebf6364
    /// @custom:signature   Unresolved_8ebf6364(uint256 arg0) public payable returns (bool)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_8ebf6364(uint256 arg0) public payable returns (bool) {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)));
        transferGuardianPaused = arg0 | (uint248(transferGuardianPaused));
        return arg0;
    }
    
    /// @custom:selector    0xb0772d0b
    /// @custom:signature   getAllMarkets() public view returns (bytes memory)
    function getAllMarkets() public view returns (bytes memory) {
        uint256 var_a = var_a + (0x20 + (0x20 * store_d));
        if (!store_d) {
            var_c = 0x0f;
            if ((0x20 + var_a) + (0x20 * store_d) > (0x20 + (0x20 + var_a))) {
                return abi.encodePacked(0x20, var_a.length);
            }
        }
    }
    
    /// @custom:selector    0xe4028eee
    /// @custom:signature   Unresolved_e4028eee(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_e4028eee(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x3b1ff29c
    /// @custom:signature   Unresolved_3b1ff29c(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_3b1ff29c(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xc57edd15
    /// @custom:signature   setWingAddress(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setWingAddress(address arg0) public payable {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)));
        getWingAddress = (address(arg0)) | (uint96(getWingAddress));
    }
    
    /// @custom:selector    0xc2998238
    /// @custom:signature   Unresolved_c2998238(uint256 arg0, address arg1) public view returns (bytes memory)
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_c2998238(uint256 arg0, address arg1) public view returns (bytes memory) {
        require(!arg0 > 0xffffffffffffffff);
        require(!(arg0) > 0xffffffffffffffff);
        require(!((var_a + ((0x20 * (arg0)) + 0x20)) < var_a) | ((var_a + ((0x20 * (arg0)) + 0x20)) > 0xffffffffffffffff));
        uint256 var_a = var_a + ((0x20 * (arg0)) + 0x20);
        require(!0 < (arg0));
        require((arg0 + 0x20) == (address(arg0 + 0x20)));
        var_a = var_a + (0x20 + (0x20 * var_a.length));
        require(!var_a.length);
        var_d = this.code[24335:24335];
        address var_e = address(var_d);
        require(bytes1(storage_map_y[var_e]));
        var_e = address(msg.sender);
        require(!0x01 == (bytes1(storage_map_y[var_e])));
        require(!0 > 0x16);
        return abi.encodePacked(0x20, var_a.length);
    }
    
    /// @custom:selector    0x55ee1fe1
    /// @custom:signature   _setPriceOracle(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function _setPriceOracle(address arg0) public payable returns (uint256) {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)));
        return 0x10;
        oracle = (address(arg0)) | (uint96(oracle));
        return 0;
    }
    
    /// @custom:selector    0x66c61ea6
    /// @custom:signature   approveInsurance(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function approveInsurance(uint256 arg0) public payable {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)), "admin or operator");
        require(msg.sender == (address(operator)), "admin or operator");
        address var_b = address(insurance);
        require(address(getWingAddress).code.length);
        (bool success, bytes memory ret0) = address(getWingAddress).{ value: 0 ether }Unresolved_095ea7b3(var_b); // call
        uint256 var_e = var_e + (uint248(ret0.length + 0x1f));
        require(!(((var_e + ret0.length) - var_e) < 0x20), "failed");
        require(var_e.length == var_e.length, "failed");
        require(var_e.length, "failed");
    }
    
    /// @custom:selector    0xfc8d77bb
    /// @custom:signature   Unresolved_fc8d77bb(uint256 arg0) public payable
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    function Unresolved_fc8d77bb(uint256 arg0) public payable {
        require(arg0 == arg0);
        require(msg.sender == (address(admin)), "admin");
        require(msg.sender == (address(operator)), "admin");
        require(arg0 < 0x0de0b6b3a7640000);
        unresolved_55072cba = arg0;
    }
    
    /// @custom:selector    0xc418c67b
    /// @custom:signature   Unresolved_c418c67b(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_c418c67b(address arg0) public payable {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)), "admin");
        address var_e = address(arg0);
        require(0x01 == (bytes1(storage_map_z[var_e])), "market");
        storage_map_aa[var_e] = uint248(storage_map_aa[var_e]);
    }
    
    /// @custom:selector    0x9e73624b
    /// @custom:signature   Unresolved_9e73624b() public view returns (uint256)
    function Unresolved_9e73624b() public view returns (uint256) {
        var_a = 0x20;
        return storage_map_m[var_g];
    }
    
    /// @custom:selector    0xabfceffc
    /// @custom:signature   getAssetsIn(address arg0) public view returns (bytes memory)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function getAssetsIn(address arg0) public view returns (bytes memory) {
        require(arg0 == (address(arg0)));
        address var_a = address(arg0);
        address var_c = var_c + (0x20 + (0x20 * storage_map_f[var_a]));
        require(!storage_map_f[var_a]);
        var_a = keccak256(var_a);
        require((0x20 + var_c) + (0x20 * storage_map_f[var_a]) > (0x20 + (0x20 + var_c)));
        return abi.encodePacked(0x20, var_c.length);
    }
    
    /// @custom:selector    0xeabe7d91
    /// @custom:signature   Unresolved_eabe7d91(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_eabe7d91(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x013b18ef
    /// @custom:signature   Unresolved_013b18ef(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_013b18ef(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xbdcdc258
    /// @custom:signature   Unresolved_bdcdc258(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_bdcdc258(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xb3ab15fb
    /// @custom:signature   setOperator(address arg0) public payable
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function setOperator(address arg0) public payable {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)), "admin");
        operator = (address(arg0)) | (uint96(operator));
    }
    
    /// @custom:selector    0x76374531
    /// @custom:signature   Unresolved_76374531(uint256 arg0, address arg1) public pure
    /// @param              arg0 ["uint256", "bytes32", "int256"]
    /// @param              arg1 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_76374531(uint256 arg0, address arg1) public pure {
        require(!arg0 > 0xffffffffffffffff);
        require(!(arg0) > 0xffffffffffffffff);
        require(!((var_a + ((0x20 * (arg0)) + 0x20)) < var_a) | ((var_a + ((0x20 * (arg0)) + 0x20)) > 0xffffffffffffffff));
        require(!0 < (arg0));
        require((arg0 + 0x20) == (address(arg0 + 0x20)));
        require(!arg1 > 0xffffffffffffffff);
    }
    
    /// @custom:selector    0x6e2cf5af
    /// @custom:signature   Unresolved_6e2cf5af(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_6e2cf5af(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x9d0265a4
    /// @custom:signature   Unresolved_9d0265a4(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_9d0265a4(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0x2720c4f1
    /// @custom:signature   Unresolved_2720c4f1(address arg0) public view returns (bool)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_2720c4f1(address arg0) public view returns (bool) {
        require(arg0 == (address(arg0)));
        return !(!0x01 == (storage_map_ab[var_h]));
    }
    
    /// @custom:selector    0x2e06d7b1
    /// @custom:signature   liquidationIncentiveMantissa(address arg0) public view returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function liquidationIncentiveMantissa(address arg0) public view returns (uint256) {
        require(arg0 == (address(arg0)));
        address var_b = arg0;
        return storage_map_h[var_b];
    }
    
    /// @custom:selector    0x18c882a5
    /// @custom:signature   Unresolved_18c882a5(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_18c882a5(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
    
    /// @custom:selector    0xcab4f84c
    /// @custom:signature   supportMarket(address arg0) public payable returns (uint256)
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function supportMarket(address arg0) public payable returns (uint256) {
        require(arg0 == (address(arg0)));
        require(msg.sender == (address(admin)));
        return 0x12;
        address var_b = address(arg0);
        require(!bytes1(storage_map_h[var_b]));
        return 0x11;
        require(address(arg0).code.length);
        (bool success, bytes memory ret0) = address(arg0).isFToken(); // staticcall
        uint256 var_d = var_d + (uint248(ret0.length + 0x1f));
        require(!((var_d + ret0.length) - var_d) < 0x20);
        require(var_d.length == var_d.length);
        var_d = var_d + 0x60;
        var_e = 0x01;
        var_b = address(arg0);
        storage_map_h[var_b] = (uint248(storage_map_h[var_b])) | var_d.length;
        storage_map_v[var_b] = var_h;
        storage_map_w[var_b] = (uint248(storage_map_w[var_b])) | (var_i);
        require(!0 < store_d);
        require(0 < store_d);
        var_b = 0x0f;
        require(!(address(storage_map_af[var_b])) == (address(arg0)));
        store_d = store_d + 0x01;
        adming = (address(arg0)) | (uint96(adming));
        var_b = address(arg0);
        require(0x01 == (bytes1(storage_map_h[var_b])), "listed");
        require(!(bytes1(storage_map_w[var_b])), "added");
        storage_map_w[var_b] = var_e | (uint248(storage_map_w[var_b]));
        var_b = address(arg0);
        require(!(!uint224(storage_map_h[var_b])), "      ");
        require(!(!uint224(storage_map_h[var_b])), "      ");
        var_b = address(arg0);
        require(!(!uint224(storage_map_h[var_b])), "      ");
        require(!(!uint224(storage_map_h[var_b])), "      ");
        return 0;
        var_d = 0x40 + var_d;
        require(block.number < 0x0100000000, "      ");
        require(!(0 > var_d.length), "      ");
        require(!(0x20 > var_d.length), "32bits");
        var_b = address(arg0);
        storage_map_h[var_b] = (uint224(uint32(storage_map_h[var_b]) | (var_d.length))) | (0x0100000000000000000000000000000000000000000000000000000000 * (uint32(var_w)));
        return 0;
        var_d = 0x40 + var_d;
        require(block.number < 0x0100000000, "      ");
        require(!(0 > var_d.length), "      ");
    }
    
    /// @custom:selector    0x3bcf7ec1
    /// @custom:signature   Unresolved_3bcf7ec1(address arg0) public pure
    /// @param              arg0 ["address", "uint160", "bytes20", "int160"]
    function Unresolved_3bcf7ec1(address arg0) public pure {
        require(arg0 == (address(arg0)));
    }
}