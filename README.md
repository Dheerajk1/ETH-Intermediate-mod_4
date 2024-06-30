# ETH-Intermediate-mod_4
## Overview

DegenToken is a Solidity smart contract that implements a custom ERC20 token with additional features for minting, burning, ownership control, and purchasing extra features. It allows users to mint new tokens, burn existing tokens, and purchase additional features defined by the contract owner.

## Features

1. **ERC20 Token**: Implements the ERC20 standard with the token name "Dheeraj" and symbol "DK".
2. **Ownership Control**: Utilizes the Ownable contract from OpenZeppelin to manage ownership, ensuring only the contract deployer has certain administrative privileges.
3. **Burnable Tokens**: Inherits from ERC20Burnable to allow token holders to burn (destroy) their own tokens.
4. **Feature Purchasing**: Enables users to purchase additional features defined by the contract owner. Features are stored in a mapping and can be added, queried, and purchased.

## Structure

- `DegenToken.sol`: Contains the main contract code implementing the token functionalities and feature purchasing logic.
- `Entity`: A struct representing a feature with `name` and `price`.
- `features`: A mapping to store available features identified by `featureId`.
- `userFeatures`: A mapping to track features purchased by each user.
- `Events`: Includes an event `FeaturePurchased` triggered upon successful feature purchase.

## Usage

### Requirements

- Solidity compiler version ^0.8.9
- OpenZeppelin contracts:
  - `ERC20.sol`
  - `Ownable.sol`
  - `ERC20Burnable.sol`

### Deployment

Deploy the contract on a compatible Ethereum Virtual Machine (EVM) using Remix or a similar development environment.

### Functionality

- **Minting**: Only the contract owner can mint new tokens using the `mint` function.
- **Feature Management**: The owner can add new features using `addFeature` and users can purchase these features using `buyFeature`.
- **Querying Features**: Check if a user has purchased a feature with `hasPurchasedFeature`.

## License

This project is licensed under the MIT License. See `LICENSE` for more details.

