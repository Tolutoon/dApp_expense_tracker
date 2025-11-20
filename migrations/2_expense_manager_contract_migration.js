const ExpenseManager = artifacts.require("ExpenseManagerContract");


module.exports = function(deployer) {
    deployer.deploy(ExpenseManager);
};

