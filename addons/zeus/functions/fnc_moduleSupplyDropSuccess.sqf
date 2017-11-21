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
#include "script_component.hpp"

private _supplyBox = (vehicle _this) getVariable [QGVAR(box), objNull];
if !(local _supplyBox) exitWith {};

[objNull, "Abwurf erfolgreich"] call BIS_fnc_showCuratorFeedbackMessage;

private _exitWaypoint = (group _this) addWaypoint [[0,0,0], 0];
_exitWaypoint setWaypointType "MOVE";
_exitWaypoint setWaypointCompletionRadius 500;
(vehicle _this) flyInHeight 1000;

_exitWaypoint setWaypointStatements ["true", QUOTE(this call FUNC(moduleSupplyDropExit))];

private _bbr = boundingBoxReal (vehicle _this);
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _dropPos = (vehicle _this) modelToWorld [_maxWidth + 10 ,0,0];

private _light = "Chemlight_blue" createVehicle [0,0,0];
private _para = createVehicle ["B_Parachute_02_F", [0,0,0], [], 0, "NONE"];
_para setPosASL _dropPos;
_supplyBox attachTo [_para, [0,0,0]];
_light attachTo [_para, [0,0,0]];

[{
    [
        {(getPosATL (_this select 0)) select 2 < 1.5},
        {
            params ["_box"];

            INFO_1("moduleSupplyDropSuccess L49, _box: %1",_box);

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
},[_supplyBox],3] call CBA_fnc_waitAndExecute;
