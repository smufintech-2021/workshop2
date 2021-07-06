//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";


contract ReferenceTypes {
  
  // Data Location
    
    // The data location of x is storage.
    // This is the only place where the
    // data location can be omitted.
    uint[] x;

    // The data location of memoryArray is memory.
    function f(uint[] memory memoryArray) public {
        x = memoryArray; // works, copies the whole array to storage
        uint[] storage y = x; // works, assigns a pointer, data location of y is storage
        y[7]; // fine, returns the 8th element
        y.pop(); // fine, modifies x through y
        delete x; // fine, clears the array, also modifies y
        // The following does not work; it would need to create a new temporary /
        // unnamed array in storage, but storage is "statically" allocated:
        // y = memoryArray;
        // This does not work either, since it would "reset" the pointer, but there
        // is no sensible location it could point to.
        // delete y;
        g(x); // calls g, handing over a reference to x
        h(x); // calls h and creates an independent, temporary copy in memory
    }

    function g(uint[] storage) internal pure {}
    function h(uint[] memory) public pure {}



  // Arrays
  // Arrays can have a compile-time fixed size, or they can have a dynamic size.

  uint256[] numbersArray;

  //    Array Members
  function exploreArrays() public {

    // length
    uint256 lengthOfArray  = numbersArray.length;

    // .push()
    // Appends a zero-initialised element at the end of the array
    // It returns a reference to the element, so that it can be used like x.push().t = 2 or x.push() = b.
    numbersArray.push() = 2;

    // .push(x)
    numbersArray.push(3);

    // .pop
    numbersArray.pop;
  }

  //    Bytes and Strings
  // Variables of type bytes and string are special arrays. 
  // A bytes is similar to byte[], but it is packed tightly in calldata and memory. string is equal to bytes but does not allow length or index access.
  // Dynamic arrays are expensive!

  bytes helloWorldInBytes = "Hello, world!"; // ok, but you usually don't store a string in `bytes`
  string helloWorldInString = "Hello, world!";

  bytes32 hashedString = keccak256("Hello, world!");
  bytes32 hashedStringAbiEncodePacked = keccak256(abi.encodePacked("Hello, world!"));

  // GOOD FYI (if you'd like to know more):
    // You should use bytes over byte[] because it is cheaper, since byte[] adds 31 padding bytes between the elements. 
    // As a general rule, use bytes for arbitrary-length raw byte data and string for arbitrary-length string (UTF-8) data. 
    // If you can limit the length to a certain number of bytes, always use one of the value types bytes1 to bytes32 because they are much cheaper.
}