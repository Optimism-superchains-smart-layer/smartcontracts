// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import { EventRegistry } from "../src/EventRegistry.sol";

contract EventRegistryTest is Test {
    EventRegistry public eventRegistry;

    function setUp() public {
        eventRegistry = new EventRegistry();
    }

    function testSetEventToHook() public {
        eventRegistry.setEventToHook("EmittedEvent(string)", "hookFn()");
        // assertEq(counter.number(), 1)
    }


}
