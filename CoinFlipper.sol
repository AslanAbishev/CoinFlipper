// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract CoinFlipper{
    constructor() payable {

    }
    event GamePLayed(address player,bool isWinner);
    function playGame(uint8 _option) payable public returns (bool) {
        require(_option <=1,"U can choose only 0 or 1");
        require(address(this).balance >= msg.value*2,"Smart-contract run out of bounce ");
        uint256 _output = block.timestamp%2;
        if(_option == _output){
            payable(msg.sender).transfer(msg.value*2);
            emit GamePLayed(msg.sender, true);
            return true;
        }
        emit GamePLayed(msg.sender, false);
        return false;
    }
    receive () external payable {

    }
}