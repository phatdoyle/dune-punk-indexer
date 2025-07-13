// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "sim-idx-sol/Simidx.sol";
import "sim-idx-generated/Generated.sol";
import {IPunkDataContract} from "../interfaces/IPunkDataContract.sol";

contract Triggers is BaseTriggers {

    address constant CRYPTOPUNKS = 0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB;
    address constant PUNKS_IMAGES_ONCHAIN = 0x16F5A35647D6F03D5D3da7b35409D65ba03aF3B2;

    function triggers() external virtual override {
        Listener listener = new Listener();
        addTrigger(chainContract(Chains.Ethereum, CRYPTOPUNKS), listener.triggerOnAssignEvent());
        addTrigger(chainContract(Chains.Ethereum, CRYPTOPUNKS), listener.triggerOnPunkTransferEvent());
        addTrigger(chainContract(Chains.Ethereum, CRYPTOPUNKS), listener.triggerOnPunkOfferedEvent());
        addTrigger(chainContract(Chains.Ethereum, CRYPTOPUNKS), listener.triggerOnPunkBoughtEvent());
        addTrigger(chainContract(Chains.Ethereum, PUNKS_IMAGES_ONCHAIN), listener.triggerOnAddPunksFunction());
    }
}

/// Index calls to the UniswapV3Factory.createPool function on Ethereum
/// To trigger on more function calls, specify that this listener should implement that interface and follow the compiler errors.
contract Listener is 
CryptoPunks$OnPunkOfferedEvent, 
CryptoPunks$OnPunkBoughtEvent,
CryptoPunks$OnPunkTransferEvent,
CryptoPunks$OnAssignEvent, 
CryptoPunksOnchain$OnAddPunksFunction
 {
    address constant CRYPTOPUNKS = 0xb47e3cd837dDF8e4c57F05d70Ab865de6e193BBB;
    address constant PUNKS_IMAGES_ONCHAIN = 0x16F5A35647D6F03D5D3da7b35409D65ba03aF3B2;
    ///Get All Offers
    event PunkOffered(uint256 block_timestamp, bytes32 txn_hash,  uint256 block_number, uint256 punkIndex, uint256 minValue, address toAddress);

    ///Get All Claims
    event PunkClaimed(uint256 block_timestamp, bytes32 txn_hash,  uint256 block_number, uint256 punkIndex, address toAddress);

    ///Get All Sales
    event PunkBought(uint256 block_timestamp, bytes32 txn_hash,  uint256 block_number, uint256 punkIndex, uint256 value, address fromAddress, address toAddress);

    ///Get all Punk Transfers
    event PunkTransfer(uint256 block_timestamp, bytes32 txn_hash,  uint256 block_number, uint256 punkIndex, address fromAddress, address toAddress);
    ///Get All Svg and Attributes
    event punkSvgAndAttributes(uint256 punkIndex, string svg, string attributes);
    event PunkAdded(uint256 block_timestamp, bytes32 txn_hash,  uint256 block_number, uint256 punkIndex, bytes punkBytes);


    ///EVENT HANDLERS
    function onPunkOfferedEvent(EventContext memory ctx, CryptoPunks$PunkOfferedEventParams memory inputs) external override {
        emit PunkOffered(uint256(block.timestamp), ctx.txn.hash, block.number, inputs.punkIndex, inputs.minValue, inputs.toAddress);
    }

    function onPunkTransferEvent(EventContext memory ctx, CryptoPunks$PunkTransferEventParams memory inputs) external override {
        emit PunkTransfer(uint256(block.timestamp), ctx.txn.hash, block.number, inputs.punkIndex, inputs.from, inputs.to);
    }

    function onPunkBoughtEvent(EventContext memory ctx, CryptoPunks$PunkBoughtEventParams memory inputs) external override {
        emit PunkBought(uint256(block.timestamp), ctx.txn.hash, block.number, inputs.punkIndex, inputs.value, inputs.fromAddress, inputs.toAddress);
    }

    function onAssignEvent(EventContext memory ctx, CryptoPunks$AssignEventParams memory inputs) external override {

        emit PunkClaimed(uint256(block.timestamp), ctx.txn.hash, block.number, inputs.punkIndex, inputs.to);
    
    }

    function onAddPunksFunction(FunctionContext memory ctx, CryptoPunksOnchain$AddPunksFunctionInputs memory inputs) external override {
        emit PunkAdded(uint256(block.timestamp), ctx.txn.hash, block.number, inputs.index, inputs._punks);
        
        // Get SVG from the punk data contract
        IPunkDataContract punkData = IPunkDataContract(PUNKS_IMAGES_ONCHAIN);
        string memory svg = punkData.punkImageSvg(inputs.index);
        string memory attributes = punkData.punkAttributes(inputs.index);
        emit punkSvgAndAttributes(inputs.index, svg, attributes);
    }

  
}

