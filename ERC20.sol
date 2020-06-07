pragma solidity ^0.5.0;
import "browser/IERC20.sol";
import "browser/safemath.sol";
import "browser/context.sol";
contract ERC20 is IERC20, context{
    using safemath for uint256;
    mapping(address => uint256) private _balance;
    mapping (address => mapping (address => uint256)) private _allowances;
    uint256 private totalsupply;
    string private name;
    string private symbol;
    uint8 private decimal;
    
    constructor(string memory _name, string memory _symbol, uint8 _decimal,uint256 _totalsupply)public {
        name=_name;
        symbol=_symbol;
        decimal=_decimal;
        totalsupply=_totalsupply;
        
    }
    function totalSupply() public view returns(uint256){
        return totalsupply;
    }
    function balanceof(address account)public view returns(uint256){
        return _balance[account];
    }
    function transfer(address reciever, uint256 amount)public returns(bool){
        require(_msgSender() != address(0), " address is zero");
        require(reciever != address(0), "reciever address is zero");
        _balance[_msgSender()]= _balance[_msgSender()].sub(amount);
        _balance[reciever]= _balance[reciever].add(amount);
       emit Transfer(_msgSender(), reciever, amount);
        return true;
    }
    function transferfrom(address sender, address reciever, uint256 amount)public returns(bool){
        _transfer(sender, reciever, amount);
        _approve(sender, _msgSender(), _allowances[sender][_msgSender()].add(amount));
        return true;
    }
    function _transfer(address sender, address reciever, uint256 amount)internal{
        require(sender != address(0), " address is zero");
        require(reciever != address(0), "reciever address is zero");
        _balance[sender]= _balance[sender].sub(amount);
        _balance[reciever]= _balance[reciever].add(amount);
       emit Transfer(sender, reciever, amount);
    }
    function approve(address spender, uint256 amount)public returns(bool){
        _approve(_msgSender(), spender, amount);
        return true;
    }
    function _approve(address owner, address spender, uint256 amount) internal{
        require(owner != address(0), " address is zero");
        require(spender != address(0), "spender address is zero");
        _allowances[owner][spender]=amount;
        emit Approval(owner, spender, amount);
    }
    function _mint(address account, uint256 amount)public{
        require(account != address(0)," address is zero");
        totalsupply =totalsupply.add(amount);
        _balance[account] = _balance[account].add(amount);
       emit Transfer(address(0), account, amount);
    }
    function _burn(address account, uint256 amount) public{
        require(account!= address(0), "address is Zero");
        _balance[account]=_balance[account].sub(amount);
        totalsupply= totalsupply.sub(amount);
       emit Transfer(account, address(0), amount);
    }
    function increaseapproval(address spender, uint256 value)public returns(bool){
    _approve(_msgSender(), spender, _allowances[_msgSender()][spender].add(value));
    return true;
    }
    function decreaseapproval(address spender, uint256 value)public returns(bool){
        _approve(_msgSender(), spender, _allowances[_msgSender()][spender].sub(value));
        return true;
    }
}