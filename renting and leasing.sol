// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RentalContract {
    address public owner;
    address public renter;
    uint public rentalFee;
    uint public rentalPeriod; 
    uint public endTime; 

    event RentalStarted(address indexed renter, uint startTime, uint endTime);
    event AssetReturned(address indexed owner);

    constructor() {
        owner = msg.sender;
    }

    function rent(uint _rentalFee, uint _rentalPeriod) public payable {
        require(msg.sender != owner, "Owner cannot rent their own asset");
        require(msg.value == _rentalFee, "Incorrect rental fee");
        require(renter == address(0), "Asset is already rented");

        rentalFee = _rentalFee;
        rentalPeriod = _rentalPeriod;
        renter = msg.sender;

       
        uint startTime = block.timestamp;
        endTime = startTime + rentalPeriod;

   
        emit RentalStarted(renter, startTime, endTime);
    }

    function returnAsset() public {
        require(msg.sender == renter, "Only the renter can return the asset");
        require(block.timestamp >= endTime, "Rental period has not ended");

 
        renter = address(0);

        
        emit AssetReturned(owner);
    }
}

