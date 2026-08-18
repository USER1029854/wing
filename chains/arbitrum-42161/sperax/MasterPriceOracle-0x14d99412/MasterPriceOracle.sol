// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// OpenZeppelin Contracts (last updated v4.9.0) (access/Ownable.sol)

// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

interface IOracle {
    struct PriceData {
        uint256 price;
        uint256 precision;
    }

    struct PriceFeedData {
        address source;
        bytes msgData;
    }

    /// @notice Validates if price feed exists for a `_token`
    /// @param _token address of the desired token.
    /// @return bool if price feed exists.
    /// @dev Function reverts if price feed not set.
    function priceFeedExists(address _token) external view returns (bool);

    /// @notice Gets the price feed for `_token`.
    /// @param _token address of the desired token.
    /// @return (uint256 price, uint256 precision).
    /// @dev Function reverts if the price feed does not exists.
    function getPrice(address _token) external view returns (PriceData memory);
}

/// @title Master Price Oracle for USDs protocol
/// @author Sperax Foundation
/// @notice Communicates with different price feeds to get the price
contract MasterPriceOracle is Ownable, IOracle {
    /// Store price feed data for tokens.
    mapping(address => PriceFeedData) public tokenPriceFeed;

    // Events
    event PriceFeedUpdated(address indexed token, address indexed source, bytes msgData);
    event PriceFeedRemoved(address indexed token);

    // Custom error messages
    error InvalidAddress();
    error UnableToFetchPriceFeed(address token);
    error InvalidPriceFeed(address token);
    error PriceFeedNotFound(address token);

    /// @notice Add/Update price feed for `_token`
    /// @param _token address of the desired token.
    /// @param _source price feed source.
    /// @param _data call data for fetching the price feed.
    /// @dev Have to be extra cautious while updating the price feed.
    function updateTokenPriceFeed(address _token, address _source, bytes memory _data) external onlyOwner {
        if (_token == address(0)) revert InvalidAddress();
        // Validate if the price feed is being emitted correctly.
        _getPriceFeed(_token, _source, _data);

        tokenPriceFeed[_token] = PriceFeedData(_source, _data);
        emit PriceFeedUpdated(_token, _source, _data);
    }

    /// @notice Remove an existing price feed for `_token`.
    /// @param _token address of the token.
    function removeTokenPriceFeed(address _token) external onlyOwner {
        if (tokenPriceFeed[_token].source == address(0)) {
            revert PriceFeedNotFound(_token);
        }
        delete tokenPriceFeed[_token];
        emit PriceFeedRemoved(_token);
    }

    /// @inheritdoc IOracle
    function getPrice(address _token) external view returns (PriceData memory) {
        PriceFeedData memory data = tokenPriceFeed[_token];
        return _getPriceFeed(_token, data.source, data.msgData);
    }

    /// @inheritdoc IOracle
    function priceFeedExists(address _token) external view returns (bool) {
        if (tokenPriceFeed[_token].source == address(0)) return false;
        return true;
    }

    /// @notice Gets the price feed for a `_token` given the feed data.
    /// @param _token address of the desired token.
    /// @param _source price feed source.
    /// @param _msgData call data for fetching feed.
    /// @return priceData (uint256 price, uint256 precision).
    function _getPriceFeed(address _token, address _source, bytes memory _msgData)
        private
        view
        returns (PriceData memory priceData)
    {
        if (_source == address(0)) revert InvalidPriceFeed(_token);
        (bool success, bytes memory response) = _source.staticcall(_msgData);
        if (success) {
            priceData = abi.decode(response, (PriceData));
            return priceData;
        }
        revert UnableToFetchPriceFeed(_token);
    }
}