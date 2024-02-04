
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {

    function morpho_accrueInterest(tuple calldata marketParams) public {
      morpho.accrueInterest(MarketParams(marketParams));
    }

    function morpho_borrow(tuple calldata marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
      morpho.borrow(MarketParams(marketParams), assets, shares, onBehalf, receiver);
    }

    function morpho_createMarket(tuple calldata marketParams) public {
      morpho.createMarket(MarketParams(marketParams));
    }

    function morpho_enableIrm(address irm) public {
      morpho.enableIrm(irm);
    }

    function morpho_enableLltv(uint256 lltv) public {
      morpho.enableLltv(lltv);
    }

    function morpho_flashLoan(address token, uint256 assets, bytes data) public {
      morpho.flashLoan(token, assets, data);
    }

    function morpho_liquidate(tuple calldata marketParams, address borrower, uint256 seizedAssets, uint256 repaidShares, bytes data) public {
      morpho.liquidate(MarketParams(marketParams), borrower, seizedAssets, repaidShares, data);
    }

    function morpho_repay(tuple calldata marketParams, uint256 assets, uint256 shares, address onBehalf, bytes data) public {
      morpho.repay(MarketParams(marketParams), assets, shares, onBehalf, data);
    }

    function morpho_setAuthorization(address authorized, bool newIsAuthorized) public {
      morpho.setAuthorization(authorized, newIsAuthorized);
    }

    function morpho_setAuthorizationWithSig(tuple calldata authorization, tuple calldata signature) public {
      morpho.setAuthorizationWithSig(Authorization(authorization), Signature(signature));
    }

    function morpho_setFee(tuple calldata marketParams, uint256 newFee) public {
      morpho.setFee(MarketParams(marketParams), newFee);
    }

    function morpho_setFeeRecipient(address newFeeRecipient) public {
      morpho.setFeeRecipient(newFeeRecipient);
    }

    function morpho_setOwner(address newOwner) public {
      morpho.setOwner(newOwner);
    }

    function morpho_supply(tuple calldata marketParams, uint256 assets, uint256 shares, address onBehalf, bytes data) public {
      morpho.supply(MarketParams(marketParams), assets, shares, onBehalf, data);
    }

    function morpho_supplyCollateral(tuple calldata marketParams, uint256 assets, address onBehalf, bytes data) public {
      morpho.supplyCollateral(MarketParams(marketParams), assets, onBehalf, data);
    }

    function morpho_withdraw(tuple calldata marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
      morpho.withdraw(MarketParams(marketParams), assets, shares, onBehalf, receiver);
    }

    function morpho_withdrawCollateral(tuple calldata marketParams, uint256 assets, address onBehalf, address receiver) public {
      morpho.withdrawCollateral(MarketParams(marketParams), assets, onBehalf, receiver);
    }
}
