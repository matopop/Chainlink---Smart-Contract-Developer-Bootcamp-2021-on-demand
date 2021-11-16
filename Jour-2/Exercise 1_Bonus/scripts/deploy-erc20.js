async function main() {
 
    const [deployer] = await ethers.getSigners();
 
    console.log(
      "Deploying contracts with the account:",
      deployer.address
    );
 
    console.log("Account balance:", (await deployer.getBalance()).toString());
 
    const erc20BASIC = await ethers.getContractFactory("ERC20Basic");
    const deployedContract = await erc20BASIC.deploy(100000); //On déploie avec 100k Doge Elon Coin
    console.log("Deployed ERC20 contract address:", deployedContract.address);
 
    console.log('Total supply: ', (await deployedContract.totalSupply()).toString());

    await deployedContract.transfer(deployer.address, 70000) //On se transfère 70k tokens soit 70% du total supply, tel un bon shitcoin

    
  }
 
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });
