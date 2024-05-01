//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {NFT} from "../src/NFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployNFT is Script{
    NFT nft;
    function run() public returns(NFT) {
        vm.startBroadcast();
        nft = new NFT();
        vm.stopBroadcast();
        return nft;
    }

}