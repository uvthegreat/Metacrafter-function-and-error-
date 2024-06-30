# School Grading System

A smart contract-based system for managing student grades securely and efficiently using blockchain technology.

## Description

The School Grading System is a decentralized application (dApp) built on the Ethereum blockchain. It allows the owner to manage student records and grades securely. Students can add themselves to the system and view their grades, while only the owner can assign grades to the students. This ensures transparency and security in the grading system.

## Getting Started

### Installing

1. Clone the repository from GitHub:
    ```sh
    git clone https://github.com/yourusername/school-grading-system.git
    ```

2. Navigate to the project directory:
    ```sh
    cd school-grading-system
    ```

3. Install the required dependencies:
    ```sh
    npm install
    ```



### Executing program

1. Interact with the smart contract using a frontend interface or through Truffle console:

    * Adding a student:
    ```javascript
    const schoolGradingSystem = await SchoolGradingSystem.deployed();
    await schoolGradingSystem.addStudent("John Doe", { from: studentAddress });
    ```

    * Setting a grade (only owner can execute this):
    ```javascript
    await schoolGradingSystem.setGrade(studentAddress, 85, { from: ownerAddress });
    ```

    * Getting a student's grade:
    ```javascript
    const grade = await schoolGradingSystem.getGrade({ from: studentAddress });
    console.log(grade);
    ```

    * Removing a student:
    ```javascript
    await schoolGradingSystem.removeStudent({ from: studentAddress });
    ```
## Purpose
Different error handling techniques in Solidity:

* require(): This require statement is typically used to validate input conditions or contract preconditions. It throws an error and reverts the transaction if the condition is not met.
* assert(): The assert statement is used to check for internal errors in the contract. It should only be used for conditions that should never be false. If the condition is false, it indicates a bug in the contract.
* revert(): The revert statement is used to explicitly revert the transaction, usually due to a requirement violation or an exceptional condition.

## Help

For common problems or issues:

* Ensure you have the correct version of Solidity installed.
* Make sure your local Ethereum blockchain is running.
* Verify that you have sufficient funds in your Ethereum accounts for gas fees.

For more detailed help, refer to the official [Solidity documentation](https://docs.soliditylang.org/)

## Authors

Utkarsh Vishwakarma


