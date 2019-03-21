#include "script_component.hpp"

private _radioSW = call TFAR_fnc_activeSwRadio;
if (!(isNil "_radioSW") && {!(_radioSW isEqualTo "")} && {(player getVariable [QGVAR(freqSW), -1]) isEqualTo -1})  then {
    player setVariable [QGVAR(channelSW), 0, true];
    player setVariable [QGVAR(freqSW), [_radioSW, 1] call TFAR_fnc_getChannelFrequency, true];
};

private _radioLR = call TFAR_fnc_activeLRRadio;
if (!(isNil "_radioLR") && {!(_radioSW isEqualTo "")} && {(player getVariable [QGVAR(freqLR), -1]) isEqualTo -1}) then {
    player setVariable [QGVAR(channelLR), 0, true];
    player setVariable [QGVAR(freqLR), [_radioLR, 1] call TFAR_fnc_getChannelFrequency, true];
};
