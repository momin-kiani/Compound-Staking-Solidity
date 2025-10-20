// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StakeToken is ERC20{
    constructor(uint256 initialSupply) ERC20("StakeToken", "STK") {
        _mint(msg.sender, initialSupply);
    }
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}