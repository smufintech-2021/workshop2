// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;


// https://github.com/ethereum/EIPs/issues/2571


abstract contract ERC2571_Guidelines {
    
    function getPublisherFeeRate() public view returns (uint256);
​
    function getCreator(uint256 tokenId) public view returns (address payable);
​
    function getCreatorFeeRate(uint256 tokenId) public view returns (uint256);
​
    function getTradeExpires(bytes32 tradeHash) public view returns (uint256);
​
    function getTradePrices(bytes32 tradeHash) public view returns (uint256);
​
    function setPublisherFeeRate(uint256 feeRate) external;
​
    function setCreator(uint256 tokenId, address payable creator) public;
​
    function setCreatorFeeRate(uint256 tokenId, uint256 feeRate) external;
​
    function readyForSale(address buyer, uint256 tokenId, uint256 price, uint256 expireBlockNumber) external;
​
    function cancelTradeOrder(address buyer, uint256 tokenId) external;
​
    function tradeAndDistributeFees(address payable seller, uint256 tokenId) external payable;
}