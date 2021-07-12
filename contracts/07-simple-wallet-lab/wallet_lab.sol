// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract wallet {
    uint public balanceReceived;
    address payableTo;

    function receiveMoney() public payable {
        balanceReceived +=msg.value; 


    }
function getBalance() public view returns(uint){
    return address(this).balance;
}

function withdrawMoney() public {
    address payable to = payable(msg.sender);
    to.transfer(getBalance());
}

function withdrawMoneyTo(address _payableTo) public {
    payable(_payableTo).transfer(getBalance()); 
    
}

// fall back function required by any smart conrtract for Transactions that has no data. 
receive() external payable {
}



}