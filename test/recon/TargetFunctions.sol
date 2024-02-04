
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseTargetFunctions} from "@chimera/BaseTargetFunctions.sol";
import {BeforeAfter} from "./BeforeAfter.sol";
import {Properties} from "./Properties.sol";
import {vm} from "@chimera/Hevm.sol";

import {
    MarketParams,
    Authorization,
    Signature
} from "src/interfaces/IMorpho.sol";

abstract contract TargetFunctions is BaseTargetFunctions, Properties, BeforeAfter {

    function morpho_accrueInterest(MarketParams calldata marketParams) public {
      morpho.accrueInterest(marketParams);
    }

    function morpho_borrow(MarketParams calldata marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
      morpho.borrow(marketParams, assets, shares, onBehalf, receiver);
    }

    function morpho_createMarket(MarketParams calldata marketParams) public {
      morpho.createMarket(marketParams);
    }

    function morpho_enableIrm(address irm) public {
      morpho.enableIrm(irm);
    }

    function morpho_enableLltv(uint256 lltv) public {
      morpho.enableLltv(lltv);
    }

    function morpho_flashLoan(address token, uint256 assets, bytes calldata data) public {
      morpho.flashLoan(token, assets, data);
    }

    function morpho_liquidate(MarketParams calldata marketParams, address borrower, uint256 seizedAssets, uint256 repaidShares, bytes calldata data) public {
      morpho.liquidate(marketParams, borrower, seizedAssets, repaidShares, data);
    }

    function morpho_repay(MarketParams calldata marketParams, uint256 assets, uint256 shares, address onBehalf, bytes calldata data) public {
      morpho.repay(marketParams, assets, shares, onBehalf, data);
    }

    function morpho_setAuthorization(address authorized, bool newIsAuthorized) public {
      morpho.setAuthorization(authorized, newIsAuthorized);
    }

    function morpho_setAuthorizationWithSig(Authorization calldata authorization, Signature calldata signature) public {
      morpho.setAuthorizationWithSig(authorization, signature);
    }

    function morpho_setFee(MarketParams calldata marketParams, uint256 newFee) public {
      morpho.setFee(marketParams, newFee);
    }

    function morpho_setFeeRecipient(address newFeeRecipient) public {
      morpho.setFeeRecipient(newFeeRecipient);
    }

    function morpho_setOwner(address newOwner) public {
      morpho.setOwner(newOwner);
    }

    function morpho_supply(MarketParams calldata marketParams, uint256 assets, uint256 shares, address onBehalf, bytes calldata data) public {
      morpho.supply(marketParams, assets, shares, onBehalf, data);
    }

    function morpho_supplyCollateral(MarketParams calldata marketParams, uint256 assets, address onBehalf, bytes calldata data) public {
      morpho.supplyCollateral(marketParams, assets, onBehalf, data);
    }

    function morpho_withdraw(MarketParams calldata marketParams, uint256 assets, uint256 shares, address onBehalf, address receiver) public {
      morpho.withdraw(marketParams, assets, shares, onBehalf, receiver);
    }

    function morpho_withdrawCollateral(MarketParams calldata marketParams, uint256 assets, address onBehalf, address receiver) public {
      morpho.withdrawCollateral(marketParams, assets, onBehalf, receiver);
    }
}
