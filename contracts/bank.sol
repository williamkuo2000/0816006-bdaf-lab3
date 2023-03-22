// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract bank{
    address token;

    constructor(address _tokenAddress) {
        token = _tokenAddress;
    }

    mapping(address => mapping(address => uint256)) public user_bal;

    function deposit(address token, uint256 amount) external {
        IERC20(token).transferFrom(msg.sender, address(this), amount);
        user_bal[msg.sender][token] += amount;
    }

    function withdraw(address token, uint256 amount) external {
        require(user_bal[msg.sender][token] >= amount, 'Insufficent balance');
        IERC20(token).transfer(msg.sender, amount);
        user_bal[msg.sender][token] -= amount;
    }
}