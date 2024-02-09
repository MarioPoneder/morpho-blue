
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {TargetFunctions} from "./TargetFunctions.sol";
import {CryticAsserts} from "@chimera/CryticAsserts.sol";
import {vm} from "@chimera/Hevm.sol";

import {IMorpho} from "src/interfaces/IMorpho.sol";

// echidna . --contract CryticTester --config echidna.yaml
// medusa fuzz
contract CryticTester is TargetFunctions, CryticAsserts {
    constructor() payable {
        setup();
        
        // prepare market 2 with collateral & supply
        vm.prank(SENDER_1);
        morpho.supplyCollateral(marketParams2, 10_000e18, SENDER_1, hex"");
        vm.prank(SENDER_2);
        morpho.supply(marketParams2, 10_000e18, 0, SENDER_2, hex"");
    }

    function assert_noInterestAccrued() public {
        IMorpho _morpho = IMorpho(address(morpho));

        // 'morpho_borrow2' has succeeded
        precondition(_morpho.market(marketId2).totalBorrowAssets > 0);
        // last market interaction / interest accrual was at least 100 seconds ago
        precondition(_morpho.market(marketId2).lastUpdate < (block.timestamp - 100));

        uint256 totalBorrowBeforeAccrued = _morpho.market(marketId2).totalBorrowAssets;
        _morpho.accrueInterest(marketParams2);
        uint256 totalBorrowAfterAccrued = _morpho.market(marketId2).totalBorrowAssets;

        // assertion is triggered if nothing was borrowed
        assert(totalBorrowAfterAccrued > totalBorrowBeforeAccrued);
    }
}
