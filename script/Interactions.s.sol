//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {NFT} from "../src/NFT.sol";
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";


contract MintNFT is Script {
    function run() external {
        address mostRecentNFT = DevOpsTools.get_most_recent_deployment("NFT",block.chainid);
        mintNFTOnContract(mostRecentNFT);
    }

    function mintNFTOnContract(address contractAddress) public {
        vm.startBroadcast();
        NFT(contractAddress).mintNFT("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");
        vm.stopBroadcast();
    }
}