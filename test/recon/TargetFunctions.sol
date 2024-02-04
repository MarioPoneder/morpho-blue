
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

import {MarketParams} from "src/interfaces/IMorpho.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {

    function morpho_accrueInterest() public {
      morpho.accrueInterest(marketParams);
    }

    function morpho_borrow(uint256 assets) public {
      vm.prank(SENDER_1);
      morpho.borrow(marketParams, assets, 0, SENDER_1, SENDER_1);
    }

    function morpho_flashLoan(uint256 assets, bytes memory data) public {
      morpho.flashLoan(address(collateralToken), assets, data);
    }

    function morpho_liquidate(uint256 seizedAssets, bytes memory data) public {
      vm.prank(SENDER_2);
      morpho.liquidate(marketParams, SENDER_1, seizedAssets, 0, data);
    }

    function morpho_repay(uint256 assets, bytes memory data) public {
      vm.prank(SENDER_1);
      morpho.repay(marketParams, assets, 0, SENDER_1, data);
    }

    function morpho_supply(uint256 assets, bytes memory data) public {
      vm.prank(SENDER_2);
      morpho.supply(marketParams, assets, 0, SENDER_2, data);
    }

    function morpho_supplyCollateral(uint256 assets, bytes memory data) public {
      vm.prank(SENDER_1);
      morpho.supplyCollateral(marketParams, assets, SENDER_1, data);
    }

    function morpho_withdraw(uint256 assets) public {
      vm.prank(SENDER_2);
      morpho.withdraw(marketParams, assets, 0, SENDER_2, SENDER_2);
    }

    function morpho_withdrawCollateral(uint256 assets) public {
      vm.prank(SENDER_1);
      morpho.withdrawCollateral(marketParams, assets, SENDER_1, SENDER_1);
    }
}
