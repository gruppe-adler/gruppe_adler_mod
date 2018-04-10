#include "script_component.hpp"

params ["_logic", "", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
deleteVehicle _logic;

[getAssignedCuratorLogic player] remoteExec [QFUNC(moduleAddPlayersToZeusServer),2,false];
