// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { Test, console2 } from "forge-std/Test.sol";
import { EventRegistry } from "../src/EventRegistry.sol";

contract EventRegistryTest is Test {
    EventRegistry public eventRegistry;

    function setUp() public {
        eventRegistry = new EventRegistry();
    }

    function testSetEventDefinationToHook() public {
        EventRegistry.EventDefination memory eventDefination = EventRegistry.EventDefination(
            address(1),
            address(2),
            900,
            "",
            "",
            5, 
            EventRegistry.Status.ToBeExecuted,
            hex"2acb"
        );
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
       
    }

   
}
