
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";

import "src/libraries/EventsLib.sol";
import "src/mocks/IrmMock.sol";
import "src/mocks/OracleMock.sol";
import "src/interfaces/IMorphoCallbacks.sol";
import "src/mocks/FlashBorrowerMock.sol";
import "src/mocks/ERC20Mock.sol";
import "src/libraries/SafeTransferLib.sol";
import "src/Morpho.sol";
import "src/interfaces/IOracle.sol";
import "src/interfaces/IMorpho.sol";
import "src/interfaces/IIrm.sol";

abstract contract Setup is BaseSetup {

    Morpho morpho;

    function setup() internal virtual override {
      morpho = new Morpho(); // TODO: Add parameters here
    }
}
