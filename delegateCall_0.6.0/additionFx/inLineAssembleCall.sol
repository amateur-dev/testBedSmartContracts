pragma solidity ^0.6.0;

import './Addition.sol';

contract derived_addition {
    addition public AddAddress;
    uint public value;
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
    
    function submitTransaction(address _destination, uint _value, bytes memory _data)
        public
        returns (bool)
    {
        uint _datalength = _data.length;
        return external_call(_destination, _value, _datalength, _data);
    }
    
    function external_call(address destination, uint _value, uint dataLength, bytes memory data) private returns (bool) {
        bool result;
        assembly {
            let x := mload(0x40)   // "Allocate" memory for output (0x40 is where "free memory" pointer is stored by convention)
            let d := add(data, 32) // First 32 bytes are the padded length of data, so exclude that
            result := call(
                sub(gas(), 34710),
                destination,
                _value,
                d,
                dataLength,
                x,
                0)
        }
        return result;
    }
    
    // call(g, a, v, in, insize, out, outsize)	
}
