pragma solidity ^0.8.7;
// SPDX-License-Identifier:MIT

contract FeeCollector { // 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    address public owner;
    uint256 public balance;

    constructor() {
        owner = msg.sender;
    }

    receive() payable external {
        balance += msg.value;
    }

    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "Only owner can withdraw");
        
        destAddr.transfer(amount);
        balance -= amount;
    }
}
