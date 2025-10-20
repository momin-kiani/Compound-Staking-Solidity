// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract StakeToken is ERC20{
    constructor(uint256 initialSupply) ERC20("StakeToken", "STK") {
<<<<<<< HEAD
        _mint(msg.sender, initialSupply);
    }
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
=======
        _mint(msg.sender, initialSupply*10**18);
    }
    
>>>>>>> 7168e11636fe507685469454e4dbded4e940d92f
}