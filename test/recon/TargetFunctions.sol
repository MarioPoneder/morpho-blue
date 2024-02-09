
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

import {MarketParams} from "src/interfaces/IMorpho.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {

    function morpho_accrueInterest() public {
      vm.prank(msg.sender);
      morpho.accrueInterest(marketParams);
    }

    function morpho_borrow(uint256 assets) public {
      vm.prank(msg.sender);
      morpho.borrow(marketParams, assets, 0, msg.sender, msg.sender);
    }

    function morpho_borrow2(uint256 assets) public {
      vm.prank(SENDER_1);
      morpho.borrow(marketParams2, assets, 0, SENDER_1, SENDER_1);
    }

    function morpho_flashLoan(uint256 assets, bytes memory data) public {
      vm.prank(msg.sender);
      morpho.flashLoan(address(collateralToken), assets, data);
    }

    function morpho_liquidate(uint256 seizedAssets, bytes memory data) public {
      vm.prank(msg.sender);
      morpho.liquidate(marketParams, msg.sender, seizedAssets, 0, data);
    }

    function morpho_repay(uint256 assets, bytes memory data) public {
      vm.prank(msg.sender);
      morpho.repay(marketParams, assets, 0, msg.sender, data);
    }

    function morpho_supply(uint256 assets, bytes memory data) public {
      vm.prank(msg.sender);
      morpho.supply(marketParams, assets, 0, msg.sender, data);
    }

    function morpho_supplyCollateral(uint256 assets, bytes memory data) public {
      vm.prank(msg.sender);
      morpho.supplyCollateral(marketParams, assets, msg.sender, data);
    }

    function morpho_withdraw(uint256 assets) public {
      vm.prank(msg.sender);
      morpho.withdraw(marketParams, assets, 0, msg.sender, msg.sender);
    }

    function morpho_withdrawCollateral(uint256 assets) public {
      vm.prank(msg.sender);
      morpho.withdrawCollateral(marketParams, assets, msg.sender, msg.sender);
    }
}
