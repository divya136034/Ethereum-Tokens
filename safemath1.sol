pragma solidity ^0.5.0;
library safemath{
    
    function add(uint256 a, uint256 b)internal pure returns(uint256){
        uint256 c=a+b;
        require( c>=a, "owerflow conditions ");
        return c;
    }
    function sub(uint256 a, uint256 b)internal pure returns(uint256){
        require(b<= a, "error in data");
        uint256 c= a-b;
        return c;
    }
    
}