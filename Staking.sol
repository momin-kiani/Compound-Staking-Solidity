make a readme file for this contract .

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

// mapping(uint=>address) staketime;
contract Staking Ownable,ReentrancyGuard{

    mapping(address=>uint) userCategory;
    mapping (address=>uint) stakedamount;
    mapping (address=>uint) claimrewards;
    mapping (address=>uint) staketime;

    uint public amount;
    IERC20 public stakingtoken;
    IERC20 public rewardtoken;
    address public owner;

    uint8 public userCategory;
    uint256[3] public rates = [10, 20, 33];

    constructor(IERC20 stakingtoken_,IERC20 rewardtoken_) {
        stakingtoken = stakingtoken_;
        rewardtoken = awardtoken_;
        owner = msg.sender;
    }
   
    function categorySelection(uint amount,uint minutes) public pure returns (uint amount,uint interstRate)
    {
        if(categorySelection == 1)
        {
         string memory silver;
         uint minutes = 3;
         uint interstRate = 10;
         balance = amount;

        balance = balance * (balance * interstRate)^minutes;

        return balance;
        return interstRate = balance - amount;

        }
       if else(categorySelection == 2)
       {
        string memory gold;
        uint minutes = 6;
        uint interstRate = 20;
        balance = amount;

        balance = balance * (balance * interstRate)^minutes;

        return balance;
        return interstRate = balance - amount;
       }

       if else(categorySelection == 3)
       {
        string memory bronze;
        uint minutes = 9;
        uint interstRate = 33;
        balance = amount;

        balance = balance * interstRate * minutes;
       }
       else {
        revert("Invalid Category : Choose 1 ,2 or 3")
       }
    }
    function stake(uint256 amount, uint8 category) external nonReentrant {
        require(amount > 0, "Amount must be greater than zero");
        require(stakingToken.balanceOf(msg.sender) >= amount, "Not enough tokens to stake");

        stakingToken.transferFrom(msg.sender, address(this), amount);

        stakedamount[msg.sender]=amount;
        staketime[msg.sender]=block.timestamp;
        claimrewards[msg.sender]=0; //because thats the time at which the user staked the amount so in the begining there will be no rewards at the time of staking

        // userCategory = category;
        
    }

    function unstake(uint 256) external nonReentrant{
        uint256 principal = stakedamount[msg.sender];
        require(amount > 0, "Amount must be greater than zero");
        require(block.timestamp>=staketime[msg.sender]+stakingduration);
        
        require(stakingToken.balanceOf(msg.sender) >= amount, "Not enough tokens to stake");
        
    }


    //the principal amount can only be transferred when the timelock has ended
    //The interest amount can be withdrawn at any moment in time however once the time lock has ended the withdrawal should be both the principal and final interest amount combined (HINT: make use of a private function for interest handling)
    //Interest should be given at a monthly (minutely) basis
    
    function claim(uint amount) external nonReentrant returns (uint amount){
        require(stakedamount[msg.sender]>0,"No amount is having to be staked on");

        uint timepassed = block.timestamp-staketime(msg.sender);
        uint totalminutes = block.timestamp/60;

        //we will only be only giving the maximum awards to those who have completed their staking time
        if(totalminutes > (stalkingtime/60)){
            totalminutes = stalkingtime/60;
        }
        else{
            revert("You have not completed your estimated time yet.")
        }

        uint totalEligibleReward = totalminutes * rewardperminute;
        uint pendingaward = totalEligibleReward - claimrewards[msg.sender];

        require(pendingaward>0,"You have to awards left to claim")

        claimrewards[msg.sender] += pendingaward;
        rewardToken.transferFrom(owner(),[msg.sender],pendingaward);

        rewardToken.approve(mywalletfromdeployed, type(uint256).max);
        rewardtoken.transfer(owner(me),user,rewardamount)
    }
}