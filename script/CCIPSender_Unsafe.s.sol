// script/CCIPSender_Unsafe.s.sol

// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "forge-std/Script.sol";
import {CCIPSender_Unsafe} from "../src/CCIPSender_Unsafe.sol";

contract DeployCCIPSender_Unsafe is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        address fujiLink = 0x326C977E6efc84E512bB9C30f76E30c160eD06FB;
        address fujiRouter = 0x70499c328e1E2a3c41108bd3730F6670a44595D1;

        CCIPSender_Unsafe sender = new CCIPSender_Unsafe(
            fujiLink,
            fujiRouter
        );

        console.log(
            "CCIPSender_Unsafe deployed to ",
            address(sender)
        );

        vm.stopBroadcast();
    }
}