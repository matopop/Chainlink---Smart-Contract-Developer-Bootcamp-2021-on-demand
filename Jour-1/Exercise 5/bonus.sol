/*
Ici, on nous demande simplement de s'arranger pour que randomResult soit égal à un nombre entre 1 et 100 après l'aléa.

Dans la fonction fulfillRandomness, lorsque l'on a randomResult = randomness;
On va simplement faire randomResult = randomness % 100.

Cependant, si on s'arrête à là, on aura randomResult qui sera toujours égal à un nombre entre 0 et 99 après l'aléa.

Du coup, pour avoir entre 1 et 100, on ajoute 1 :

    randomResult = randomness % 100 + 1;

     -> Pareil que si on faisait randomResult = randomness.mod(100).add(1);
            
            Ici on ajoute 1 car on doit avoir un nombre entre 1 et 100.
            Or avec un simple % 100, on ne pourra avoir qu'entre 0 et 99.
            Car : 
            10000 % 100 = 0
            et
            10999 % 100 = 99
            De ce fait, on ajoute 1, comme ça :
            1000 % 100 + 1 = 1
            et
            10999 % 100 + 1 = 100


*/


// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/VRFConsumerBase.sol";
 
/**
 * THIS IS AN EXAMPLE CONTRACT WHICH USES HARDCODED VALUES FOR CLARITY.
 * PLEASE DO NOT USE THIS CODE IN PRODUCTION.
 */
contract RandomNumberConsumer is VRFConsumerBase {
    
    bytes32 internal keyHash;
    uint256 internal fee;
    
    uint256 public randomResult;
    
    /**
     * Constructor inherits VRFConsumerBase
     * 
     * Network: Kovan
     * Chainlink VRF Coordinator address: 0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9
     * LINK token address:                0xa36085F69e2889c224210F603D836748e7dC0088
     * Key Hash: 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4
     */
    constructor() 
        VRFConsumerBase(
            0xdD3782915140c8f3b190B5D67eAc6dc5760C46E9, // VRF Coordinator
            0xa36085F69e2889c224210F603D836748e7dC0088  // LINK Token
        ) public
    {
        keyHash = 0x6c3699283bda56ad74f6b855546325b68d482e983852a7a82979cc4807b641f4;
        fee = 0.1 * 10 ** 18; // 0.1 LINK (Varies by network)
    }
    
    /** 
     * Requests randomness 
     */
    function getRandomNumber() public returns (bytes32 requestId) {
        require(LINK.balanceOf(address(this)) >= fee, "Not enough LINK - fill contract with faucet");
        return requestRandomness(keyHash, fee);
    }
 
    /**
     * Callback function used by VRF Coordinator
     */
    function fulfillRandomness(bytes32 requestId, uint256 randomness) internal override {
        randomResult = randomness % 100 + 1;
    }
 
    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
}
