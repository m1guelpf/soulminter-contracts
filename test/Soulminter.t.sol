// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {SoulMinter} from "../src/SoulMinter.sol";

contract User {}

contract ContractTest is Test {
    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed id
    );

    User user;
    SoulMinter minter;

    function setUp() public {
        user = new User();
        minter = new SoulMinter();
    }

    function testDeployerIsOwner() public {
        assertEq(minter.owner(), address(this));
    }

    function testCanMint() public {
        assertEq(minter.ownerOf(1), address(0));
        assertEq(minter.balanceOf(address(user)), 0);

        vm.expectEmit(true, true, true, true);
        emit Transfer(address(0), address(user), 1);
        minter.mint(address(user), "test");

        assertEq(minter.ownerOf(1), address(user));
        assertEq(minter.balanceOf(address(user)), 1);
        assertEq(minter.tokenURI(1), "test");
    }

    function testCannotTransfer() public {
        minter.mint(address(user), "test");

        assertEq(minter.ownerOf(1), address(user));

        vm.expectRevert(SoulMinter.Soulbound.selector);
        minter.transferFrom(address(user), address(this), 1);

        vm.expectRevert(SoulMinter.Soulbound.selector);
        minter.safeTransferFrom(address(user), address(this), 1);

        vm.expectRevert(SoulMinter.Soulbound.selector);
        minter.approve(address(this), type(uint256).max);

        assertEq(minter.ownerOf(1), address(user));
    }

    function testERC721Constants() public {
        assertEq(minter.name(), "Soulbound NFT");
        assertEq(minter.symbol(), "SOUL");
    }

    function testSupportsInterface() public {
        assertTrue(minter.supportsInterface(0x01ffc9a7));
        assertTrue(minter.supportsInterface(0x80ac58cd));
        assertTrue(minter.supportsInterface(0x5b5e139f));
    }
}
