// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title ERC20min
/// @notice Minimal implementation of the ERC20 standard
/// @author 0xKyran
/// @dev Minimal implementation of the ERC20 standard based on: https://eips.ethereum.org/EIPS/eip-20
/// @custom:experimental This is an experimental contract.

abstract contract ERC20min {

    // Mappings

    /// @notice Stores the balance of each account
    /// @dev Maps addresses to their respective balances
    mapping(address => uint256) public _balances;
    
    /// @notice Stores the allowances
    /// @dev Maps an owner address to a spender address to the allowance amount
    mapping(address => mapping(address => uint256)) public _allowances;

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

    // Variables 

    /// @notice Total supply of the token
    uint256 public _totalSupply;
    
    /// @notice Name of the token
    string public _name;
    
    /// @notice Symbol of the token
    string public _symbol;
    
    /// @notice Decimals of the token
    uint8 public _decimals = 18;

    // Constructor

    /// @notice Initializes the contract with a name and symbol
    /// @param name_ The name of the token
    /// @param symbol_ The symbol of the token
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    // Functions

    /// @notice Transfers tokens to a specified address
    /// @dev Transfers `_value` tokens from the caller's account to `_to`
    /// @param _to The address to transfer to
    /// @param _value The amount to be transferred
    /// @return success A boolean indicating whether the operation succeeded
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_balances[msg.sender] >= _value, "ERC20min: transfer amount exceeds balance");
        _balances[msg.sender] -= _value;
        _balances[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    /// @notice Transfers tokens from one address to another using an allowance
    /// @dev Transfers `_value` tokens from `_from` to `_to` using the allowance mechanism
    /// @param _from The address to transfer from
    /// @param _to The address to transfer to
    /// @param _value The amount to be transferred
    /// @return success A boolean indicating whether the operation succeeded
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_balances[_from] >= _value, "ERC20min: transfer amount exceeds balance");
        require(_allowances[_from][msg.sender] >= _value, "ERC20min: transfer amount exceeds allowance");
        _balances[_from] -= _value;
        _balances[_to] += _value;
        _allowances[_from][msg.sender] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }

    /// @notice Approves the passed address to spend the specified amount of tokens on behalf of msg.sender
    /// @dev Allows `_spender` to withdraw from your account multiple times, up to the `_value` amount
    /// @param _spender The address which will spend the funds
    /// @param _value The amount of tokens to be spent
    /// @return success A boolean indicating whether the operation succeeded
    function approve(address _spender, uint256 _value) public returns (bool success) {
        _allowances[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    // View functions

    /// @notice Returns the number of decimals the token uses
    /// @return The number of decimals the token uses in uint8 format
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    /// @notice Returns the total token supply
    /// @return The total supply of tokens
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    /// @notice Returns the account balance of another account with address `_owner`
    /// @param _owner The address of the account to query the balance of
    /// @return balance The account balance
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balances[_owner];
    }

    /// @notice Returns the amount which `_spender` is still allowed to withdraw from `_owner`
    /// @param _owner The address which owns the funds
    /// @param _spender The address which will spend the funds
    /// @return remaining The remaining amount of tokens allowed to be spent
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return _allowances[_owner][_spender];
    }

}
