// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import { L1EventEmitter } from "../src/L1EventEmitter.sol";

contract L1EventEmitterTest is Test {
    L1EventEmitter public l1EventEmitter;

    function setUp() public {
        l1EventEmitter = new L1EventEmitter();
    }

    function testEmitEvent() public {
        l1EventEmitter.emitEvent();
        // assertEq(counter.number(), 1)
    }

    function testHookFn() public {
        l1EventEmitter.hookFn();

        assertEq(l1EventEmitter.val(), 1);
    }


}
