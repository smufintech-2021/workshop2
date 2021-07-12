// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// public - all can access
// external - Cannot be accessed internally, only externally
// internal - only this contract and contracts deriving from it can access
// private - can be accessed only from this contract
contract grandpa
{
    function foo() virtual external view {}
    
    function hello() virtual public pure returns(string memory){
    return "hello from grandpa!";
    }

}



contract father is grandpa {
// For multiple inheritance, the most derived base contracts that define the same function must be specified explicitly after the override keyword. 
    function hello() override
    public pure returns(string memory){
        return "hello from daddy!";
    }


}
contract son is father
{
    function foo() override public pure {}
}




//impossible due to DAG 
// contract daughter is father , grandpa{
//      function hello() public override(father, grandpa) {}
// }



// multiple inheritance
contract boyfriend{
    function foo() virtual external view {}
}

contract girlfriend{
    function foo() virtual external view {}
}

contract thirdWheel is boyfriend, girlfriend{
    function foo() public view override(boyfriend, girlfriend) {}
}

