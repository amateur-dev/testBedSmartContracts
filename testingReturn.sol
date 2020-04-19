pragma solidity ^0.6.0;

contract testingReturn {
    
    function testSplit(uint _inputNumber) public pure returns(uint valueA, uint valueB) {
        valueA = _inputNumber/5;
        valueB = _inputNumber - valueA;
    }
    
}

// the point is that if the variable is initialized in the returns (), you do not have to initialise it in the function body 