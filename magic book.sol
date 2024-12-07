// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolidayGreetings {
    string public holidayMessage;

    // Constructor to set an initial holiday message
    constructor() {
        holidayMessage = "Happy Holidays!";
    }

    // Function to get the current holiday message
    function getHolidayMessage() public view returns (string memory) {
        return holidayMessage;
    }
}
