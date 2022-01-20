#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object", objnull];
deleteVehicle _logic;

if (isNull _unit) then {
    private _current = missionNamespace getVariable ["ace_map_BFT_Enabled", false];
    ace_map_BFT_Enabled = !_current;

    [objNull, format [localize LSTRING(moduleToggleBFTResult), [localize LSTRING(moduleToggleBFTResultOn), localize LSTRING(moduleToggleBFTResultOff)] select _current]] call bis_fnc_showCuratorFeedbackMessage;
} else {
    private _grp = group _unit;

    private _error = switch (true) do {
        case (isNull _unit) : {localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_506"};
        case (isNull _grp || !(side _grp in [east, west, resistance, civilian])) : {localize LSTRING(moduleToggleBFTError1)};
        default {""};
    };
    if (_error != "") exitWith {[objNull, _error] call bis_fnc_showCuratorFeedbackMessage};

    private _current = _grp getVariable ["ACE_map_hideBlueForceMarker", false];
    _grp setVariable ["ACE_map_hideBlueForceMarker", !_current, true];

    [objNull, format [localize LSTRING(moduleToggleBFTGroupResult), _grp, [localize LSTRING(moduleToggleBFTResultOn), localize LSTRING(moduleToggleBFTResultOff)] select !_current]] call bis_fnc_showCuratorFeedbackMessage;
};