//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {

    //max number of whitelisted addresses allowed
    uint256 public maxWhitelistedAddresses;

    //Create a mapping of whitelisted addresses
    // if an address is whitelisted, we set it true, it is false by default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many addresses are whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted addresses
    // user will put the value at the time of deployment
    constructor(uint256 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    //Add address of the sender to the whitelist
    function addAddressToWhitelist() public {
        // check if the address is already whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the number of whitelisted addresses is less than the max number of whitelisted addresses
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
        // Add the address that called the function to the whitelistedAddresses array
        whitelistedAddresses[msg.sender] = true;
        // increase the number of whitelisted addresses
        numAddressesWhitelisted++;
    }
}