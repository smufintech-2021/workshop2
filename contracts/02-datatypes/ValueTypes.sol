// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../helper/Helpers.sol";
import "hardhat/console.sol";

contract ValueTypes is Helpers {

    // Booleans
    bool initialized = false;
    bool notInitialized = true;

    // Operators
    bool negation = !initialized;
    bool conjunction = initialized && notInitialized;
    bool disjunction = initialized || notInitialized;
    bool equality = initialized == notInitialized;
    bool inequality = initialized != notInitialized;



    // Integers (int / uint)
    // Signed and unsigned integers of various sizes. 
    // Keywords uint8 to uint256 in steps of 8 (unsigned of 8 up to 256 bits) and int8 to int256. 
    // int and uint are aliases for uint256 and int256, respectively.

    // bit, byte, word - What's the difference?

    /// @notice Most integers in Solidity are represented by `uint`

    function integers() public view {
        int8 minOfInt8 = type(int8).min;
        uint8 minOfUint8 = type(uint8).min;
        int256 minOfInt256 = type(int256).min;
        uint256 minOfUint256 = type(uint256).min;

        int8 maxOfInt8 = type(int8).max;
        uint8 maxOfUint8 = type(uint8).max;
        int256 maxOfInt256 = type(int256).max;
        uint256 maxOfUint256 = type(uint256).max;

        // console.log("Min. of int8:", minOfInt8);
        console.log("Min. of uint8:", uintToString(minOfUint8)); // 0
        // console.log("Min. of int8:", minOfInt256);
        console.log("Min. of uint256:", uintToString(minOfUint256)); // 0

        // console.log("Max. of int8:", maxOfInt8);
        console.log("Max. of uint8:", uintToString(maxOfUint8));
        // console.log("Max. of int8:", maxOfInt256);
        console.log("Max. of uint256:", uintToString(maxOfUint256));

        // Integer overflow
        uint256 overflow = maxOfUint256 + maxOfUint8;
        // console.log("Integer overflow", uintToString(overflow)); // uncomment

        // Integer underflow
        uint256 underflow = maxOfUint8 - maxOfUint256;
        // console.log("Integer underflow", uintToString(underflow)); // uncomment
    }



    // Address
    // Can be either an Externally Owned Account (EOA), or a contract account.
    // Each address has a 20-byte length.

    // The "burner" address, or DEFAULT_ADDRESS: https://etherscan.io/address/0x0000000000000000000000000000000000000000
    // Nobody has the private keys to this address; nobody owns it.
    address DEFAULT_ADDRESS = 0x0000000000000000000000000000000000000000;

    // DAI mainnet contract address: https://etherscan.io/address/0x6b175474e89094c44da98b954eedeac495271d0f
    address DAI_MAINNET_ADDRESS = 0x6B175474E89094C44Da98b954EedeAC495271d0F;

    // A random EOA: https://etherscan.io/address/0x7bafdc9fe2f44dad7eabeae34b367e50278208c1
    // address RANDOM_EOA = 0x7bafdc9fe2f44dad7eabeae34b367e50278208c1; // checksummed error! // uncomment



    // Fixed-size byte arrays
    // bytes1, bytes2, bytes3, ..., bytes32
    // Not usually a storage of numbers!

    // Useful tools:
    // - String to bytes converter: https://web3-type-converter.onbrn.com/
    // - Hexadecimal to decimal converter: https://www.rapidtables.com/convert/number/hex-to-decimal.html
    // - Character count tool: https://www.charactercountonline.com/

    // bytes1 aBytes1 = "Hello, world!"; // will be cut off // uncomment
    bytes1 anotherBytes1 = 0xb5; // µ

    bytes32 aBytes32 = "Hello, world!"; // will not be cut off
    bytes32 anotherBytes32 = 0x7465737400000000000000000000000000000000000000000000000000000000; // "test"

    // Why does bytes32 exist? Especially if there's a string data type already? (Answer this question after the next part!)



    // Dynamically-sized byte array
    // bytes and strings (we'll take a look at this in the ReferenceTypes.sol)



    // Enums
    // To create a user-defined type

    enum ActionChoices { GoLeft, GoRight, GoStraight, SitStill }
    ActionChoices choice;
    ActionChoices constant defaultChoice = ActionChoices.GoStraight;

    function setGoStraight() public {
        choice = ActionChoices.GoStraight;
    }

    // Since enum types are not part of the ABI, the signature of "getChoice"
    // will automatically be changed to "getChoice() returns (uint8)"
    // for all matters external to Solidity.
    function getChoice() public view returns (ActionChoices) {
        return choice;
    }

    function getDefaultChoice() public pure returns (uint) {
        return uint(defaultChoice);
    }


    // Structs
    // Structs are a way to define new custom types in Solidity.

    // Declaring a structure
    struct Book { 
        string name;
        string writter;
        uint id;
        bool available;
    }
    
    // Declaring a structure object
    Book book1;
    
    // Assigning values to the fields 
    // for the structure object book2
    Book book2 
        = Book("Building Ethereum DApps", 
                "Roberto Infante ", 
                2, false);



    // Function Types

    // External: These functions are part of the contract interface and can be called from other contracts and via transactions. An external function cannot be called internally. 
    // Public: These can be called internally or via messages. 
    // Internal: These functions and variables can only be accessed internally. (from the current or the derived contract) 
    // Private: These functions and state variables are only visible for the contract they are defined in and not the derived contracts.

    // Source: https://www.edureka.co/community/871/difference-between-internal-external-private-public-function

    // function (<parameter types>) {external|public|internal|private} [pure|view|payable] [returns (<return types>)] // uncomment

}