# Bank Smart Contract
Smart contract for people do deposite or to withdraw self-define token.

## Environment setup
For details, follow the steps on https://docs.alchemy.com/docs/hello-world-smart-contract .

First, initialize your project in your project folder.
```
npm init
```
Answer a few question for the package.json file.

Second, download hardhat and create a hardhat project.
```
npm install --save-dev hardhat
npx hardhat
```
```
888    888                      888 888               888
888    888                      888 888               888
888    888                      888 888               888
8888888888  8888b.  888d888 .d88888 88888b.   8888b.  888888
888    888     "88b 888P"  d88" 888 888 "88b     "88b 888
888    888 .d888888 888    888  888 888  888 .d888888 888
888    888 888  888 888    Y88b 888 888  888 888  888 Y88b.
888    888 "Y888888 888     "Y88888 888  888 "Y888888  "Y888

👷 Welcome to Hardhat v2.12.2 👷‍

? What do you want to do? … 
  Create a JavaScript project
  Create a TypeScript project
❯  Create an empty hardhat.config.js
  Quit
```

Add project folders.
```
mkdir contracts
mkdir scripts
```
Here you may add the two solidity files (`bank.sol`, `my_token.sol`) into the contracts file into your onw contracts file, and add `deploy.js` into the scripts file.
```
contracts
  └───bank.sol
  └───my_token.sol
scripts
  └───deploy.js
```

Next you'll have to create and configure the `.env` file.

First, install the dotenv package in your project directory:
```
npm install dotenv --save
```

Inside your `.env` should be like this.

```
API_URL = "YOUR_API_URL"
PRIVATE_KEY = "YOU_PRIVATE_KEY"
ETHERSCAN_API_KEY = "YOUR_ETHERSCAN_API_KEY"
```


Next install `ethers.js` and etherscan plugin.
```
npm install --save-dev @nomiclabs/hardhat-ethers "ethers@^5.0.0"
npm install --save-dev @nomiclabs/hardhat-etherscan
```

We're at the final few steps, here you'll have to update your `hardhat.config.js` to look like this.

```
require('dotenv').config();
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

const { API_URL, PRIVATE_KEY } = process.env;
const ETHERSCAN_API_KEY = process.env.ETHERSCAN_API_KEY;

module.exports = {
   solidity: "0.8.0",
   defaultNetwork: "goerli",
   networks: {
      hardhat: {},
      goerli: {
         url: API_URL,
         accounts: [`0x${PRIVATE_KEY}`]
      }
   },
   etherscan: {
      // Your API key for Etherscan
      // Obtain one at https://etherscan.io/
      apiKey: ETHERSCAN_API_KEY
    }
}
```

We're done with the environment.

## Contract deployment

First compile the contract:
```
pnx hardhat compile
```
Deploy it on the goerli testnet.
```
npx hardhat run scripts/deploy.js --network goerli 
```

If every thing went smoothly, it should say:
```
➜  Lab3 npx hardhat run scripts/deploy.js --network goerli
My_Token deployed to: 0x38F1Fa207318787676E99470193398D002889548
Bank deployed to: 0xB25C30cEF1d0D46B54d6c3DD29c83c3230F0414C
```

## Verification
To do verification with hardhat, do:
```
npx hardhat verify --network goerli "YourTokenDeployedAddress" --contract 'contracts/my_token.sol:my_token'
npx hardhat verify --network goerli "YourBankDeployedAddress" --contract "contracts/bank.sol:bank" "YourTokenDeployedAddress"
```

Now your smart contract should displayed correctly on the etherscan.
For details on this part, checkout https://docs.alchemy.com/docs/submitting-your-smart-contract-to-etherscan .

## Appoval

You'll have to first go to the `my_token` contract to approve the usage of the self-define "MTK" for `amount` of tokens for `bank` contract. Paste the address of the contract `bank` into `spender(address)`.

<img width="1436" alt="截圖 2023-03-22 下午3 00 57" src="https://user-images.githubusercontent.com/71428683/226826408-89f4fe69-55c0-4764-96a4-b051f797a9e8.png">

Now you'll be able to play with the tokens that are being approved.

<img width="1440" alt="截圖 2023-03-22 下午3 08 19" src="https://user-images.githubusercontent.com/71428683/226827427-11e7c77d-94a7-4404-bc4f-0e1a4278c134.png">









