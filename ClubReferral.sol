// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MyContract {

address[] private members;
mapping(address => bool) isMember;

function join() public payable {
    require(!isMember[msg.sender]);
    require(msg.value == 1 ether);
    
    members.push(msg.sender);
    isMember[msg.sender] = true;
}

function join_referrer(address _referral) public payable{
    require(isMember[_referral]);
    join();
    payable(_referral).transfer(10000000000000000);
}

function get_members() public view returns(address[] memory) {
    return members;
}

}
