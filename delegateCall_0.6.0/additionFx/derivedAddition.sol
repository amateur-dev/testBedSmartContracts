pragma solidity ^0.6.0;

import './Addition.sol';

contract derived_addition {
    addition public AddAddress;
    uint public value;
    
    function dele_add(uint a, uint b) public {
        (, bytes memory result) = address(AddAddress).delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        value = abi.decode(result, (uint256));
    }
    
    function setAddress(address _setAdditionAddres) public {
        AddAddress = addition(_setAdditionAddres);
    }
    
}
