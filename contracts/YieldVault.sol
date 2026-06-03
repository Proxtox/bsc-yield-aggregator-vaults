// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title YieldVault
/// @notice Simple auto-compounding yield vault example for BSC
contract YieldVault {
    mapping(address => uint256) public shares;
    uint256 public totalShares;
    uint256 public totalAssets;

    event Deposited(address indexed user, uint256 assets, uint256 shares);
    event Withdrawn(address indexed user, uint256 assets, uint256 shares);

    function deposit(uint256 assets) external {
        uint256 sharesToMint = totalShares == 0 ? assets : (assets * totalShares) / totalAssets;
        shares[msg.sender] += sharesToMint;
        totalShares += sharesToMint;
        totalAssets += assets;
        emit Deposited(msg.sender, assets, sharesToMint);
    }

    function withdraw(uint256 sharesToBurn) external {
        uint256 assetsToReturn = (sharesToBurn * totalAssets) / totalShares;
        shares[msg.sender] -= sharesToBurn;
        totalShares -= sharesToBurn;
        totalAssets -= assetsToReturn;
        emit Withdrawn(msg.sender, assetsToReturn, sharesToBurn);
    }
}