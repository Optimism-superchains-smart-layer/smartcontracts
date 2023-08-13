// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { EventRegistry } from '../src/EventRegistry.sol';

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new EventRegistry();    
    }
}

     
// forge script script/EventRegistry.s.sol:Deploy --private-key $DEPLOYER --broadcast --rpc-url ROLLUP_RPC_URL