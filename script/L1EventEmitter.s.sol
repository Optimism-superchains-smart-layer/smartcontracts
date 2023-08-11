// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import { L1EventEmitter } from '../src/L1EventEmitter.sol';

contract ContractScript is Script {
    function setUp() public {}

    function run() public {
        vm.broadcast();
        new L1EventEmitter();
    }
}



// Hash: 0xfaecfd87e57d3894cfe029044f048b28b8686af8d016f830bc3f7f27623fd475
// Contract Address: 0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81
// Block: 9485234


// emit an event on L1
// export CONTRACT_ADDRESS=0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81