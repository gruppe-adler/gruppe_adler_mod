#include "script_component.hpp"

/*
    @Authors
        Christian 'chris5790' Klemm
    @Project
        Gruppe Adler Mod
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/

private _plane = (vehicle _this);
private _supplyBox = _plane getVariable [QGVAR(box), objNull];
if !(local _supplyBox) exitWith {};

[objNull, localize LSTRING(dropSuccessful)] call BIS_fnc_showCuratorFeedbackMessage;

private _exitWaypoint = (group _this) addWaypoint [[0,0,0], 0];
_exitWaypoint setWaypointType "MOVE";
_exitWaypoint setWaypointCompletionRadius 500;
_plane flyInHeight 1000;

_exitWaypoint setWaypointStatements ["true", QUOTE(this call FUNC(moduleSupplyDropExit))];

_plane setVehicleCargo objNull;

private _light = "Chemlight_blue" createVehicle [0,0,0];
_light attachTo [_para, [0,0,0]];

[{
    [
        {(getPosATL (_this select 0)) select 2 < 1.5},
        {
            params ["_box"];

            _box setVariable [QGVAR(supplyDropInProgress), nil, true];
            detach _box;
            if(local _box) then {
                _box allowDamage true;
            } else {
                [_box, true] remoteExecCall ["allowDamage", _box];
            };

            "SmokeShellBlue" createVehicle (position _box);
        },
        _this
    ] call CBA_fnc_waitUntilAndExecute;
}, [_supplyBox], 3] call CBA_fnc_waitAndExecute;
