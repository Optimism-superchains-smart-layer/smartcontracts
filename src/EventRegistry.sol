// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;


// we place a contract with the utility to help us record 
// users events, we call this contract event registry.
contract EventRegistry {
    mapping(string => string) public eventToHook;

    function setEventToHook(string memory eventName, string memory hookName) public {
        eventToHook[eventName] = hookName;
    }
}
      