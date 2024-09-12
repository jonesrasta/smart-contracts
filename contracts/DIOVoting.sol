pragma solidity >=0.8.0 <0.9.0;


contract DIOVoting {

    mapping (string => uint256) public votesReceived;
    string[] public candidateList;

    constructor(string[] memory candidateNames) {
        candidateList = candidateNames;
    }

    function totalVotesFor(string memory candidate) view public returns (uint256) {
        require(validCandidate(candidate), "Invalid candidate.");
        return votesReceived[candidate];
    }

    function voteForCandidate(string memory candidate) public {
        require(validCandidate(candidate), "Invalid candidate.");
        votesReceived[candidate] += 1;
    }

    function validCandidate(string memory candidate) view public returns (bool) {
        for (uint256 i = 0; i < candidateList.length; i++) {
            if (keccak256(abi.encodePacked(candidateList[i])) == keccak256(abi.encodePacked(candidate))) {
                return true;
            }
        }
        return false;
    }
}
