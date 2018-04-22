pragma solidity ^0.4.17;

contract mortal {
    
    address owner;

    function mortal() { owner = msg.sender; }

    function kill() { if (msg.sender == owner) selfdestruct(owner); }
    
}
contract comon is mortal {
    string[] arr;
    function getData() public constant returns (string[]) {
        
        return arr;
    }
   function setData(string newData) public{
       if (msg.sender == owner) 
        arr.push(newData);
    } 
}
