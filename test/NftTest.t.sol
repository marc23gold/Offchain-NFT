//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {NFT} from "../src/NFT.sol";
import {Test} from "forge-std/Test.sol";
import {DeployNFT} from "../script/DeployNFT.s.sol";

contract NftTest is Test{

    DeployNFT public deployNFT;
    NFT public nft;
    address USER = makeAddr("USER");

    function setUp() public {
        deployNFT = new DeployNFT();
        nft = deployNFT.run();
    }

    function testNameIsCorrect() public {
        string memory expectedName = "OffchainNFT";
        string memory actualName = nft.name();
        //assert(actualName == expectedName);
        assert(keccak256(abi.encodePacked(expectedName)) == keccak256(abi.encodePacked(actualName)));
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        nft.mintNFT("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json");

        assert(nft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked("ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json")) == keccak256(abi.encodePacked(nft.tokenURI(0))));
    }
}