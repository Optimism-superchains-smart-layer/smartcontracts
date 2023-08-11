// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console2 } from "forge-std/Test.sol";
import { L2Hook } from "../src/L2Hook.sol";

contract L1EventEmitterTest is Test {
    L2Hook public l2Hook;

    function setUp() public {
        l2Hook = new L2Hook();
    }



    function testHookFn() public {
        l2Hook.hookFn();

        assertEq(l2Hook.val(), 1);
    }


}