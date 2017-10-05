#include "script_component.hpp"

private _varNames = [
    "ACE_spectator_camera",
    "ACE_spectator_freeCamera",
    "ACE_spectator_unitCamera"
];
private _cam = objNull;

{
    _cam = missionNamespace getVariable [_x, objNull];
    if (!isNull _cam) exitWith {_cam};
} forEach _varNames;

_cam
