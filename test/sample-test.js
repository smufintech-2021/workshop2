const { expect } = require("chai");

describe("ValueTypes", function() {
  it("Should deploy the contract", async function() {
    console.log("Contract is starting to deploy...");

    const ValueTypes = await ethers.getContractFactory("ValueTypes");
    const valueTypes = await ValueTypes.deploy();
    await valueTypes.deployed();

    // Execute the integer function call
    await valueTypes.integers();

    console.log("Contract deployed!");
  });
});
