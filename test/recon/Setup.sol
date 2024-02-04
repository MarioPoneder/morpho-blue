
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {BaseSetup} from "@chimera/BaseSetup.sol";
import {vm} from "@chimera/Hevm.sol";

import {Morpho} from "src/Morpho.sol";
import {IrmMock} from "src/mocks/IrmMock.sol";
import {ERC20Mock} from "src/mocks/ERC20Mock.sol";
import {OracleMock} from "src/mocks/OracleMock.sol";
import {MarketParams,Id} from "src/interfaces/IMorpho.sol";
import {MarketParamsLib} from "src/libraries/MarketParamsLib.sol";

abstract contract Setup is BaseSetup {
    using MarketParamsLib for MarketParams;

    // from 'medusa.json'
    address constant SENDER_1 = address(0x10000);
    address constant SENDER_2 = address(0x20000);
    address constant SENDER_3 = address(0x30000);

    uint256 constant DEFAULT_ORACLE_PRICE = 1e36; // collateral : loan = 1 : 1
    uint256 constant DEFAULT_LLTV = 0.8 ether;    // 80%

    Morpho morpho;

    ERC20Mock loanToken;
    ERC20Mock collateralToken;

    OracleMock oracle;
    IrmMock irm;

    MarketParams marketParams;
    Id marketId;

    function setup() internal virtual override {
      // create morpho
      morpho = new Morpho(address(this));
      morpho.setFeeRecipient(address(this));

      // create collateral & loan tokens
      loanToken = new ERC20Mock();
      collateralToken = new ERC20Mock();

      // create oracle
      oracle = new OracleMock();
      oracle.setPrice(DEFAULT_ORACLE_PRICE);

      // create interest rate model
      irm = new IrmMock();
      morpho.enableIrm(address(irm));
      
      // create market
      morpho.enableLltv(DEFAULT_LLTV);
      marketParams = MarketParams(address(loanToken), address(collateralToken), address(oracle), address(irm), DEFAULT_LLTV);
      morpho.createMarket(marketParams);
      marketId = marketParams.id();

      // set token balances and give approval to morpho
      collateralToken.setBalance(SENDER_1, type(uint128).max);
      collateralToken.setBalance(SENDER_2, type(uint128).max);
      collateralToken.setBalance(SENDER_3, type(uint128).max);

      vm.prank(SENDER_1);
      collateralToken.approve(address(morpho), type(uint256).max);
      vm.prank(SENDER_2);
      collateralToken.approve(address(morpho), type(uint256).max);
      vm.prank(SENDER_3);
      collateralToken.approve(address(morpho), type(uint256).max);

      loanToken.setBalance(SENDER_1, type(uint128).max);
      loanToken.setBalance(SENDER_2, type(uint128).max);
      loanToken.setBalance(SENDER_3, type(uint128).max);

      vm.prank(SENDER_1);
      loanToken.approve(address(morpho), type(uint256).max);
      vm.prank(SENDER_2);
      loanToken.approve(address(morpho), type(uint256).max);
      vm.prank(SENDER_3);
      loanToken.approve(address(morpho), type(uint256).max);
    }
}
