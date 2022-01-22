pragma solidity 0.4.23;

contract Voting {

    bytes32[] public cadidateList;
    mapping (bytes32 => uint8) public votesReceived;
    // constructor to initialize candidates
    constructor(bytes32[] candidateNames) public {
        candidateList = candidateNames;
    }
    // vote for candidates
    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }
    // getcount of votes for each candidates

    function totalVotesFor(bytes32 candidate) view public returns(uint8){
        require(validCandidate(candidate));
        return votesReceived[candidate];
    }
    
    function validCandidate(bytes32 candidate) view public returns (bool){
        for (uint i = 0; i < candidateList.length; i++){
            if(candidateList[i] == candidate) {
                return true;
            }
        }
        return false;
    }

}
