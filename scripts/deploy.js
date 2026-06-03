const hre = require("hardhat");

async function main() {
  const YieldVault = await hre.ethers.getContractFactory("YieldVault");
  const vault = await YieldVault.deploy();
  await vault.deployed();
  console.log("YieldVault deployed to:", vault.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});