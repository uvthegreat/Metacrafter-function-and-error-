// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SchoolGradingSystem {
    address public owner;

    struct Student {
        string name;
        uint grade;
    }

    mapping(address => Student) private students;
    mapping(address => bool) private studentExists;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this action");
        _;
    }

    modifier studentNotExists() {
        require(!studentExists[msg.sender], "Student already exists");
        _;
    }

    modifier studentExistsOnly() {
        require(studentExists[msg.sender], "Student does not exist");
        _;
    }

    function addStudent(string calldata name) external studentNotExists {
        students[msg.sender] = Student(name, 0);
        studentExists[msg.sender] = true;

        // Assert that the student has been added
        assert(studentExists[msg.sender] == true);
    }

    function setGrade(address studentAddress, uint grade) external onlyOwner {
        // Ensure grade is between 0 and 100
        require(grade <= 100, "Grade must be between 0 and 100");

        if (!studentExists[studentAddress]) {
            revert("Student does not exist");
        }

        students[studentAddress].grade = grade;
    }

    function getGrade() external view studentExistsOnly returns (string memory name, uint grade) {
        Student storage student = students[msg.sender];
        return (student.name, student.grade);
    }

    function removeStudent() external studentExistsOnly {
        delete students[msg.sender];
        studentExists[msg.sender] = false;

        // Assert that the student has been removed
        assert(studentExists[msg.sender] == false);
    }
}
