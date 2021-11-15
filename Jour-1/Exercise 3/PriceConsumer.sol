/*

Ce contrat nous est donné, on a simplement à le copier et le déployer sur Kovan (pas sur la VM Javascript, car chainlink n'est pas sur notre vm)
En l'occurence, il va nous permettre de récupérer le prix de l'ETH/USD
Pour avoir le prix d'une autre paire, il suffit de modifier l'adresse indiquée dans priceFeed, en prenant une adresse ici différente
dans le pricefeed proposé par ChainLink ici : https://docs.chain.link/docs/ethereum-addresses/
Cependant ici, vu qu'on est sur Kovan, il faut chercher les pricefeed Kovan, donc on fait un CTRL+F avec marqué Kovan.

Le prix qui nous sera donné par la fonction getLatestPrice sera le prix multiplié par 10^8 dans le cas de ETH/USD
Il convient ensuite de le diviser par 10^8 si on veut le prix.

Exemple pour l'eth au 15 novembre à 17:22 : 463631306105
463631306105 / 10^8 = $ 4636.31306105

Maintenant, si on veut le BTC/USD, il suffit de changer l'adresse fournie dans priceFeed
En l'occurence, la documentation chainlink nous donne cette adresse:
0x6135b13325bfC4B00278B4abC5e20bbce2D6580e

Et nous explique qu'il y a 8 décimales, donc en soit il faudra diviser par 10^8 le prix si on veut l'avoir en valeurs "normales".
Ca nous donne : 6429826916371
Donc 6429826916371 / 10^8 = $ 64298.26916371


Enfin, on peut le faire avec le pricefeed LINK/USD : 0x396c5E36DD0a0F5a5D33dae44368D4193f69a1F0
Ca nous donne 3322373767
On sait que c'est 8 decimals
Donc 3322373767 / 10^8 = $ 33.22373767
*/






pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
 
contract PriceConsumerV3 {
 
    AggregatorV3Interface internal priceFeed;
 
    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     */
    constructor() public {
        priceFeed = AggregatorV3Interface(0x396c5E36DD0a0F5a5D33dae44368D4193f69a1F0);
    }
 
    /**
     * Returns the latest price
     */
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }
}
