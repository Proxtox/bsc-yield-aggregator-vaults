const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("YieldVault", function () {
  let vault;
  let owner, user;

  beforeEach(async function () {
    [owner, user] = await ethers.getSigners();
    const Vault = await ethers.getContractFactory("YieldVault");
    vault = await Vault.deploy();
    await vault.deployed();
  });

  it("Should allow deposits and track shares", async function () {
    await vault.connect(user).deposit(ethers.utils.parseEther("100"));
    expect(await vault.shares(user.address)).to.be.gt(0);
  });
});