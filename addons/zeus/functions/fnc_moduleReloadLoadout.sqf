#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
deleteVehicle _logic;

private _error = switch (true) do {
    case (isNull _unit): {localize "str_a3_BIS_fnc_showCuratorFeedbackMessage_506"};
    case (!(_unit isKindOf "CAManBase")): {localize LSTRING(moduleReloadLoadoutError1)};
    case (!(isClass (missionConfigFile >> "CfgFunctions" >> "GRAD_Loadout"))): {localize LSTRING(moduleReloadLoadoutError2)};
    default {""};
};
if (_error != "") exitWith {[objNull,_error] call bis_fnc_showCuratorFeedbackMessage};

[_unit] remoteExec ["GRAD_Loadout_fnc_doLoadoutForUnit",_unit,false];

[objNull,format [localize LSTRING(moduleReloadLoadoutConfirm),name _unit]] call bis_fnc_showCuratorFeedbackMessage
