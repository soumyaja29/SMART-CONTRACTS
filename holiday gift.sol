// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolidayWishes {
    string[] public wishes; // A list to store wishes

    // Function to add a new wish
    function addWish(string memory _wish) public {
        wishes.push(_wish);
    }

    // Function to get all wishes
    function getWishes() public view returns (string[] memory) {
        return wishes;
    }
}
