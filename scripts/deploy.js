const hre = require("hardhat");

async function main() {

  const my_token = await ethers.getContractFactory("my_token");
  const My_Token = await my_token.deploy();
  const TokenAddress = My_Token.address;
  const bank = await ethers.getContractFactory("bank");
  const Bank = await bank.deploy(TokenAddress);
  const BankAdress = Bank.address;

  await My_Token.deployed();
  await Bank.deployed();

  console.log("My_Token deployed to:", TokenAddress);
  console.log("Bank deployed to:", BankAdress);
}

main()
  .then(() => process.exit())
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });