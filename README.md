1. contract VotingSystem defines a contract named VotingSystem with three state variables:

owner: An address type variable to store the owner's address (the deployer of the contract).
age: A mapping that associates an address with an unsigned integer (uint), representing the age of the voter.
hasVoted: A mapping that associates an address with a boolean, indicating whether the voter has voted or not.asdasd

2. function setAge(uint _age) allows any user to set their age. The age is stored in the age mapping with the user's address as the key.

3. function vote() allows a user to vote if:

# They are at least 18 years old (checked by the require statement).
# They have not voted before (checked by the require statement).
# If both conditions are met, the user's address is marked as having voted in the hasVoted mapping.

