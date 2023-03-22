// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract my_token is ERC20{
    constructor() ERC20("test", "MTK") {
        _mint(msg.sender, 1000);
    }
}