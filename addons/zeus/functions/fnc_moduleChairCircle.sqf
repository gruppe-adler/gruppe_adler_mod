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

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _position = position _logic;
deleteVehicle _logic;

private _count = count (playableUnits + switchableUnits);

["Land_CampingChair_V1_F", _position, _count] call FUNC(moduleChairCircleCreate);