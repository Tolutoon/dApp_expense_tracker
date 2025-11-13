// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract ExpenseManagerContract {

    address public owner;

    struct Transaction {
        address user;
        uint amount;
        string reason;
        uint timestamp;
    }

    Transaction[] public transactions;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => uint) public balances;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can alter this");
        _;
    }

    event Deposit(address indexed _from, uint amount, string _reason, uint _timestamp);
    event Withdraw(address indexed _to, uint amount, string _reason, uint _timestamp);

    function deposit(uint _amount, string memory _reason) public payable {
        require(_amount > 0, "Deposit amount should be greater than 0");
        require(msg.value == _amount, "Sent value must match deposit amount");

        balances[msg.sender] += _amount;
        transactions.push(Transaction(msg.sender, _amount, _reason, block.timestamp));

        emit Deposit(msg.sender, _amount, _reason, block.timestamp);
    }

    function withdraw(uint _amount, string memory _reason) public {
        require(balances[msg.sender] >= _amount, "Insufficient funds");

        balances[msg.sender] -= _amount;
        transactions.push(Transaction(msg.sender, _amount, _reason, block.timestamp));

        payable(msg.sender).transfer(_amount);
        emit Withdraw(msg.sender, _amount, _reason, block.timestamp);
    }

    function getBalance(address _account) public view returns (uint) {
        return balances[_account];
    }

    function getTransactionCount() public view returns (uint) {
        return transactions.length;
    }

    function getTransaction(uint _index)
        public
        view
        returns (address, uint, string memory, uint)
    {
        require(_index < transactions.length, "Index out of bounds");
        Transaction memory transaction = transactions[_index];
        return (
            transaction.user,
            transaction.amount,
            transaction.reason,
            transaction.timestamp
        );
    }

    function getAllTransactions()
        public
        view
        returns (address[] memory, uint[] memory, string[] memory, uint[] memory)
    {
        uint length = transactions.length;

        address[] memory users = new address[](length);
        uint[] memory amounts = new uint[](length);
        string[] memory reasons = new string[](length);
        uint[] memory timestamps = new uint[](length);

        for (uint i = 0; i < length; i++) {
            users[i] = transactions[i].user;
            amounts[i] = transactions[i].amount;
            reasons[i] = transactions[i].reason;
            timestamps[i] = transactions[i].timestamp;
        }

        return (users, amounts, reasons, timestamps);
    }

    function changeOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid new owner address");
        owner = _newOwner;
    }
}
