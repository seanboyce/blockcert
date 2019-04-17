pragma solidity ^0.5.4;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';
import 'openzeppelin-solidity/contracts/ownership/Ownable.sol';

contract cert is ERC721Full, Ownable {

using Counters for Counters.Counter;
Counters.Counter private tokenId;

struct certificate {
   string name;
   string tomoAddress;
   string course;
   string status;
   uint16 dateIssued;
   uint8 grade;
}

certificate[] public student;

 constructor(
    string memory name,
    string memory symbol
  )
    ERC721Full(name, symbol)
    public
  {}

function viewcert( uint256 certTokenId ) public view returns(string memory name, string memory tomoAddress, string memory course, string memory status, uint16 dateIssued, uint8 grade) {
    certificate memory _certificate = student[certTokenId];
    name = _certificate.name;
	tomoAddress = _certificate.tomoAddress;
    course = _certificate.course;
    status = _certificate.status;
	dateIssued = _certificate.dateIssued;
	grade = _certificate.grade;
	return (name, tomoAddress, course, status, dateIssued, grade);
     }


function mint(string memory _name, string memory _tomoAddress, string memory _course, string memory _status, uint16 _dateIssued, uint8 _grade) public payable onlyOwner {
   uint256 certTokenId = tokenId.current();
   certificate memory _certificate = certificate({ name: _name, tomoAddress: _tomoAddress, course: _course, status: _status, dateIssued: _dateIssued, grade: _grade});
   student.push(_certificate);
  _mint(msg.sender, certTokenId);
   tokenId.increment();
 }

	 
}


