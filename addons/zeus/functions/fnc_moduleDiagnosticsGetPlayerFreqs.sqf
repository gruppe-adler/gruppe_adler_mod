#include "script_component.hpp"

params [["_unit",objNull]];

private _freqs = [];

private _activeSWRadio = call TFAR_fnc_ActiveSwRadio;
if (!isNil "_activeSWRadio") then {
    private _mainFreq = [_activeSWRadio,(_activeSWRadio call TFAR_fnc_getSwChannel) + 1] call TFAR_fnc_getChannelFrequency;
    private _altFreq = [_activeSWRadio,(_activeSWRadio call TFAR_fnc_getAdditionalSwChannel) + 1] call TFAR_fnc_getChannelFrequency;

    if (_altFreq == "") then {
        _freqs pushBack format ["SR %1 Hz",_mainFreq];
    } else {
        _freqs pushBack format ["SR %1 Hz / %2 Hz",_mainFreq,_altFreq];
    };
};

private _activeLRRadio = call TFAR_fnc_activeLRRadio;
if (!isNil "_activeLRRadio") then {
    private _mainFreq = [_activeLRRadio,(_activeLRRadio call TFAR_fnc_getLrChannel) + 1] call TFAR_fnc_getChannelFrequency;
    private _altFreq = [_activeLRRadio,(_activeLRRadio call TFAR_fnc_getAdditionalLrChannel) + 1] call TFAR_fnc_getChannelFrequency;

    if (_altFreq == "") then {
        _freqs pushBack format ["LR %1 Hz",_mainFreq];
    } else {
        _freqs pushBack format ["LR %1 Hz / %2 Hz",_mainFreq,_altFreq];
    };
};

_freqs
