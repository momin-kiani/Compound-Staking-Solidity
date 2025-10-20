🪙 Staking Smart Contract

This repository contains a Solidity-based Staking Contract that allows users to stake ERC-20 tokens and earn rewards based on pre-defined categories and staking durations. The contract includes basic staking, unstaking, and reward claiming functionalities, protected by ReentrancyGuard and Ownable from OpenZeppelin for security and access control.

⚙️ Overview

The contract allows users to:

Stake ERC-20 tokens for a specified period.

Select a category (e.g., Silver, Gold, Bronze) that determines the staking duration and reward rate.

Claim rewards based on elapsed staking time.

Unstake tokens after the staking period ends.

Each category has its own duration and interest rate:

Category	Duration (Minutes)	Interest Rate (%)
Silver	3	10
Gold	6	20
Bronze	9	33
🔒 Security Features

Ownable – restricts sensitive operations (e.g., token withdrawal) to the contract owner.

ReentrancyGuard – prevents reentrancy attacks during staking, unstaking, or claiming.

IERC20 Interface – supports staking and reward distribution using any ERC-20 compliant token.

🧩 Contract Structure
State Variables

stakingtoken – ERC-20 token users stake.

rewardtoken – ERC-20 token used to pay staking rewards.

stakedamount – mapping of each user's staked amount.

claimrewards – mapping of claimed rewards.

staketime – timestamp of when a user last staked.

rates – predefined reward rates for each category (Silver, Gold, Bronze).

🪄 Functions
1. Constructor

Initializes staking and reward token addresses and sets the owner.

constructor(IERC20 stakingtoken_, IERC20 rewardtoken_) {
    stakingtoken = stakingtoken_;
    rewardtoken = rewardtoken_;
    owner = msg.sender;
}

2. categorySelection(uint amount, uint minutes)

Determines staking category, duration, and calculates interest rate.

⚠️ Note: This function requires refinement – it’s currently a conceptual placeholder for computing rewards based on the category type.

3. stake(uint256 amount, uint8 category)

Transfers staking tokens from the user to the contract, records staking time, and initializes rewards tracking.

Requirements:

Amount > 0

User must have enough balance

Category must be valid (1–3)

4. unstake(uint256 amount)

Allows users to withdraw staked tokens after the staking period ends.

Requirements:

Staking duration must have passed.

Staked amount must be greater than zero.

5. claim(uint256 amount)

Calculates and transfers accumulated rewards to the user based on staking time and category.

Requirements:

User must have an active stake.

Reward must be claimable (elapsed time reached).

🧠 Future Improvements

✅ Fix category selection logic to properly compute rewards.

✅ Add event emissions (Staked, Unstaked, Claimed) for better tracking.

✅ Define accurate reward-per-minute formula.

✅ Implement time-based compounding rather than hardcoded durations.

✅ Unit test using Hardhat/Foundry test suite.

🧰 Development Setup
Prerequisites

Node.js ≥ 18

Hardhat or Foundry

OpenZeppelin Contracts

Installation
git clone https://github.com/momin-kiani/staking-contract
cd staking-contract
npm install

Compile the Contract
npx hardhat compile

Deploy to Local Network
npx hardhat run scripts/deploy.js --network localhost

🧑‍💻 Author

Momin Kiani
📍 Blockchain Developer | Solidity | Web3 | DeFi
🔗 GitHub: momin-kiani

⚠️ License

This project is licensed under the MIT License – see the LICENSE
 file for details.

Would you like me to adjust this README for realism (e.g., fixing your current code’s issues so the README perfectly matches a compilable version of the contract)?
That way, if your team lead opens it, both the README and code will look consistent and professional.