// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function CryptoPunks$Abi() pure returns (Abi memory) {
    return Abi("CryptoPunks");
}
struct CryptoPunks$AcceptBidForPunkFunctionInputs {
    uint256 punkIndex;
    uint256 minPrice;
}

struct CryptoPunks$AllPunksAssignedFunctionOutputs {
    bool outArg0;
}

struct CryptoPunks$BalanceOfFunctionInputs {
    address outArg0;
}

struct CryptoPunks$BalanceOfFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunks$BuyPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunks$DecimalsFunctionOutputs {
    uint8 outArg0;
}

struct CryptoPunks$EnterBidForPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunks$GetPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunks$ImageHashFunctionOutputs {
    string outArg0;
}

struct CryptoPunks$NameFunctionOutputs {
    string outArg0;
}

struct CryptoPunks$NextPunkIndexToAssignFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunks$OfferPunkForSaleFunctionInputs {
    uint256 punkIndex;
    uint256 minSalePriceInWei;
}

struct CryptoPunks$OfferPunkForSaleToAddressFunctionInputs {
    uint256 punkIndex;
    uint256 minSalePriceInWei;
    address toAddress;
}

struct CryptoPunks$PendingWithdrawalsFunctionInputs {
    address outArg0;
}

struct CryptoPunks$PendingWithdrawalsFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunks$PunkBidsFunctionInputs {
    uint256 outArg0;
}

struct CryptoPunks$PunkBidsFunctionOutputs {
    bool hasBid;
    uint256 punkIndex;
    address bidder;
    uint256 value;
}

struct CryptoPunks$PunkIndexToAddressFunctionInputs {
    uint256 outArg0;
}

struct CryptoPunks$PunkIndexToAddressFunctionOutputs {
    address outArg0;
}

struct CryptoPunks$PunkNoLongerForSaleFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunks$PunksOfferedForSaleFunctionInputs {
    uint256 outArg0;
}

struct CryptoPunks$PunksOfferedForSaleFunctionOutputs {
    bool isForSale;
    uint256 punkIndex;
    address seller;
    uint256 minValue;
    address onlySellTo;
}

struct CryptoPunks$PunksRemainingToAssignFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunks$SetInitialOwnerFunctionInputs {
    address to;
    uint256 punkIndex;
}

struct CryptoPunks$SetInitialOwnersFunctionInputs {
    address[] addresses;
    uint256[] indices;
}

struct CryptoPunks$StandardFunctionOutputs {
    string outArg0;
}

struct CryptoPunks$SymbolFunctionOutputs {
    string outArg0;
}

struct CryptoPunks$TotalSupplyFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunks$TransferPunkFunctionInputs {
    address to;
    uint256 punkIndex;
}

struct CryptoPunks$WithdrawBidForPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunks$AssignEventParams {
    address to;
    uint256 punkIndex;
}

struct CryptoPunks$PunkBidEnteredEventParams {
    uint256 punkIndex;
    uint256 value;
    address fromAddress;
}

struct CryptoPunks$PunkBidWithdrawnEventParams {
    uint256 punkIndex;
    uint256 value;
    address fromAddress;
}

struct CryptoPunks$PunkBoughtEventParams {
    uint256 punkIndex;
    uint256 value;
    address fromAddress;
    address toAddress;
}

struct CryptoPunks$PunkNoLongerForSaleEventParams {
    uint256 punkIndex;
}

struct CryptoPunks$PunkOfferedEventParams {
    uint256 punkIndex;
    uint256 minValue;
    address toAddress;
}

struct CryptoPunks$PunkTransferEventParams {
    address from;
    address to;
    uint256 punkIndex;
}

struct CryptoPunks$TransferEventParams {
    address from;
    address to;
    uint256 value;
}

abstract contract CryptoPunks$OnAssignEvent {
    function onAssignEvent(EventContext memory ctx, CryptoPunks$AssignEventParams memory inputs) virtual external;

    function triggerOnAssignEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x8a0e37b73a0d9c82e205d4d1a3ff3d0b57ce5f4d7bccf6bac03336dc101cb7ba),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAssignEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkBidEnteredEvent {
    function onPunkBidEnteredEvent(EventContext memory ctx, CryptoPunks$PunkBidEnteredEventParams memory inputs) virtual external;

    function triggerOnPunkBidEnteredEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x5b859394fabae0c1ba88baffe67e751ab5248d2e879028b8c8d6897b0519f56a),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkBidEnteredEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkBidWithdrawnEvent {
    function onPunkBidWithdrawnEvent(EventContext memory ctx, CryptoPunks$PunkBidWithdrawnEventParams memory inputs) virtual external;

    function triggerOnPunkBidWithdrawnEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x6f30e1ee4d81dcc7a8a478577f65d2ed2edb120565960ac45fe7c50551c87932),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkBidWithdrawnEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkBoughtEvent {
    function onPunkBoughtEvent(EventContext memory ctx, CryptoPunks$PunkBoughtEventParams memory inputs) virtual external;

    function triggerOnPunkBoughtEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x58e5d5a525e3b40bc15abaa38b5882678db1ee68befd2f60bafe3a7fd06db9e3),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkBoughtEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkNoLongerForSaleEvent {
    function onPunkNoLongerForSaleEvent(EventContext memory ctx, CryptoPunks$PunkNoLongerForSaleEventParams memory inputs) virtual external;

    function triggerOnPunkNoLongerForSaleEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0xb0e0a660b4e50f26f0b7ce75c24655fc76cc66e3334a54ff410277229fa10bd4),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkNoLongerForSaleEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkOfferedEvent {
    function onPunkOfferedEvent(EventContext memory ctx, CryptoPunks$PunkOfferedEventParams memory inputs) virtual external;

    function triggerOnPunkOfferedEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x3c7b682d5da98001a9b8cbda6c647d2c63d698a4184fd1d55e2ce7b66f5d21eb),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkOfferedEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkTransferEvent {
    function onPunkTransferEvent(EventContext memory ctx, CryptoPunks$PunkTransferEventParams memory inputs) virtual external;

    function triggerOnPunkTransferEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0x05af636b70da6819000c49f85b21fa82081c632069bb626f30932034099107d8),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkTransferEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnTransferEvent {
    function onTransferEvent(EventContext memory ctx, CryptoPunks$TransferEventParams memory inputs) virtual external;

    function triggerOnTransferEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes32(0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferEvent.selector
        });
    }
}

abstract contract CryptoPunks$OnAcceptBidForPunkFunction {
    function onAcceptBidForPunkFunction(FunctionContext memory ctx, CryptoPunks$AcceptBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerOnAcceptBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x23165b75),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAcceptBidForPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreAcceptBidForPunkFunction {
    function preAcceptBidForPunkFunction(PreFunctionContext memory ctx, CryptoPunks$AcceptBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerPreAcceptBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x23165b75),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAcceptBidForPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnAllInitialOwnersAssignedFunction {
    function onAllInitialOwnersAssignedFunction(FunctionContext memory ctx) virtual external;

    function triggerOnAllInitialOwnersAssignedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x7ecedac9),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAllInitialOwnersAssignedFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreAllInitialOwnersAssignedFunction {
    function preAllInitialOwnersAssignedFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreAllInitialOwnersAssignedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x7ecedac9),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAllInitialOwnersAssignedFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnAllPunksAssignedFunction {
    function onAllPunksAssignedFunction(FunctionContext memory ctx, CryptoPunks$AllPunksAssignedFunctionOutputs memory outputs) virtual external;

    function triggerOnAllPunksAssignedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8126c38a),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAllPunksAssignedFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreAllPunksAssignedFunction {
    function preAllPunksAssignedFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreAllPunksAssignedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8126c38a),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAllPunksAssignedFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnBalanceOfFunction {
    function onBalanceOfFunction(FunctionContext memory ctx, CryptoPunks$BalanceOfFunctionInputs memory inputs, CryptoPunks$BalanceOfFunctionOutputs memory outputs) virtual external;

    function triggerOnBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBalanceOfFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreBalanceOfFunction {
    function preBalanceOfFunction(PreFunctionContext memory ctx, CryptoPunks$BalanceOfFunctionInputs memory inputs) virtual external;

    function triggerPreBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBalanceOfFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnBuyPunkFunction {
    function onBuyPunkFunction(FunctionContext memory ctx, CryptoPunks$BuyPunkFunctionInputs memory inputs) virtual external;

    function triggerOnBuyPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8264fe98),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBuyPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreBuyPunkFunction {
    function preBuyPunkFunction(PreFunctionContext memory ctx, CryptoPunks$BuyPunkFunctionInputs memory inputs) virtual external;

    function triggerPreBuyPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8264fe98),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBuyPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnDecimalsFunction {
    function onDecimalsFunction(FunctionContext memory ctx, CryptoPunks$DecimalsFunctionOutputs memory outputs) virtual external;

    function triggerOnDecimalsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x313ce567),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onDecimalsFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreDecimalsFunction {
    function preDecimalsFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreDecimalsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x313ce567),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preDecimalsFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnEnterBidForPunkFunction {
    function onEnterBidForPunkFunction(FunctionContext memory ctx, CryptoPunks$EnterBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerOnEnterBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x091dbfd2),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onEnterBidForPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreEnterBidForPunkFunction {
    function preEnterBidForPunkFunction(PreFunctionContext memory ctx, CryptoPunks$EnterBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerPreEnterBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x091dbfd2),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preEnterBidForPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnGetPunkFunction {
    function onGetPunkFunction(FunctionContext memory ctx, CryptoPunks$GetPunkFunctionInputs memory inputs) virtual external;

    function triggerOnGetPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc81d1d5b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onGetPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreGetPunkFunction {
    function preGetPunkFunction(PreFunctionContext memory ctx, CryptoPunks$GetPunkFunctionInputs memory inputs) virtual external;

    function triggerPreGetPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc81d1d5b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preGetPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnImageHashFunction {
    function onImageHashFunction(FunctionContext memory ctx, CryptoPunks$ImageHashFunctionOutputs memory outputs) virtual external;

    function triggerOnImageHashFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x51605d80),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onImageHashFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreImageHashFunction {
    function preImageHashFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreImageHashFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x51605d80),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preImageHashFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnNameFunction {
    function onNameFunction(FunctionContext memory ctx, CryptoPunks$NameFunctionOutputs memory outputs) virtual external;

    function triggerOnNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onNameFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreNameFunction {
    function preNameFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preNameFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnNextPunkIndexToAssignFunction {
    function onNextPunkIndexToAssignFunction(FunctionContext memory ctx, CryptoPunks$NextPunkIndexToAssignFunctionOutputs memory outputs) virtual external;

    function triggerOnNextPunkIndexToAssignFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x52f29a25),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onNextPunkIndexToAssignFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreNextPunkIndexToAssignFunction {
    function preNextPunkIndexToAssignFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreNextPunkIndexToAssignFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x52f29a25),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preNextPunkIndexToAssignFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnOfferPunkForSaleFunction {
    function onOfferPunkForSaleFunction(FunctionContext memory ctx, CryptoPunks$OfferPunkForSaleFunctionInputs memory inputs) virtual external;

    function triggerOnOfferPunkForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc44193c3),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOfferPunkForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreOfferPunkForSaleFunction {
    function preOfferPunkForSaleFunction(PreFunctionContext memory ctx, CryptoPunks$OfferPunkForSaleFunctionInputs memory inputs) virtual external;

    function triggerPreOfferPunkForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc44193c3),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOfferPunkForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnOfferPunkForSaleToAddressFunction {
    function onOfferPunkForSaleToAddressFunction(FunctionContext memory ctx, CryptoPunks$OfferPunkForSaleToAddressFunctionInputs memory inputs) virtual external;

    function triggerOnOfferPunkForSaleToAddressFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xbf31196f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOfferPunkForSaleToAddressFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreOfferPunkForSaleToAddressFunction {
    function preOfferPunkForSaleToAddressFunction(PreFunctionContext memory ctx, CryptoPunks$OfferPunkForSaleToAddressFunctionInputs memory inputs) virtual external;

    function triggerPreOfferPunkForSaleToAddressFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xbf31196f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOfferPunkForSaleToAddressFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPendingWithdrawalsFunction {
    function onPendingWithdrawalsFunction(FunctionContext memory ctx, CryptoPunks$PendingWithdrawalsFunctionInputs memory inputs, CryptoPunks$PendingWithdrawalsFunctionOutputs memory outputs) virtual external;

    function triggerOnPendingWithdrawalsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xf3f43703),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPendingWithdrawalsFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePendingWithdrawalsFunction {
    function prePendingWithdrawalsFunction(PreFunctionContext memory ctx, CryptoPunks$PendingWithdrawalsFunctionInputs memory inputs) virtual external;

    function triggerPrePendingWithdrawalsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xf3f43703),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePendingWithdrawalsFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkBidsFunction {
    function onPunkBidsFunction(FunctionContext memory ctx, CryptoPunks$PunkBidsFunctionInputs memory inputs, CryptoPunks$PunkBidsFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkBidsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x6e743fa9),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkBidsFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePunkBidsFunction {
    function prePunkBidsFunction(PreFunctionContext memory ctx, CryptoPunks$PunkBidsFunctionInputs memory inputs) virtual external;

    function triggerPrePunkBidsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x6e743fa9),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkBidsFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkIndexToAddressFunction {
    function onPunkIndexToAddressFunction(FunctionContext memory ctx, CryptoPunks$PunkIndexToAddressFunctionInputs memory inputs, CryptoPunks$PunkIndexToAddressFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkIndexToAddressFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x58178168),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkIndexToAddressFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePunkIndexToAddressFunction {
    function prePunkIndexToAddressFunction(PreFunctionContext memory ctx, CryptoPunks$PunkIndexToAddressFunctionInputs memory inputs) virtual external;

    function triggerPrePunkIndexToAddressFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x58178168),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkIndexToAddressFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPunkNoLongerForSaleFunction {
    function onPunkNoLongerForSaleFunction(FunctionContext memory ctx, CryptoPunks$PunkNoLongerForSaleFunctionInputs memory inputs) virtual external;

    function triggerOnPunkNoLongerForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xf6eeff1e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkNoLongerForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePunkNoLongerForSaleFunction {
    function prePunkNoLongerForSaleFunction(PreFunctionContext memory ctx, CryptoPunks$PunkNoLongerForSaleFunctionInputs memory inputs) virtual external;

    function triggerPrePunkNoLongerForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xf6eeff1e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkNoLongerForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPunksOfferedForSaleFunction {
    function onPunksOfferedForSaleFunction(FunctionContext memory ctx, CryptoPunks$PunksOfferedForSaleFunctionInputs memory inputs, CryptoPunks$PunksOfferedForSaleFunctionOutputs memory outputs) virtual external;

    function triggerOnPunksOfferedForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x088f11f3),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunksOfferedForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePunksOfferedForSaleFunction {
    function prePunksOfferedForSaleFunction(PreFunctionContext memory ctx, CryptoPunks$PunksOfferedForSaleFunctionInputs memory inputs) virtual external;

    function triggerPrePunksOfferedForSaleFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x088f11f3),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunksOfferedForSaleFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnPunksRemainingToAssignFunction {
    function onPunksRemainingToAssignFunction(FunctionContext memory ctx, CryptoPunks$PunksRemainingToAssignFunctionOutputs memory outputs) virtual external;

    function triggerOnPunksRemainingToAssignFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc0d6ce63),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunksRemainingToAssignFunction.selector
        });
    }
}

abstract contract CryptoPunks$PrePunksRemainingToAssignFunction {
    function prePunksRemainingToAssignFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPrePunksRemainingToAssignFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xc0d6ce63),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunksRemainingToAssignFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnSetInitialOwnerFunction {
    function onSetInitialOwnerFunction(FunctionContext memory ctx, CryptoPunks$SetInitialOwnerFunctionInputs memory inputs) virtual external;

    function triggerOnSetInitialOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xa75a9049),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetInitialOwnerFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreSetInitialOwnerFunction {
    function preSetInitialOwnerFunction(PreFunctionContext memory ctx, CryptoPunks$SetInitialOwnerFunctionInputs memory inputs) virtual external;

    function triggerPreSetInitialOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0xa75a9049),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetInitialOwnerFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnSetInitialOwnersFunction {
    function onSetInitialOwnersFunction(FunctionContext memory ctx, CryptoPunks$SetInitialOwnersFunctionInputs memory inputs) virtual external;

    function triggerOnSetInitialOwnersFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x39c5dde6),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetInitialOwnersFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreSetInitialOwnersFunction {
    function preSetInitialOwnersFunction(PreFunctionContext memory ctx, CryptoPunks$SetInitialOwnersFunctionInputs memory inputs) virtual external;

    function triggerPreSetInitialOwnersFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x39c5dde6),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetInitialOwnersFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnStandardFunction {
    function onStandardFunction(FunctionContext memory ctx, CryptoPunks$StandardFunctionOutputs memory outputs) virtual external;

    function triggerOnStandardFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x5a3b7e42),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onStandardFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreStandardFunction {
    function preStandardFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreStandardFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x5a3b7e42),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preStandardFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnSymbolFunction {
    function onSymbolFunction(FunctionContext memory ctx, CryptoPunks$SymbolFunctionOutputs memory outputs) virtual external;

    function triggerOnSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSymbolFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreSymbolFunction {
    function preSymbolFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSymbolFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnTotalSupplyFunction {
    function onTotalSupplyFunction(FunctionContext memory ctx, CryptoPunks$TotalSupplyFunctionOutputs memory outputs) virtual external;

    function triggerOnTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTotalSupplyFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreTotalSupplyFunction {
    function preTotalSupplyFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTotalSupplyFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnTransferPunkFunction {
    function onTransferPunkFunction(FunctionContext memory ctx, CryptoPunks$TransferPunkFunctionInputs memory inputs) virtual external;

    function triggerOnTransferPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8b72a2ec),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreTransferPunkFunction {
    function preTransferPunkFunction(PreFunctionContext memory ctx, CryptoPunks$TransferPunkFunctionInputs memory inputs) virtual external;

    function triggerPreTransferPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x8b72a2ec),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnWithdrawFunction {
    function onWithdrawFunction(FunctionContext memory ctx) virtual external;

    function triggerOnWithdrawFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x3ccfd60b),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onWithdrawFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreWithdrawFunction {
    function preWithdrawFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreWithdrawFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x3ccfd60b),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preWithdrawFunction.selector
        });
    }
}

abstract contract CryptoPunks$OnWithdrawBidForPunkFunction {
    function onWithdrawBidForPunkFunction(FunctionContext memory ctx, CryptoPunks$WithdrawBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerOnWithdrawBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x979bc638),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onWithdrawBidForPunkFunction.selector
        });
    }
}

abstract contract CryptoPunks$PreWithdrawBidForPunkFunction {
    function preWithdrawBidForPunkFunction(PreFunctionContext memory ctx, CryptoPunks$WithdrawBidForPunkFunctionInputs memory inputs) virtual external;

    function triggerPreWithdrawBidForPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunks",
            selector: bytes4(0x979bc638),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preWithdrawBidForPunkFunction.selector
        });
    }
}

contract CryptoPunks$EmitAllEvents is
  CryptoPunks$OnAssignEvent,
CryptoPunks$OnPunkBidEnteredEvent,
CryptoPunks$OnPunkBidWithdrawnEvent,
CryptoPunks$OnPunkBoughtEvent,
CryptoPunks$OnPunkNoLongerForSaleEvent,
CryptoPunks$OnPunkOfferedEvent,
CryptoPunks$OnPunkTransferEvent,
CryptoPunks$OnTransferEvent
{
  event Assign(address to, uint256 punkIndex);
event PunkBidEntered(uint256 punkIndex, uint256 value, address fromAddress);
event PunkBidWithdrawn(uint256 punkIndex, uint256 value, address fromAddress);
event PunkBought(uint256 punkIndex, uint256 value, address fromAddress, address toAddress);
event PunkNoLongerForSale(uint256 punkIndex);
event PunkOffered(uint256 punkIndex, uint256 minValue, address toAddress);
event PunkTransfer(address from, address to, uint256 punkIndex);
event Transfer(address from, address to, uint256 value);

  function onAssignEvent(EventContext memory ctx, CryptoPunks$AssignEventParams memory inputs) virtual external override {
    emit Assign(inputs.to, inputs.punkIndex);
  }
function onPunkBidEnteredEvent(EventContext memory ctx, CryptoPunks$PunkBidEnteredEventParams memory inputs) virtual external override {
    emit PunkBidEntered(inputs.punkIndex, inputs.value, inputs.fromAddress);
  }
function onPunkBidWithdrawnEvent(EventContext memory ctx, CryptoPunks$PunkBidWithdrawnEventParams memory inputs) virtual external override {
    emit PunkBidWithdrawn(inputs.punkIndex, inputs.value, inputs.fromAddress);
  }
function onPunkBoughtEvent(EventContext memory ctx, CryptoPunks$PunkBoughtEventParams memory inputs) virtual external override {
    emit PunkBought(inputs.punkIndex, inputs.value, inputs.fromAddress, inputs.toAddress);
  }
function onPunkNoLongerForSaleEvent(EventContext memory ctx, CryptoPunks$PunkNoLongerForSaleEventParams memory inputs) virtual external override {
    emit PunkNoLongerForSale(inputs.punkIndex);
  }
function onPunkOfferedEvent(EventContext memory ctx, CryptoPunks$PunkOfferedEventParams memory inputs) virtual external override {
    emit PunkOffered(inputs.punkIndex, inputs.minValue, inputs.toAddress);
  }
function onPunkTransferEvent(EventContext memory ctx, CryptoPunks$PunkTransferEventParams memory inputs) virtual external override {
    emit PunkTransfer(inputs.from, inputs.to, inputs.punkIndex);
  }
function onTransferEvent(EventContext memory ctx, CryptoPunks$TransferEventParams memory inputs) virtual external override {
    emit Transfer(inputs.from, inputs.to, inputs.value);
  }

  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](8);
    triggers[0] = this.triggerOnAssignEvent();
    triggers[1] = this.triggerOnPunkBidEnteredEvent();
    triggers[2] = this.triggerOnPunkBidWithdrawnEvent();
    triggers[3] = this.triggerOnPunkBoughtEvent();
    triggers[4] = this.triggerOnPunkNoLongerForSaleEvent();
    triggers[5] = this.triggerOnPunkOfferedEvent();
    triggers[6] = this.triggerOnPunkTransferEvent();
    triggers[7] = this.triggerOnTransferEvent();
    return triggers;
  }
}