pragma solidity 0.8.24;



// IERC20

// Token
// Balance - Mapping
// Name - symbol
// Allowance
// Total supply - CMC, 
contract SotatekStandrardToken {
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowances;

    string private _name;
    string private _symbol;

    uint256 public totalSupply; 
    uint256 public cap;

    error MaximumCapExceeds(uint totalSupply, uint amount);
    event Minted(address _user, uint _amount);

    constructor(
        string memory name, 
        string memory symbol,
        uint _totalSupply
    ) {
        _name = name;
        _symbol = symbol;
        totalSupply = _totalSupply;
    }

    // ==== External ====
    function mint(address _user, uint256 _amount) external {
        require(totalSupply + _amount > cap, "SotatekStandrardToken::Maximum cap exceeds");
        balances[_user] += _amount;

        emit Minted(_user, _amount);
    }

    function transfer(address _from, address _to, uint256 _amount) {
        require(msg.sender() == _from, "SotatekStandrardToken::Invalid owner");
        require(_amount <= balances[_from], "SotatekStandrardToken::Wrong amount");

        balances[_from]
    }

    // ===== View =====
    function name() public view returns(string memory) {
        return _name;
    }

    function symbol() public view returns(string memory) {
        return _symbol;
    }

    
}