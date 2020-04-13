pragma solidity ^0.6.0;

import './Addition.sol';

contract derived_addition {
    addition public AddAddress;
    
    function dele_add(uint a, uint b) public returns (bytes memory deri_ans){
        (, bytes memory result) = address(AddAddress).delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        return result;
    }
    
    function setAddress(address _setAdditionAddres) public {
        AddAddress = addition(_setAdditionAddres);
    }
    
}
