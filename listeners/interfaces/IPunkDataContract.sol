pragma solidity ^0.8.13;

interface IPunkDataContract {
    function punkAttributes(uint16 index) external view returns (string memory);
    function punkImage(uint16 index) external view returns (bytes memory);
    function punkImageSvg(uint16 index) external view returns (string memory);
}