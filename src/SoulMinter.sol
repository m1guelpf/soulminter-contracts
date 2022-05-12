// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract SoulMinter {
    error Soulbound();
    error AlreadyMinted();

    event Transfer(
        address indexed from,
        address indexed to,
        uint256 indexed id
    );

    string public constant symbol = "SOUL";
    string public constant name = "Soulbound NFT";
    address public immutable owner = msg.sender;

    mapping(uint256 => string) public tokenURI;
    mapping(uint256 => address) public ownerOf;
    mapping(address => uint256) public balanceOf;

    uint256 internal nextTokenId = 1;

    function approve(address, uint256) public virtual {
        revert Soulbound();
    }

    function isApprovedForAll(address, address) public virtual {
        revert Soulbound();
    }

    function getApproved(uint256) public virtual {
        revert Soulbound();
    }

    function setApprovalForAll(address, bool) public virtual {
        revert Soulbound();
    }

    function transferFrom(
        address,
        address,
        uint256
    ) public virtual {
        revert Soulbound();
    }

    function safeTransferFrom(
        address,
        address,
        uint256
    ) public virtual {
        revert Soulbound();
    }

    function safeTransferFrom(
        address,
        address,
        uint256,
        bytes calldata
    ) public virtual {
        revert Soulbound();
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        virtual
        returns (bool)
    {
        return
            interfaceId == 0x01ffc9a7 || // ERC165 Interface ID for ERC165
            interfaceId == 0x80ac58cd || // ERC165 Interface ID for ERC721
            interfaceId == 0x5b5e139f; // ERC165 Interface ID for ERC721Metadata
    }

    function mint(address to, string calldata ipfsHash) public {
        unchecked {
            balanceOf[to]++;
        }

        ownerOf[nextTokenId] = to;
        tokenURI[nextTokenId] = string.concat("ipfs://", ipfsHash);

        emit Transfer(address(0), to, nextTokenId++);
    }
}
