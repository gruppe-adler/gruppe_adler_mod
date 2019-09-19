#include "script_component.hpp"

private _radioSW = call TFAR_fnc_activeSwRadio;
if (!(isNil "_radioSW") && {!(_radioSW isEqualTo "")} && {(player getVariable [QGVAR(freqSW), -1]) isEqualTo -1})  then {

    private _radioChannelSW = _radioSW call TFAR_fnc_getSwChannel;
    if (!(isNil "_radioChannelSW") && {!(_radioChannelSW isEqualTo -1)}) then {
        player setVariable [QGVAR(channelSW), _radioChannelSW, true];
        player setVariable [QGVAR(freqSW), [_radioSW, (_radioChannelSW +1)] call TFAR_fnc_getChannelFrequency, true];
    };

    private _radioAdditionalChannelSW = _radioSW call TFAR_fnc_getAdditionalSwChannel;
    if (!(isNil "_radioAdditionalChannelSW") && {!(_radioAdditionalChannelSW isEqualTo -1)}) then {
        player setVariable [QGVAR(channelAdditionalSW), _radioAdditionalChannelSW, true];
        player setVariable [QGVAR(freqAdditionalSW), [_radioSW, (_radioAdditionalChannelSW +1)] call TFAR_fnc_getChannelFrequency, true];
    };
};

private _radioLR = call TFAR_fnc_activeLRRadio;
if (!(isNil "_radioLR") && {!(_radioSW isEqualTo "")} && {(player getVariable [QGVAR(freqLR), -1]) isEqualTo -1}) then {

    private _radioChannelLR = _radioLR call TFAR_fnc_getLrChannel;
    if (!(isNil "_radioChannelLR") && {!(_radioChannelLR isEqualTo -1)}) then {
        player setVariable [QGVAR(channelLR), _radioChannelLR, true];
        player setVariable [QGVAR(freqLR), [_radioLR, (_radioChannelLR +1)] call TFAR_fnc_getChannelFrequency, true];
    };

    private _radioAdditionalChannelLR = _radioLR call TFAR_fnc_getAdditionalLrChannel;
    if (!(isNil "_radioAdditionalChannelLR") && {!(_radioAdditionalChannelLR isEqualTo -1)}) then {
        player setVariable [QGVAR(channelAdditionalLR), _radioAdditionalChannelLR, true];
        player setVariable [QGVAR(freqAdditionalLR), [_radioLR, (_radioAdditionalChannelLR +1)] call TFAR_fnc_getChannelFrequency, true];
    };
};
