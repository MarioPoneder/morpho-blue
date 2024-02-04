
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Setup} from "./Setup.sol";

abstract contract BeforeAfter is Setup {

    struct Vars {
        uint256 __;
    }

    Vars internal _before;
    Vars internal _after;

    function __before() internal {

    }

    function __after() internal {

    }
}
