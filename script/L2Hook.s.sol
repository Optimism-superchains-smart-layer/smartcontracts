// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { L2Hook } from '../src/L2Hook.sol';

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new L2Hook();
    }
}


// Hash: 0x166300d244a7de5582dc3841291f15f2924f253d2f569fc972b461227ecc64d8
// Contract Address: 0xA48da8776ADD9870440A033D9322D0a0b51076BC
// Block: 13053403

