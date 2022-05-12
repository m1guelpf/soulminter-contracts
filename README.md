# A barebones contract to easily mint Soulbound NFTs

> Mint non-transferrable NFTs in the most optimised way possible

This contracts implements the bare minimum ERC-721 functionality required to be picked up by marketplaces, and allows you to mint non-transferrable tokens to a specified address with IPFS-hosted metadata.

## Development

This repository uses the [Foundry](https://github.com/gakonst/foundry) smart contract toolkit. You can download the Foundry installer by running `curl -L https://foundry.paradigm.xyz | bash`, and then install the latest version by running `foundryup` on a new terminal window (additional instructions are available [on the Foundry repo](https://github.com/gakonst/foundry#installation)).

Once you have everything installed, you can run `make` from the base directory to install all dependencies and build the smart contracts.

## License

This project is open-sourced software licensed under the MIT license. See the [License file](LICENSE) for more information.
