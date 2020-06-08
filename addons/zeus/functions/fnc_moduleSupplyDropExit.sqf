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

if(!local _this) exitWith {};

private _crew = crew (vehicle _this);
deleteVehicle (vehicle _this);

{
    deleteVehicle _x;
} forEach _crew;
