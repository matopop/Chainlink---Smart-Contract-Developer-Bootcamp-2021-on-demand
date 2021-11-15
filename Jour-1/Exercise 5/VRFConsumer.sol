/*
Ici, on va utiliser la VRF Chainlink -> Verified Random Function
C'est-à-dire que l'on va demander à un node Chainlink de nous générer un nombre aléatoire publiquement vérifiable.

Cela permet d'éviter la problématique des nombres générés sur la blockchain ou des nombres générés par des entités centralisées :
- Le fait que ce soit prévisible (blockchain)
- Le fait que ce soit manipulable (entité centralisée)

Ici, c'est décentralisé et vérifiable.

Du coup, ici on va déployer le contrat qu'on nous a fournis, puis :
1. On fund l'adresse de notre contrat avec 1 LINK
2. On lance la fonction getRandomNumber
3. On lance randomResult


En l'occurence, ici :
112963818982367624670559372323754249250722278834006826859165992127223438328694

Si on le refait:
60713282739403994839461328866488629107288463256812052873500409815547807783274
Et ainsi de suite...
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
        randomResult = randomness;
    }
 
    // function withdrawLink() external {} - Implement a withdraw function to avoid locking your LINK in the contract
}
