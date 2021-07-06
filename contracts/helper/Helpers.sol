//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Helpers {

    /**
     * From https://www.edureka.co/community/7924/how-to-convert-int-to-string-in-solidity
     */
    function uintToString(uint v) public pure returns (string memory str) {
        uint maxlength = 100;
        bytes memory reversed = new bytes(maxlength);
        uint i = 0;
        while (v != 0) {
            uint remainder = v % 10;
            v = v / 10;
            reversed[i++] = bytes1(uint8(48 + remainder));
        }
        bytes memory s = new bytes(i + 1);
        for (uint j = 0; j <= i; j++) {
            s[j] = reversed[i - j];
        }
        str = string(s);
    }
}