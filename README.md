SPDX License Identifier
solidity
Copy code
// SPDX-License-Identifier: MIT
This line specifies the software license for the code, which in this case is the MIT License.

Solidity Version
solidity
Copy code
pragma solidity ^0.8.13;
This line sets the Solidity compiler version to 0.8.13 or higher.

Contract Definition
solidity
Copy code
contract VotingSystem {
    address public owner;
    mapping(address => uint) public age;
    mapping(address => bool) public hasVoted;
This section defines a contract named VotingSystem with three state variables:

owner: An address type variable to store the owner's address (the deployer of the contract).
age: A mapping that associates an address with an unsigned integer (uint), representing the age of the voter.
hasVoted: A mapping that associates an address with a boolean, indicating whether the voter has voted or not.
Constructor
solidity
Copy code
    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }
The constructor function is executed only once when the contract is deployed. It sets the owner to the address that deployed the contract (msg.sender).

Set Age Function
solidity
Copy code
    function setAge(uint _age) public {
        age[msg.sender] = _age;
    }
This function allows any user to set their age. The age is stored in the age mapping with the user's address as the key.

Vote Function
solidity
Copy code
    function vote() public {
        require(age[msg.sender] >= 18, "You must be 18 or older to vote.");
        require(!hasVoted[msg.sender], "You have already voted.");

        hasVoted[msg.sender] = true;
    }
This function allows a user to vote if:

They are at least 18 years old (checked by the require statement).
They have not voted before (checked by the require statement).
If both conditions are met, the user's address is marked as having voted in the hasVoted mapping.

Check Voter Function
solidity
Copy code
    function checkVoter(address _voter) public view returns (string memory) {
        if (hasVoted[_voter]) {
            assert(hasVoted[_voter]); // Assert that the voter has voted
            return "The voter has voted.";
        } else {
            return "The voter has not voted.";
        }
    }
This function allows anyone to check if a given address has voted. It returns a string message indicating whether the voter has voted or not. The assert statement is somewhat redundant here since it checks a condition that is already known to be true based on the preceding if statement.

Custom Revert Function
solidity
Copy code
    function customRevert(uint _age) public pure {
        if (_age < 18) {
            revert("Voting is not allowed for individuals under 18.");
        }
    }
This function demonstrates a custom revert mechanism. It takes an age as input and reverts the transaction with a custom error message if the age is less than 18. Note that this function is marked as pure because it doesn't read or modify any state variables.

Overall, this contract provides basic functionality for a voting system, including age verification, voting, and checking if someone has voted.
