const Fogchain = artifacts.require("Fogchain");

module.exports = function (deployer) {
  deployer.deploy(Fogchain);
};
