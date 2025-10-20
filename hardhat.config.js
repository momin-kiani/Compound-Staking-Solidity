require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config({ quiet: true });

module.exports = {
    solidity: {
        compilers: [
            {
                version: "0.8.30",
                settings: {
                    optimizer: {
                        enabled: true,
                        runs: 1000000
                    },
                    evmVersion: "cancun"
                }
            }
        ]
    },
    defaultNetwork: "production",
    networks: {
        production: {
            url: process.env.URL_PRODUCTION || "https://place.holder",
            accounts: [
                process.env.PRIVATE_KEY_PRODUCTION ||
                    "0x0000000000000000000000000000000000000000000000000000000000000000"
            ]
        }
    },
    etherscan: {
        apiKey: process.env.BLOCK_EXPLORER_API_KEY_MAINNET
    }
};
