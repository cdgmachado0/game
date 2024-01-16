// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    error UnsafeDecrement();

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number += 1;
    }

    function decrement(uint256 num_) public {
        if (number - num_ > 0) {
            number -= num_;
        } else {
            revert UnsafeDecrement();
        }
    }

    function getNum() public view returns(uint256) {
        return number;
    }
}
