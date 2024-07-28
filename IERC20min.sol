// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title IERC20min
/// @notice Interface for the minimal implementation of the ERC20 standard
/// @author 0xKyran
/// @dev Interface for the minimal implementation of the ERC20 standard based on: https://eips.ethereum.org/EIPS/eip-20
interface IERC20min {
    
    // Events

    /// @notice Emitted when tokens are transferred
    /// @param _from The address from which tokens are transferred
    /// @param _to The address to which tokens are transferred
    /// @param _value The amount of tokens transferred
    event Transfer(address indexed _from, address indexed _to, uint256 _value);

    /// @notice Emitted when a new allowance is set by a token owner
    /// @param _owner The address which owns the tokens
    /// @param _spender The address which will spend the tokens
    /// @param _value The amount of tokens allowed to be spent
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    // Functions

    /// @notice Transfers tokens to a specified address
    /// @dev Transfers `_value` tokens from the caller's account to `_to`
    /// @param _to The address to transfer to
    /// @param _value The amount to be transferred
    /// @return success A boolean indicating whether the operation succeeded
    function transfer(address _to, uint256 _value) external returns (bool success);

    /// @notice Transfers tokens from one address to another using an allowance
    /// @dev Transfers `_value` tokens from `_from` to `_to` using the allowance mechanism
    /// @param _from The address to transfer from
    /// @param _to The address to transfer to
    /// @param _value The amount to be transferred
    /// @return success A boolean indicating whether the operation succeeded
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);

    /// @notice Approves the passed address to spend the specified amount of tokens on behalf of msg.sender
    /// @dev Allows `_spender` to withdraw from your account multiple times, up to the `_value` amount
    /// @param _spender The address which will spend the funds
    /// @param _value The amount of tokens to be spent
    /// @return success A boolean indicating whether the operation succeeded
    function approve(address _spender, uint256 _value) external returns (bool success);

    // View functions

    /// @notice Returns the number of decimals the token uses
    /// @return The number of decimals the token uses in uint8 format
    function decimals() external view returns (uint8);

    /// @notice Returns the total token supply
    /// @return The total supply of tokens
    function totalSupply() external view returns (uint256);

    /// @notice Returns the account balance of another account with address `_owner`
    /// @param _owner The address of the account to query the balance of
    /// @return balance The account balance
    function balanceOf(address _owner) external view returns (uint256 balance);

    /// @notice Returns the amount which `_spender` is still allowed to withdraw from `_owner`
    /// @param _owner The address which owns the funds
    /// @param _spender The address which will spend the funds
    /// @return remaining The remaining amount of tokens allowed to be spent
    function allowance(address _owner, address _spender) external view returns (uint256 remaining);

}
