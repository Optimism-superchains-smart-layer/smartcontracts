// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// pre smart contract developer sample contract
contract L2Hook {
    
    uint8 public val;

    function hookFn() public {
        addOneToVal();
    }

    function addOneToVal() public {
        val += 1;
    }
}
