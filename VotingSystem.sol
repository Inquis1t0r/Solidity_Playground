pragma solidity ^0.8.0;

contract VotingSystem {
    mapping(address => bool) public voters;
    mapping(bytes32 => uint256) public votes;
    bytes32[] public options;

    constructor(bytes32[] memory _options) {
        options = _options;
    }

    function vote(bytes32 option) public {
        require(voters[msg.sender] == false, "Already voted");
        require(isValidOption(option), "Invalid option");

        voters[msg.sender] = true;
        votes[option] += 1;
    }

    function isValidOption(bytes32 option) public view returns (bool) {
        for (uint256 i = 0; i < options.length; i++) {
            if (options[i] == option) {
                return true;
            }
        }
        return false;
    }

    function getVotes(bytes32 option) public view returns (uint256) {
        return votes[option];
    }
}
