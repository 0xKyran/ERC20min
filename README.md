# ERC20min

## Overview

**ERC20min** is a minimalistic implementation of the ERC20 token standard. This project aims to provide a simplified version of the ERC20 standard, focusing on the essential functionalities needed for token creation and management on the Ethereum blockchain.

## Features

- **Token Transfer**: Transfer tokens between addresses.
- **Allowance Management**: Approve and transfer tokens on behalf of other addresses.
- **Token Information**: Query token name, symbol, decimals, total supply, balances, and allowances.

## Contracts

### ERC20min

This is the main contract implementing the ERC20 standard with minimal features. The contract includes:

- `transfer(address _to, uint256 _value)`: Transfers `_value` tokens from the caller's account to `_to`.
- `transferFrom(address _from, address _to, uint256 _value)`: Transfers `_value` tokens from `_from` to `_to` using the allowance mechanism.
- `approve(address _spender, uint256 _value)`: Approves `_spender` to spend `_value` tokens on behalf of the caller.
- `name()`: Returns the name of the token.
- `decimals()`: Returns the number of decimals the token uses.
- `totalSupply()`: Returns the total supply of tokens.
- `balanceOf(address _owner)`: Returns the balance of `_owner`.
- `allowance(address _owner, address _spender)`: Returns the remaining amount of tokens that `_spender` is allowed to withdraw from `_owner`.

### IERC20min

This is the interface for the `ERC20min` contract. It defines all the functions and events that are implemented in the `ERC20min` contract, providing a standardized way to interact with the contract.

### Notes

NOTE: To prevent attack vectors like the one described [here](https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/), clients SHOULD make sure to create user interfaces in such a way that they set the allowance first to `0` before setting it to another value for the same spender. THOUGH The contract itself shouldn’t enforce it, to allow backwards compatibility with contracts deployed before

NOTE: The popular functions `name()` and `symbol()` are not included in this implementation as its not required by the ERC20 standard.

However `decimals()` is included as it is relied upon by many clients despite the optional implementation as described in the standard. 

The smart contract is also fully complient with the solidity 

## License

This project is licensed under the terms of the MIT license. See the [LICENSE](LICENSE) file for more information.

## Acknowledgements

- [ERC20](https://eips.ethereum.org/EIPS/eip-20)
- Openzeppelin
- ConsenSys

## Author

- [0xKyran](https://0xkyran.dev/)