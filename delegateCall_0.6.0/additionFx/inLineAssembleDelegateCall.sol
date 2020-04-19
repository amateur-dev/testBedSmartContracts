pragma solidity ^0.6.0;

import './Addition.sol';

contract derived_addition {
    uint public value;
    addition public AddAddress;
    event dataEvent(bytes);
    
    function dele_add(uint a, uint b) public {
        bytes memory random  = abi.encodeWithSignature("add(uint256,uint256)", a, b);
        (, bytes memory result) = address(AddAddress).delegatecall(abi.encodeWithSignature("add(uint256,uint256)", a, b));
        emit dataEvent(random);
        value = abi.decode(result, (uint256));
    }
    
    function setAddress(address _setAdditionAddres) public {
        AddAddress = addition(_setAdditionAddres);
    }
    
    function submitTransaction(address _destination, bytes memory _data)
        public returns (uint ans)
    {
        return external_call(_destination, _data);
    }
    
    function external_call(address destination, bytes memory data) private returns (uint) {

        assembly {
            let result := delegatecall(sub(gas(),40000), destination, add(data, 0x20), mload(data), 0, 0)//this builds the payload
            let size := returndatasize()
    
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
    
            // revert instead of invalid() bc if the underlying call failed with invalid() it already wasted gas.
            // if the call returned error data, forward it
            if iszero(result) { revert(ptr, size) }
            return(ptr, size)

            }
            
        
    }
    
    // call(g, a, v, in, insize, out, outsize)	
    // delegatecall(g, a, in, insize, out, outsize)	
}
