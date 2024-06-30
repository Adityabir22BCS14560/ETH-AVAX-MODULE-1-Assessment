// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract VotingSystem {
    address public owner;
    mapping(address => uint) public age;
    mapping(address => bool) public hasVoted;

    constructor() {
        owner = msg.sender; // Set the contract deployer as the owner
    }

    // Function to set the age of a voter
    function setAge(uint _age) public {
        age[msg.sender] = _age;
    }

    // Function to vote
    function vote() public {
        require(age[msg.sender] >= 18, "You must be 18 or older to vote.");
        require(!hasVoted[msg.sender], "You have already voted.");

        hasVoted[msg.sender] = true;
    }

    // Function to check if someone has voted
    function checkVoter(address _voter) public view returns (string memory) {
        if (hasVoted[_voter]) {
            assert(hasVoted[_voter]); // Assert that the voter has voted
            return "The voter has voted.";
        } else {
            return "The voter has not voted.";
        }
    }

    // Custom revert function for underage voters
    function customRevert(uint _age) public pure {
        if (_age < 18) {
            revert("Voting is not allowed for individuals under 18.");
        }
    }
}
