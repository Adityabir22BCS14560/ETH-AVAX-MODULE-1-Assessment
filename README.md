contract VotingSystem 
This section defines a contract named VotingSystem with three state variables:

owner: An address type variable to store the owner's address (the deployer of the contract).
age: A mapping that associates an address with an unsigned integer (uint), representing the age of the voter.
hasVoted: A mapping that associates an address with a boolean, indicating whether the voter has voted or not.
