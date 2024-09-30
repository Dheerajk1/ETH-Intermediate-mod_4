// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable
{
    constructor() ERC20("Dheeraj", "DK") Ownable(msg.sender) {}

    // Function for minting tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function for burning tokens
    function burn(address from, uint256 amount) public onlyOwner {
        _burn(from, amount);
    }

    // Function for transferring tokens
    function transferTokens(address to, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _transfer(msg.sender, to, amount);
    }

    struct Entity {
        string name;
        uint256 price;
    }

    mapping(uint256 => Entity) public features;  // Storing available features
    mapping(address => mapping(uint256 => bool)) public userFeatures;  // Tracking purchased features

    event FeaturePurchased(address indexed user, uint256 featureId, string featureName);

    // Adding a new feature
    function addFeature(uint256 featureId, string memory name, uint256 price) public onlyOwner {
        features[featureId] = Entity(name, price);
    }

    // Buying a feature
    function buyFeature(uint256 featureId) public {
        Entity memory feature = features[featureId];
        require(bytes(feature.name).length != 0, "Feature does not exist");
        require(!userFeatures[msg.sender][featureId], "Feature already purchased");
        require(balanceOf(msg.sender) >= feature.price, "Insufficient balance");

        _transfer(msg.sender, address(this), feature.price);

        userFeatures[msg.sender][featureId] = true;

        emit FeaturePurchased(msg.sender, featureId, feature.name);
    }

    // Check if a feature has been purchased
    function hasPurchasedFeature(address user, uint256 featureId) public view returns (bool) {
        return userFeatures[user][featureId];
    }
}
