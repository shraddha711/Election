pragma solidity ^0.5.0;

contract Election{
	//Model candidate
	struct Candidate{
		uint id;
		string name;
		uint voteCount;
	}
	//Store Candidate
	//Fetch Candidate
	mapping (uint => Candidate) public candidates;
	//Store accounts that have voted
	mapping(address => bool) public voters; //will take acc addr and return true if voted
	//Store Candidate Count
	uint public candidateCount=0;//state variable

	//Constructor
	constructor() public {
		addCandidate("Ruturaj Patil");
		addCandidate("Amal Mahadik");
		//addCandidate("Hasan Mushrif");
	}
	 function addCandidate (string memory _name) private {
        candidateCount ++;
        candidates[candidateCount] = Candidate(candidateCount, _name, 0);
    }
    function vote(uint _candidateId) public {
    	//record voter as voted only once
    	require(!voters[msg.sender]);
    	//require valid candidate

    	require (_candidateId>0 && _candidateId<=candidateCount);
    	//mediator to find which acc is voting - voters
    	voters[msg.sender] = true;
    	//update candidate vote count
    	candidates[_candidateId].voteCount++;

    }
}