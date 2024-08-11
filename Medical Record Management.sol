// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EHR {
    struct MedicalRecord {
        string patientID;
        string doctorID;
        string recordData;
    }

    mapping (address => MedicalRecord[]) public patientRecords;

    function addRecord(string memory _patientID, string memory _doctorID, string memory _recordData) public {
        MedicalRecord memory newRecord = MedicalRecord(_patientID, _doctorID, _recordData);
        patientRecords[msg.sender].push(newRecord);
    }

    function getRecords(address _patientAddress) public view returns (MedicalRecord[] memory) {
        return patientRecords[_patientAddress];
    }
}