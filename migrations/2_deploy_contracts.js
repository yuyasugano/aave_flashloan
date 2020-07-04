var Flashloan = artifacts.require("./Flashloan.sol");

module.exports = function(deployer) {
  deployer.deploy(Flashloan, {gas: 2000000});
}

