// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function CryptoPunksERC721$Abi() pure returns (Abi memory) {
    return Abi("CryptoPunksERC721");
}
struct CryptoPunksERC721$PunksDataFunctionOutputs {
    address outArg0;
}

struct CryptoPunksERC721$ApproveFunctionInputs {
    address account;
    uint256 id;
}

struct CryptoPunksERC721$BalanceOfFunctionInputs {
    address owner;
}

struct CryptoPunksERC721$BalanceOfFunctionOutputs {
    uint256 result;
}

struct CryptoPunksERC721$GetApprovedFunctionInputs {
    uint256 id;
}

struct CryptoPunksERC721$GetApprovedFunctionOutputs {
    address result;
}

struct CryptoPunksERC721$IsApprovedForAllFunctionInputs {
    address owner;
    address operator;
}

struct CryptoPunksERC721$IsApprovedForAllFunctionOutputs {
    bool result;
}

struct CryptoPunksERC721$LicensingTermsFunctionOutputs {
    string outArg0;
}

struct CryptoPunksERC721$MigrateLegacyWrappedPunksFunctionInputs {
    uint256[] punkIndexes;
}

struct CryptoPunksERC721$NameFunctionOutputs {
    string outArg0;
}

struct CryptoPunksERC721$OwnerOfFunctionInputs {
    uint256 id;
}

struct CryptoPunksERC721$OwnerOfFunctionOutputs {
    address result;
}

struct CryptoPunksERC721$PunkProxyForUserFunctionInputs {
    address user;
}

struct CryptoPunksERC721$PunkProxyForUserFunctionOutputs {
    address outArg0;
}

struct CryptoPunksERC721$RescuePunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunksERC721$SafeTransferFrom0x42842E0EFunctionInputs {
    address from;
    address to;
    uint256 id;
}

struct CryptoPunksERC721$SafeTransferFrom0xB88D4FDEFunctionInputs {
    address from;
    address to;
    uint256 id;
    bytes data;
}

struct CryptoPunksERC721$SetApprovalForAllFunctionInputs {
    address operator;
    bool isApproved;
}

struct CryptoPunksERC721$SupportsInterfaceFunctionInputs {
    bytes4 interfaceId;
}

struct CryptoPunksERC721$SupportsInterfaceFunctionOutputs {
    bool result;
}

struct CryptoPunksERC721$SymbolFunctionOutputs {
    string outArg0;
}

struct CryptoPunksERC721$TokenUriFunctionInputs {
    uint256 tokenId;
}

struct CryptoPunksERC721$TokenUriFunctionOutputs {
    string outArg0;
}

struct CryptoPunksERC721$TokensOfOwnerFunctionInputs {
    address owner;
}

struct CryptoPunksERC721$TokensOfOwnerFunctionOutputs {
    uint256[] outArg0;
}

struct CryptoPunksERC721$TotalSupplyFunctionOutputs {
    uint256 outArg0;
}

struct CryptoPunksERC721$TransferFromFunctionInputs {
    address from;
    address to;
    uint256 id;
}

struct CryptoPunksERC721$UnwrapPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunksERC721$UnwrapPunkBatchFunctionInputs {
    uint256[] punkIndexes;
}

struct CryptoPunksERC721$WrapPunkFunctionInputs {
    uint256 punkIndex;
}

struct CryptoPunksERC721$WrapPunkBatchFunctionInputs {
    uint256[] punkIndexes;
}

struct CryptoPunksERC721$ApprovalEventParams {
    address owner;
    address account;
    uint256 id;
}

struct CryptoPunksERC721$ApprovalForAllEventParams {
    address owner;
    address operator;
    bool isApproved;
}

struct CryptoPunksERC721$TransferEventParams {
    address from;
    address to;
    uint256 id;
}

abstract contract CryptoPunksERC721$OnApprovalEvent {
    function onApprovalEvent(EventContext memory ctx, CryptoPunksERC721$ApprovalEventParams memory inputs) virtual external;

    function triggerOnApprovalEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes32(0x8c5be1e5ebec7d5bd14f71427d1e84f3dd0314c0f7b2291e5b200ac8c7c3b925),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApprovalEvent.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnApprovalForAllEvent {
    function onApprovalForAllEvent(EventContext memory ctx, CryptoPunksERC721$ApprovalForAllEventParams memory inputs) virtual external;

    function triggerOnApprovalForAllEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes32(0x17307eab39ab6107e8899845ad3d59bd9653f200f220920489ca2b5937696c31),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApprovalForAllEvent.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnTransferEvent {
    function onTransferEvent(EventContext memory ctx, CryptoPunksERC721$TransferEventParams memory inputs) virtual external;

    function triggerOnTransferEvent() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes32(0xddf252ad1be2c89b69c2b068fc378daa952ba7f163c4a11628f55a4df523b3ef),
            triggerType: TriggerType.EVENT,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferEvent.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnPunksDataFunction {
    function onPunksDataFunction(FunctionContext memory ctx, CryptoPunksERC721$PunksDataFunctionOutputs memory outputs) virtual external;

    function triggerOnPunksDataFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x4ed9a045),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunksDataFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PrePunksDataFunction {
    function prePunksDataFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPrePunksDataFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x4ed9a045),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunksDataFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnApproveFunction {
    function onApproveFunction(FunctionContext memory ctx, CryptoPunksERC721$ApproveFunctionInputs memory inputs) virtual external;

    function triggerOnApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x095ea7b3),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onApproveFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreApproveFunction {
    function preApproveFunction(PreFunctionContext memory ctx, CryptoPunksERC721$ApproveFunctionInputs memory inputs) virtual external;

    function triggerPreApproveFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x095ea7b3),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preApproveFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnBalanceOfFunction {
    function onBalanceOfFunction(FunctionContext memory ctx, CryptoPunksERC721$BalanceOfFunctionInputs memory inputs, CryptoPunksERC721$BalanceOfFunctionOutputs memory outputs) virtual external;

    function triggerOnBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onBalanceOfFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreBalanceOfFunction {
    function preBalanceOfFunction(PreFunctionContext memory ctx, CryptoPunksERC721$BalanceOfFunctionInputs memory inputs) virtual external;

    function triggerPreBalanceOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x70a08231),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preBalanceOfFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnGetApprovedFunction {
    function onGetApprovedFunction(FunctionContext memory ctx, CryptoPunksERC721$GetApprovedFunctionInputs memory inputs, CryptoPunksERC721$GetApprovedFunctionOutputs memory outputs) virtual external;

    function triggerOnGetApprovedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x081812fc),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onGetApprovedFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreGetApprovedFunction {
    function preGetApprovedFunction(PreFunctionContext memory ctx, CryptoPunksERC721$GetApprovedFunctionInputs memory inputs) virtual external;

    function triggerPreGetApprovedFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x081812fc),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preGetApprovedFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnIsApprovedForAllFunction {
    function onIsApprovedForAllFunction(FunctionContext memory ctx, CryptoPunksERC721$IsApprovedForAllFunctionInputs memory inputs, CryptoPunksERC721$IsApprovedForAllFunctionOutputs memory outputs) virtual external;

    function triggerOnIsApprovedForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xe985e9c5),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onIsApprovedForAllFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreIsApprovedForAllFunction {
    function preIsApprovedForAllFunction(PreFunctionContext memory ctx, CryptoPunksERC721$IsApprovedForAllFunctionInputs memory inputs) virtual external;

    function triggerPreIsApprovedForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xe985e9c5),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preIsApprovedForAllFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnLicensingTermsFunction {
    function onLicensingTermsFunction(FunctionContext memory ctx, CryptoPunksERC721$LicensingTermsFunctionOutputs memory outputs) virtual external;

    function triggerOnLicensingTermsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xdf53b5c1),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onLicensingTermsFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreLicensingTermsFunction {
    function preLicensingTermsFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreLicensingTermsFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xdf53b5c1),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preLicensingTermsFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnMigrateLegacyWrappedPunksFunction {
    function onMigrateLegacyWrappedPunksFunction(FunctionContext memory ctx, CryptoPunksERC721$MigrateLegacyWrappedPunksFunctionInputs memory inputs) virtual external;

    function triggerOnMigrateLegacyWrappedPunksFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xa14aad90),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onMigrateLegacyWrappedPunksFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreMigrateLegacyWrappedPunksFunction {
    function preMigrateLegacyWrappedPunksFunction(PreFunctionContext memory ctx, CryptoPunksERC721$MigrateLegacyWrappedPunksFunctionInputs memory inputs) virtual external;

    function triggerPreMigrateLegacyWrappedPunksFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xa14aad90),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preMigrateLegacyWrappedPunksFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnNameFunction {
    function onNameFunction(FunctionContext memory ctx, CryptoPunksERC721$NameFunctionOutputs memory outputs) virtual external;

    function triggerOnNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onNameFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreNameFunction {
    function preNameFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreNameFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x06fdde03),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preNameFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnOwnerOfFunction {
    function onOwnerOfFunction(FunctionContext memory ctx, CryptoPunksERC721$OwnerOfFunctionInputs memory inputs, CryptoPunksERC721$OwnerOfFunctionOutputs memory outputs) virtual external;

    function triggerOnOwnerOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x6352211e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onOwnerOfFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreOwnerOfFunction {
    function preOwnerOfFunction(PreFunctionContext memory ctx, CryptoPunksERC721$OwnerOfFunctionInputs memory inputs) virtual external;

    function triggerPreOwnerOfFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x6352211e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preOwnerOfFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnPunkProxyForUserFunction {
    function onPunkProxyForUserFunction(FunctionContext memory ctx, CryptoPunksERC721$PunkProxyForUserFunctionInputs memory inputs, CryptoPunksERC721$PunkProxyForUserFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkProxyForUserFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x07f2a9b1),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkProxyForUserFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PrePunkProxyForUserFunction {
    function prePunkProxyForUserFunction(PreFunctionContext memory ctx, CryptoPunksERC721$PunkProxyForUserFunctionInputs memory inputs) virtual external;

    function triggerPrePunkProxyForUserFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x07f2a9b1),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkProxyForUserFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnRescuePunkFunction {
    function onRescuePunkFunction(FunctionContext memory ctx, CryptoPunksERC721$RescuePunkFunctionInputs memory inputs) virtual external;

    function triggerOnRescuePunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xcbc30702),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onRescuePunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreRescuePunkFunction {
    function preRescuePunkFunction(PreFunctionContext memory ctx, CryptoPunksERC721$RescuePunkFunctionInputs memory inputs) virtual external;

    function triggerPreRescuePunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xcbc30702),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preRescuePunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnSafeTransferFrom0x42842E0EFunction {
    function onSafeTransferFrom0x42842E0EFunction(FunctionContext memory ctx, CryptoPunksERC721$SafeTransferFrom0x42842E0EFunctionInputs memory inputs) virtual external;

    function triggerOnSafeTransferFrom0x42842E0EFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x42842e0e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSafeTransferFrom0x42842E0EFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreSafeTransferFrom0x42842E0EFunction {
    function preSafeTransferFrom0x42842E0EFunction(PreFunctionContext memory ctx, CryptoPunksERC721$SafeTransferFrom0x42842E0EFunctionInputs memory inputs) virtual external;

    function triggerPreSafeTransferFrom0x42842E0EFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x42842e0e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSafeTransferFrom0x42842E0EFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnSafeTransferFrom0xB88D4FDEFunction {
    function onSafeTransferFrom0xB88D4FDEFunction(FunctionContext memory ctx, CryptoPunksERC721$SafeTransferFrom0xB88D4FDEFunctionInputs memory inputs) virtual external;

    function triggerOnSafeTransferFrom0xB88D4FDEFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xb88d4fde),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSafeTransferFrom0xB88D4FDEFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreSafeTransferFrom0xB88D4FDEFunction {
    function preSafeTransferFrom0xB88D4FDEFunction(PreFunctionContext memory ctx, CryptoPunksERC721$SafeTransferFrom0xB88D4FDEFunctionInputs memory inputs) virtual external;

    function triggerPreSafeTransferFrom0xB88D4FDEFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xb88d4fde),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSafeTransferFrom0xB88D4FDEFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnSetApprovalForAllFunction {
    function onSetApprovalForAllFunction(FunctionContext memory ctx, CryptoPunksERC721$SetApprovalForAllFunctionInputs memory inputs) virtual external;

    function triggerOnSetApprovalForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xa22cb465),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetApprovalForAllFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreSetApprovalForAllFunction {
    function preSetApprovalForAllFunction(PreFunctionContext memory ctx, CryptoPunksERC721$SetApprovalForAllFunctionInputs memory inputs) virtual external;

    function triggerPreSetApprovalForAllFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xa22cb465),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetApprovalForAllFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnSupportsInterfaceFunction {
    function onSupportsInterfaceFunction(FunctionContext memory ctx, CryptoPunksERC721$SupportsInterfaceFunctionInputs memory inputs, CryptoPunksERC721$SupportsInterfaceFunctionOutputs memory outputs) virtual external;

    function triggerOnSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSupportsInterfaceFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreSupportsInterfaceFunction {
    function preSupportsInterfaceFunction(PreFunctionContext memory ctx, CryptoPunksERC721$SupportsInterfaceFunctionInputs memory inputs) virtual external;

    function triggerPreSupportsInterfaceFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x01ffc9a7),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSupportsInterfaceFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnSymbolFunction {
    function onSymbolFunction(FunctionContext memory ctx, CryptoPunksERC721$SymbolFunctionOutputs memory outputs) virtual external;

    function triggerOnSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSymbolFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreSymbolFunction {
    function preSymbolFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreSymbolFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x95d89b41),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSymbolFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnTokenUriFunction {
    function onTokenUriFunction(FunctionContext memory ctx, CryptoPunksERC721$TokenUriFunctionInputs memory inputs, CryptoPunksERC721$TokenUriFunctionOutputs memory outputs) virtual external;

    function triggerOnTokenUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xc87b56dd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokenUriFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreTokenUriFunction {
    function preTokenUriFunction(PreFunctionContext memory ctx, CryptoPunksERC721$TokenUriFunctionInputs memory inputs) virtual external;

    function triggerPreTokenUriFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xc87b56dd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokenUriFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnTokensOfOwnerFunction {
    function onTokensOfOwnerFunction(FunctionContext memory ctx, CryptoPunksERC721$TokensOfOwnerFunctionInputs memory inputs, CryptoPunksERC721$TokensOfOwnerFunctionOutputs memory outputs) virtual external;

    function triggerOnTokensOfOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x8462151c),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTokensOfOwnerFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreTokensOfOwnerFunction {
    function preTokensOfOwnerFunction(PreFunctionContext memory ctx, CryptoPunksERC721$TokensOfOwnerFunctionInputs memory inputs) virtual external;

    function triggerPreTokensOfOwnerFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x8462151c),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTokensOfOwnerFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnTotalSupplyFunction {
    function onTotalSupplyFunction(FunctionContext memory ctx, CryptoPunksERC721$TotalSupplyFunctionOutputs memory outputs) virtual external;

    function triggerOnTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTotalSupplyFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreTotalSupplyFunction {
    function preTotalSupplyFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreTotalSupplyFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x18160ddd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTotalSupplyFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnTransferFromFunction {
    function onTransferFromFunction(FunctionContext memory ctx, CryptoPunksERC721$TransferFromFunctionInputs memory inputs) virtual external;

    function triggerOnTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x23b872dd),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onTransferFromFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreTransferFromFunction {
    function preTransferFromFunction(PreFunctionContext memory ctx, CryptoPunksERC721$TransferFromFunctionInputs memory inputs) virtual external;

    function triggerPreTransferFromFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x23b872dd),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preTransferFromFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnUnwrapPunkFunction {
    function onUnwrapPunkFunction(FunctionContext memory ctx, CryptoPunksERC721$UnwrapPunkFunctionInputs memory inputs) virtual external;

    function triggerOnUnwrapPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x9f8f573f),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUnwrapPunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreUnwrapPunkFunction {
    function preUnwrapPunkFunction(PreFunctionContext memory ctx, CryptoPunksERC721$UnwrapPunkFunctionInputs memory inputs) virtual external;

    function triggerPreUnwrapPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x9f8f573f),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUnwrapPunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnUnwrapPunkBatchFunction {
    function onUnwrapPunkBatchFunction(FunctionContext memory ctx, CryptoPunksERC721$UnwrapPunkBatchFunctionInputs memory inputs) virtual external;

    function triggerOnUnwrapPunkBatchFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xe4a5016d),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onUnwrapPunkBatchFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreUnwrapPunkBatchFunction {
    function preUnwrapPunkBatchFunction(PreFunctionContext memory ctx, CryptoPunksERC721$UnwrapPunkBatchFunctionInputs memory inputs) virtual external;

    function triggerPreUnwrapPunkBatchFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0xe4a5016d),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preUnwrapPunkBatchFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnWrapPunkFunction {
    function onWrapPunkFunction(FunctionContext memory ctx, CryptoPunksERC721$WrapPunkFunctionInputs memory inputs) virtual external;

    function triggerOnWrapPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x90aaf2ff),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onWrapPunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreWrapPunkFunction {
    function preWrapPunkFunction(PreFunctionContext memory ctx, CryptoPunksERC721$WrapPunkFunctionInputs memory inputs) virtual external;

    function triggerPreWrapPunkFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x90aaf2ff),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preWrapPunkFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$OnWrapPunkBatchFunction {
    function onWrapPunkBatchFunction(FunctionContext memory ctx, CryptoPunksERC721$WrapPunkBatchFunctionInputs memory inputs) virtual external;

    function triggerOnWrapPunkBatchFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x9e88cf42),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onWrapPunkBatchFunction.selector
        });
    }
}

abstract contract CryptoPunksERC721$PreWrapPunkBatchFunction {
    function preWrapPunkBatchFunction(PreFunctionContext memory ctx, CryptoPunksERC721$WrapPunkBatchFunctionInputs memory inputs) virtual external;

    function triggerPreWrapPunkBatchFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksERC721",
            selector: bytes4(0x9e88cf42),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preWrapPunkBatchFunction.selector
        });
    }
}

contract CryptoPunksERC721$EmitAllEvents is
  CryptoPunksERC721$OnApprovalEvent,
CryptoPunksERC721$OnApprovalForAllEvent,
CryptoPunksERC721$OnTransferEvent
{
  event Approval(address owner, address account, uint256 id);
event ApprovalForAll(address owner, address operator, bool isApproved);
event Transfer(address from, address to, uint256 id);

  function onApprovalEvent(EventContext memory ctx, CryptoPunksERC721$ApprovalEventParams memory inputs) virtual external override {
    emit Approval(inputs.owner, inputs.account, inputs.id);
  }
function onApprovalForAllEvent(EventContext memory ctx, CryptoPunksERC721$ApprovalForAllEventParams memory inputs) virtual external override {
    emit ApprovalForAll(inputs.owner, inputs.operator, inputs.isApproved);
  }
function onTransferEvent(EventContext memory ctx, CryptoPunksERC721$TransferEventParams memory inputs) virtual external override {
    emit Transfer(inputs.from, inputs.to, inputs.id);
  }

  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](3);
    triggers[0] = this.triggerOnApprovalEvent();
    triggers[1] = this.triggerOnApprovalForAllEvent();
    triggers[2] = this.triggerOnTransferEvent();
    return triggers;
  }
}