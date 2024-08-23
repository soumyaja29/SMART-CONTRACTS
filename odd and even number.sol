// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EvenOdd {
    function isEven(uint _number) public pure returns (bool) {
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    function isOdd(uint _number) public pure returns (bool) {
        if (_number % 2 != 0) {
            return true;
        } else {
            return false;
        }
    }
}