#include "script_component.hpp"

params [
    ["_vehicle", objNull]
];

/*
    the following logic has been ripped from https://github.com/acemod/ACE3/blob/master/addons/interact_menu/functions/fnc_createVehiclesActions.sqf
    which we sadly cannot use due to its lack of support for childActions
*/

private _vehicleType = typeOf _vehicle;
private _vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleType >> "displayName");
private _ownerName = [_vehicle, true] call ace_common_fnc_getName;
if ("" != _ownerName) then {
    _vehicleName = format ["%1 (%2)", _vehicleName, _ownerName];
};

_vehicleName
