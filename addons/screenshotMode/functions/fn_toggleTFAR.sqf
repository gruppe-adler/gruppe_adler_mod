#include "script_component.hpp"

private _tfarEnabled = !(isNil "TFAR_VolumeHudTransparency");
private _newState = param [0, true];

if (!_tfarEnabled) exitWith {};

if (_newState) then {
    TFAR_VolumeHudTransparency = GVAR(tfar);
    {call TFAR_fnc_updateSpeakVolumeUI} call CBA_fnc_directCall;
} else {
    GVAR(tfar) = TFAR_VolumeHudTransparency;
    TFAR_VolumeHudTransparency = 1;
    {call TFAR_fnc_updateSpeakVolumeUI} call CBA_fnc_directCall;
};
