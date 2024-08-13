// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PaymentTracker {
  
    mapping (uint256 => Payment) public payments;


    struct Payment {
        address payer;
        address payee;
        uint256 amount;
        uint256 timestamp;
    }


    event PaymentMade(uint256 paymentId, address payer, address payee, uint256 amount);

    function makePayment(address _payee, uint256 _amount) public {
        uint256 paymentId = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, _payee)));

 
        Payment memory payment = Payment(msg.sender, _payee, _amount, block.timestamp);

        payments[paymentId] = payment;

        emit PaymentMade(paymentId, msg.sender, _payee, _amount);
    }

    function getPayment(uint256 _paymentId) public view returns (Payment memory) {
        return payments[_paymentId];
    }
}