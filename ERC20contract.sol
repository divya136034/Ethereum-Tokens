pragma solidity ^0.4.16;
contract Token{
    function totalSupply() constant returns (uint256 supply)
    {}
    function balanceof(address _owner) constant returns(uint256 balance)
    {}
    function transfer(address _to, uint256 _value) returns(bool sucess)
    {}
    function transferFrom(address _from, address _to, uint256 _value) returns(bool sucess)
    {}
    function approve(address _spender, uint256 _value) returns(bool sucess)
    {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);
    
}
contract standeredToken is Token{
    function transfer(address _to, uint256 _value) returns (bool success) {
        
        if (balances[msg.sender] >= _value && _value > 0) {
            balances[msg.sender] -= _value;
            balances[_to] += _value;
            Transfer(msg.sender, _to, _value);
            return true;
        } else { return false; }
    }
    function transferFrom(address _from, address _to, uint256 _value) returns(bool sucess)
    {
        if(balances[_from] >= _value && _value >0)
        {
            balances[_from] -= _value;
            balances[_to] += _value;
            allowed[_from][msg.sender] -= _value;
            Transfer(_from, _to, _value);
            return true;
        } 
        else { return false; }
            
        
    }
    function balanceOf(address _owner) constant returns (uint256 balance) {
        return balances[_owner];
    }

    function approve(address _spender, uint256 _value) returns (bool success) {
        allowed[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }

    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {
      return allowed[_owner][_spender];
    }

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowed;
    uint256 public totalSupply;
}
contract ERC20CONTRACT is standeredToken{
    function()
    {
        throw;
    }
    string public name;                   
    uint8 public decimals=18;                
    string public symbol="sym";                
    string public version = 'H1.0';
    function ERC20CONTRACT()
    {
        balances[msg.sender]= 10^18;
        totalSupply=10^18;
        name= "number_of_tokens";
        decimals=0;
        symbol="SYM";
    }
    
    
}

    
