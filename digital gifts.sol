// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HolidaySwap {
    struct Event {
        string name;
        address[] participants;
        mapping(address => string) gifts;
        bool isCompleted;
    }

    mapping(uint => Event) public events;
    uint public eventCount;

    // Create a new gift exchange event
    function createEvent(string memory _name) public {
        eventCount++;
        Event storage newEvent = events[eventCount];
        newEvent.name = _name;
        newEvent.isCompleted = false;
    }

    // Join an event
    function joinEvent(uint _eventId) public payable {
        require(msg.value == 0.01 ether, "Participation fee is 0.01 Ether");
        Event storage evt = events[_eventId];
        require(!evt.isCompleted, "Event is already completed");

        evt.participants.push(msg.sender);
    }

    // Submit a gift for the event
    function submitGift(uint _eventId, string memory _gift) public {
        Event storage evt = events[_eventId];
        require(!evt.isCompleted, "Event is already completed");

        // Ensure that the user has joined the event
        bool isParticipant = false;
        for (uint i = 0; i < evt.participants.length; i++) {
            if (evt.participants[i] == msg.sender) {
                isParticipant = true;
                break;
            }
        }
        require(isParticipant, "You must join the event to submit a gift");

        evt.gifts[msg.sender] = _gift;
    }

    // Complete the event and distribute gifts
    function completeEvent(uint _eventId) public {
        Event storage evt = events[_eventId];
        require(!evt.isCompleted, "Event is already completed");

        evt.isCompleted = true;
        // Randomly match participants and handle gift exchange (not fully implemented for simplicity)
    }

    // Get event details
    function getEvent(uint _eventId) public view returns (string memory, address[] memory) {
        Event storage evt = events[_eventId];
        return (evt.name, evt.participants);
    }
}