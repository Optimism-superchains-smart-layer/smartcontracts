// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract L1EventEmitter {

    event EmittedEvent(string indexed name);
    
    uint8 public val;

    function emitEvent() public {
        emit EmittedEvent("EventEmitted");
    }

    function hookFn() public {
        addOneToVal();
    }

    function addOneToVal() public {
        val += 1;
    }
}
      