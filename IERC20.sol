pragma solidity ^0.5.0;
     interface IERC20{
         function totalSupply() external view returns(uint256);
         function balanceof(address account) external view returns(uint256);
         function transfer(address reciever, uint256 amount) external returns(bool);
        // function allowance(address owner, address spender) external view returns(uint256);
         function approve(address spender, uint256 amount) external returns(bool);
         function transferfrom(address sender, address reciever, uint256 amount)external returns(bool);
         event Transfer(address indexed from, address indexed to, uint256 value);
         event Approval(address indexed owner, address indexed spender, uint256 value);
     }
