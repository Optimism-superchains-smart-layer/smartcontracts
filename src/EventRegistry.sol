// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EventRegistry {

    uint256 public TotalSubscribed;

    // updated by the sequencer in first block of an epoch
    uint256 public CurrentL1BlockNumber;


    struct EventDefination {
        // address of the contract emitting the event on L1
        address emitterAddr;

        // address of the contract with the hook on L2
        address hookAddr;

        uint256 l1BlockNo;

        // chain Id
        uint256 indexNo;

        Hook hook;

        // event abi (if left empty treat as EVM Block-Triggered Transactions)
        string eventName;

        // in the case of an EVM Block-Triggered Transactions, pass in the block values
        bytes eventValue;
    }

    struct Hook {
        // function hook name
        string funcSignature;

        bytes  params;

        uint8  noArgs;
    }


    mapping (uint256 => EventDefination[]) public L1BlockNoToEventDefination;


    function setEventDefinationToHook(uint256 l1BlockNo, EventDefination memory eventDefination) public returns (EventDefination memory) {
        require(l1BlockNo >= CurrentL1BlockNumber, "Err: Past BlockNO");

        uint256 indexNo;

        TotalSubscribed += 1;

        indexNo = L1BlockNoToEventDefination[l1BlockNo].length;

        eventDefination.indexNo = indexNo;

        L1BlockNoToEventDefination[l1BlockNo].push(eventDefination);

        return L1BlockNoToEventDefination[l1BlockNo][indexNo];
    }

    function setEventDefinationToHookOnNextL1Block(EventDefination memory eventDefination) public returns (EventDefination memory) {
        uint256 NextL1Block = CurrentL1BlockNumber + 1;

        uint256 indexNo;

        TotalSubscribed += 1;

        indexNo = L1BlockNoToEventDefination[NextL1Block].length;

        eventDefination.indexNo = indexNo;

        L1BlockNoToEventDefination[NextL1Block].push(eventDefination);

        return L1BlockNoToEventDefination[NextL1Block][indexNo];
    }

    function removeEventDefinationToHook(uint256 indexNo, uint256 l1BlockNo) external {
        delete L1BlockNoToEventDefination[l1BlockNo][indexNo];
    }

    function lookUpEventDefinationToHook(uint256 indexNo, uint256 l1BlockNo) public view returns (EventDefination memory) {
        return L1BlockNoToEventDefination[l1BlockNo][indexNo];
    }

    function lookUpL1BlockNoToEventDefinationSize(uint256 l1BlockNo) public view returns (uint256) {
        return L1BlockNoToEventDefination[l1BlockNo].length;
    }

    function updateCurrentL1BlockNumber(uint256 blockNo) external  {
        require(blockNo > CurrentL1BlockNumber);

        CurrentL1BlockNumber = blockNo;
    }
}
      


//  forge script script/EventRegistry.s.sol:ContractScript --rpc-url https://opt-goerli.g.alchemy.com/v2/AzA3aKrNQoPWvKMtei2PJgF44obSXUVK --private-key $PRIVATE_KEY --broadcast
// Hash: 0xb0345474d804a612bfd1673185f707d7297fb3b6dd3e0057388d3cdb8c3787e3
// Contract Address: 0xa25B27b67B93ad24C04D5D390C5CC4cBD329B4dD
// Block: 13119879

// cast send $EVENTREGISTRY_CONTRACT_ADDRESS "setEventDefinationToHook(address,address,uint256,string,string,uint8)" "(0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81,0xA48da8776ADD9870440A033D9322D0a0b51076BC,1102930,EmittedEvent(string),hookFn(),5)" --rpc-url https://opt-goerli.g.alchemy.com/v2/AzA3aKrNQoPWvKMtei2PJgF44obSXUVK  --private-key $PRIVATE_KEY
// cast send $EVENTREGISTRY_CONTRACT_ADDRESS "setEventDefinationToHook(uint256,(address,address,uint256,string,string,uint8))" "12123" "(0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81,0xA48da8776ADD9870440A033D9322D0a0b51076BC,1102930,EmittedEvent(string),hookFn(),5)" --rpc-url https://opt-goerli.g.alchemy.com/v2/AzA3aKrNQoPWvKMtei2PJgF44obSXUVK  --private-key $PRIVATE_KEY
// cast send $EVENTREGISTRY_CONTRACT_ADDRESS "setEventDefinationToHook(uint256,(address,address,uint256,string,string,uint8))" "12123" "(0x9feBdEEbCABEBd0ed772fF7b00C93be6B3d05E81,0xA48da8776ADD9870440A033D9322D0a0b51076BC,1102930,EmittedEvent(string),hookFn(),5)" --rpc-url  http://localhost:8545 --private-key $DEPLOYER



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