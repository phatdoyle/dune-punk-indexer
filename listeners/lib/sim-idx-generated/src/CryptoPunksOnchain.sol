// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "lib/sim-idx-sol/src/Triggers.sol";
import "lib/sim-idx-sol/src/Context.sol";

function CryptoPunksOnchain$Abi() pure returns (Abi memory) {
    return Abi("CryptoPunksOnchain");
}
struct CryptoPunksOnchain$AddAssetFunctionInputs {
    uint8 index;
    bytes encoding;
    string name;
}

struct CryptoPunksOnchain$AddCompositesFunctionInputs {
    uint64 key1;
    uint32 value1;
    uint64 key2;
    uint32 value2;
    uint64 key3;
    uint32 value3;
    uint64 key4;
    uint32 value4;
}

struct CryptoPunksOnchain$AddPunksFunctionInputs {
    uint8 index;
    bytes _punks;
}

struct CryptoPunksOnchain$PunkAttributesFunctionInputs {
    uint16 index;
}

struct CryptoPunksOnchain$PunkAttributesFunctionOutputs {
    string text;
}

struct CryptoPunksOnchain$PunkImageFunctionInputs {
    uint16 index;
}

struct CryptoPunksOnchain$PunkImageFunctionOutputs {
    bytes outArg0;
}

struct CryptoPunksOnchain$PunkImageSvgFunctionInputs {
    uint16 index;
}

struct CryptoPunksOnchain$PunkImageSvgFunctionOutputs {
    string svg;
}

struct CryptoPunksOnchain$SetPaletteFunctionInputs {
    bytes _palette;
}

abstract contract CryptoPunksOnchain$OnAddAssetFunction {
    function onAddAssetFunction(FunctionContext memory ctx, CryptoPunksOnchain$AddAssetFunctionInputs memory inputs) virtual external;

    function triggerOnAddAssetFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0xdae2ae20),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAddAssetFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PreAddAssetFunction {
    function preAddAssetFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$AddAssetFunctionInputs memory inputs) virtual external;

    function triggerPreAddAssetFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0xdae2ae20),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAddAssetFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnAddCompositesFunction {
    function onAddCompositesFunction(FunctionContext memory ctx, CryptoPunksOnchain$AddCompositesFunctionInputs memory inputs) virtual external;

    function triggerOnAddCompositesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x6f2a6568),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAddCompositesFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PreAddCompositesFunction {
    function preAddCompositesFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$AddCompositesFunctionInputs memory inputs) virtual external;

    function triggerPreAddCompositesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x6f2a6568),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAddCompositesFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnAddPunksFunction {
    function onAddPunksFunction(FunctionContext memory ctx, CryptoPunksOnchain$AddPunksFunctionInputs memory inputs) virtual external;

    function triggerOnAddPunksFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x26b97364),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onAddPunksFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PreAddPunksFunction {
    function preAddPunksFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$AddPunksFunctionInputs memory inputs) virtual external;

    function triggerPreAddPunksFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x26b97364),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preAddPunksFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnPunkAttributesFunction {
    function onPunkAttributesFunction(FunctionContext memory ctx, CryptoPunksOnchain$PunkAttributesFunctionInputs memory inputs, CryptoPunksOnchain$PunkAttributesFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkAttributesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x76dfe297),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkAttributesFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PrePunkAttributesFunction {
    function prePunkAttributesFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$PunkAttributesFunctionInputs memory inputs) virtual external;

    function triggerPrePunkAttributesFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x76dfe297),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkAttributesFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnPunkImageFunction {
    function onPunkImageFunction(FunctionContext memory ctx, CryptoPunksOnchain$PunkImageFunctionInputs memory inputs, CryptoPunksOnchain$PunkImageFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkImageFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x3e5e0a96),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkImageFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PrePunkImageFunction {
    function prePunkImageFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$PunkImageFunctionInputs memory inputs) virtual external;

    function triggerPrePunkImageFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x3e5e0a96),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkImageFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnPunkImageSvgFunction {
    function onPunkImageSvgFunction(FunctionContext memory ctx, CryptoPunksOnchain$PunkImageSvgFunctionInputs memory inputs, CryptoPunksOnchain$PunkImageSvgFunctionOutputs memory outputs) virtual external;

    function triggerOnPunkImageSvgFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x74beb047),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onPunkImageSvgFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PrePunkImageSvgFunction {
    function prePunkImageSvgFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$PunkImageSvgFunctionInputs memory inputs) virtual external;

    function triggerPrePunkImageSvgFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x74beb047),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.prePunkImageSvgFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnSealContractFunction {
    function onSealContractFunction(FunctionContext memory ctx) virtual external;

    function triggerOnSealContractFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x68bd580e),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSealContractFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PreSealContractFunction {
    function preSealContractFunction(PreFunctionContext memory ctx) virtual external;

    function triggerPreSealContractFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x68bd580e),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSealContractFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$OnSetPaletteFunction {
    function onSetPaletteFunction(FunctionContext memory ctx, CryptoPunksOnchain$SetPaletteFunctionInputs memory inputs) virtual external;

    function triggerOnSetPaletteFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x844e2cd5),
            triggerType: TriggerType.FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.onSetPaletteFunction.selector
        });
    }
}

abstract contract CryptoPunksOnchain$PreSetPaletteFunction {
    function preSetPaletteFunction(PreFunctionContext memory ctx, CryptoPunksOnchain$SetPaletteFunctionInputs memory inputs) virtual external;

    function triggerPreSetPaletteFunction() view external returns (Trigger memory) {
        return Trigger({
            abiName: "CryptoPunksOnchain",
            selector: bytes4(0x844e2cd5),
            triggerType: TriggerType.PRE_FUNCTION,
            listenerCodehash: address(this).codehash,
            handlerSelector: this.preSetPaletteFunction.selector
        });
    }
}

contract CryptoPunksOnchain$EmitAllEvents {
  function allTriggers() view external returns (Trigger[] memory) {
    Trigger[] memory triggers = new Trigger[](0);

    return triggers;
  }
}