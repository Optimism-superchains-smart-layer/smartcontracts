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
        EventRegistry.Hook memory hook = EventRegistry.Hook (
            "",
            hex"",
            1
        );

        EventRegistry.EventDefination memory eventDefination = EventRegistry.EventDefination(
            address(1),
            address(2),
            900,
            60,
            hook,
            "",
            hex"2acb"
        );
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
    }

    function testLookUpEventDefinationToHook() public {
        EventRegistry.Hook memory hook = EventRegistry.Hook (
            "",
            hex"",
            1
        );

        EventRegistry.EventDefination memory eventDefination = EventRegistry.EventDefination(
            address(1),
            address(2),
            900,
            60,
            hook,
            "",
            hex"2acb"
        );

        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
        eventRegistry.setEventDefinationToHook(9398487, eventDefination);
       
        EventRegistry.EventDefination memory eventDefination1 = EventRegistry.EventDefination(
            address(1),
            address(2),
            900,
            1,
            hook,
            "", 
            hex"2acb"
        );

        EventRegistry.EventDefination memory ed = eventRegistry.lookUpEventDefinationToHook(0, 9398487);

        assertEq(eventDefination1.emitterAddr, ed.emitterAddr);

        eventRegistry.removeEventDefinationToHook(0, 9398487);
   
        eventRegistry.lookUpEventDefinationToHook(0, 9398487);

        eventRegistry.lookUpL1BlockNoToEventDefinationSize(9398487);
    }

    

   
}
   