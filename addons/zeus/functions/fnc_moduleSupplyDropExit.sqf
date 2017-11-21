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

if(!local _this) exitWith {};

private _crew = crew (vehicle _this);
deleteVehicle (vehicle _this);

{
    deleteVehicle _x;
} forEach _crew;
