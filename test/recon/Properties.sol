
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Asserts} from "@chimera/Asserts.sol";
import {Setup} from "./Setup.sol";

import {Market,IMorpho} from "src/interfaces/IMorpho.sol";

abstract contract Properties is Setup, Asserts {
    function crytic_somethingWasBorrowed() public view returns (bool) {
        // this requires the fuzzer to supply collateral & loan tokens first
        // and then successfully borrow

        // returns false if something was borrowed
        return IMorpho(address(morpho)).market(marketId).totalBorrowAssets == 0;
    }
}
