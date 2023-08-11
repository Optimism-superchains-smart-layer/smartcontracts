// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// https://therealbytes.substack.com/p/presenting-ticking-optimism
contract EventRegistry {

    uint256 public TotalHooks;

    // updated by the sequencer in first block of an epoch
    uint256 public currentL1BlockNumber;

    enum Status {
        Executed, // 0
        StillExecuting, // 1
        ToBeExecuted // 2
    }

    // sample usage: to reward smartcontract developers, based on the gas cost used by their smart contract
    // we index a particular specified contract on L1 and make payment when, certain conditions are met
    // I need and interface 
    struct EventDefination {
        // address of the contract emitting the event on L1
        address emitterAddr;

        // address of the contract with the hook on L2
        address hookAddr;

        uint256 executionTime; 

        // event abi 
        string eventName;

        // function hook name
        string hookName;

        // chain Id
        uint8 chainId;

        Status status;

        bytes eventValue;
    }

    // ( index => ( block number => EventDefinationToHook ))
    mapping( uint256 => mapping(uint256 => EventDefination)) public EventDefinationToHook;

    function setEventDefinationToHook(uint256 l1BlockNo, EventDefination memory eventDefination) public {
        require(l1BlockNo >= currentL1BlockNumber, "Err: Past BlockNO");

        TotalHooks += 1;

        EventDefinationToHook[TotalHooks][l1BlockNo] = eventDefination;
    }

    function removeEventDefinationToHook(uint256 hookNo, uint256 l1BlockNo) external {
        require(hookNo > 0);

        EventDefinationToHook[TotalHooks][l1BlockNo] = EventDefinationToHook[0][0];
    }

    function updateCurrentL1BlockNumber(uint256 blockNo) external  {
        require(blockNo > currentL1BlockNumber);

        currentL1BlockNumber = blockNo;
    }
}
      


//  forge script script/EventRegistry.s.sol:ContractScript --rpc-url https://opt-goerli.g.alchemy.com/v2/AzA3aKrNQoPWvKMtei2PJgF44obSXUVK --private-key $PRIVATE_KEY --broadcast
// Hash: 0xb0345474d804a612bfd1673185f707d7297fb3b6dd3e0057388d3cdb8c3787e3
// Contract Address: 0xa25B27b67B93ad24C04D5D390C5CC4cBD329B4dD
// Block: 13119879

// cast send $EVENTREGISTRY_CONTRACT_ADDRESS "setEventDefinationToHook(address,address,uint256,string,string,uint8)" "(0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81,0xA48da8776ADD9870440A033D9322D0a0b51076BC,1102930,EmittedEvent(string),hookFn(),5)" --rpc-url https://opt-goerli.g.alchemy.com/v2/AzA3aKrNQoPWvKMtei2PJgF44obSXUVK  --private-key $PRIVATE_KEY



// blockHash               0x4816326ebd973eae3ffab1590d1e19cee72ab20d5046b4a8ee67221252d6492f
// blockNumber             13120241
// contractAddress         
// cumulativeGasUsed       231402
// effectiveGasPrice       3000000050
// gasUsed                 180925
// logs                    []
// logsBloom               0x00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
// root                    
// status                  1
// transactionHash         0xbf9d1d2f11ce9f31869e8e77a972127082706a080a127a7ddfae07daf6074882
// transactionIndex        1
// type                    2