## 1. [Suivre ce tutoriel](https://chain.link/bootcamp/hardhat-setup-instructions)
## 2. [Suivre la consigne de l'exercice](https://docs.google.com/document/d/12_t49Ue6FPk09Dm8dpS41F1-ZHOJc-OJ5ejJ5-o4f90/edit#heading=h.fjoly20abwr)
Attention : Si arrivé à la fin de l'exercice classique vous obtenez : "Stored value in contract is:  0"
Modifiez ceci :
```
let result = BigInt(await deployedContract.getNumber()).toString()
```
En ceci :
```
let result = (await deployedContract.getNumber()).toString()
```
Et cela fonctionnera.
