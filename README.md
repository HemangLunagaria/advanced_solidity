# Crowdsale - Advanced Solidity

This crowdsale contract will manage the entire process, allowing users to send ETH and get back PUP (PupperCoin). This contract will mint the tokens automatically and distribute them to buyers in one transaction.

## PupperCoin

Users can send ether to the contract and in turn receive Pupper coins (PUP). The rate is 1 Ether to 1 PUP. Please see PupperCoin.sol and Crowdsale.sol on how the contract is setup.

### Kovan Deployment:

1. Crowdsale Deployer contract address: 0x13d42a66952B13015C8bd3f47b24708DB646657C
2. Crowdsale contract address: 0x547Cb7c4e84170FbF54B02AeFe8cd42dba0336CE
3. PUP Coin contract address: 0xe37780427dD4e1a98B7C8f2D2f05d9aD915e3c80

![Kovan Deployment](images/Kovan_Deployment.gif)

### Contract Deployment - Locally using Ganache and Remix

Connect Metamask to local blockchain network and using Remix deploy the PupperCoinSaleDeployer contract. This contract deploys the rest of the contract.

![Contract deployment](images/Contract_Deployment.gif)

### Adding deployed contracts

PupperCoinSaleDeployer deploys PupperCoinSale and PupperCoin contracts. We can add them to Remix IDE to interact with.

![Adding contracts](images/Adding_contracts.gif)

### Sending ETHER to contract

Using the Crowdsale contract, ETHER can be sent to receive PUP coins. 1 ETHER = 1 PUP

![Adding contracts](images/Sending_ether.gif)

### Cap exceeded error

Once the goal which was also set as the cap has been receahed, sending any more ether results in the error.

![Cap exceeded](images/Cap_exceeded.gif)

### Finalising the contract

Contract can be finalised only when the closing time has been reached.

![Finalised contract](images/Finalised_contract.gif)

### Crowdsale closed error

Once the contract closes, no ether can be sent to the contract.

![Closed contract](images/Crowdsale_closed_error.gif)

### Withdrawing PUP

Tokens can only be withdrawn once the contract closes.

![PUP Withdrawal 1](images/PUP_withdrawal.gif)

![PUP Withdrawal 2](images/Withdrawing_PUP_2.gif)