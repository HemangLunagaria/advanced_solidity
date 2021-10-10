pragma solidity ^0.5.0;

import "./PupperCoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";

// @TODO: Inherit the crowdsale contracts
contract PupperCoinSale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {

    constructor(
        uint rate,
        address payable wallet,
        PupperCoin token,
        uint256 goal,
        uint256 openingTime, 
        uint256 closingTime,
        uint256 cap
    )
        Crowdsale(rate, wallet, token)
        RefundableCrowdsale(goal)
        TimedCrowdsale(openingTime, closingTime)
        CappedCrowdsale(cap)
        public
    {
        // constructor can stay empty
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;
    
    uint fakenow = now;

    constructor(
        string memory name,
        string memory symbol,
        address payable wallet,
        uint256 goal,
        uint256 cap
    )
        public
    {
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);

        // @TODO: create the PupperCoinSale and tell it about the token, set the goal, and set the open and close times to now and now + 24 weeks.
        PupperCoinSale pup_sale = new PupperCoinSale(1, wallet, token, goal, now, now + 5 minutes, cap);
        token_sale_address = address(pup_sale);

        // make the PupperCoinSale contract a minter, then have the PupperCoinSaleDeployer renounce its minter role
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}
