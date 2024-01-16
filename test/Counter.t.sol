// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../contracts/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(10);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 11);
    }

    function testSetNumber(uint256 x) public {
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    function testTrue() public {
        assertTrue(true);
    }

    function testDecrement(uint256 num_) public {
        vm.assume(num_ < counter.getNum());
        uint256 countNum = counter.getNum(); 
        counter.decrement(num_); 
        assertEq(countNum - num_, counter.getNum());
    }

    function testFailDecrement(uint256 num_) public {
        vm.assume(num_ > counter.getNum());
        uint256 countNum = counter.getNum(); 
        counter.decrement(num_); 
    }

    function testCannotDecrementLargeNumbers(uint256 num_) public {
        vm.assume(num_ > counter.getNum());
        vm.expectRevert(stdError.arithmeticError);
        counter.decrement(num_);
    }
}
