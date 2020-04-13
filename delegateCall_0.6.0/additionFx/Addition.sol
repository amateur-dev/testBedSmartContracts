pragma solidity ^0.6.0;

contract addition {
    uint public original_value;
    
    function add(uint a, uint b) public returns (uint ans) {
        original_value = a+b;
        return (original_value);
    }
}
