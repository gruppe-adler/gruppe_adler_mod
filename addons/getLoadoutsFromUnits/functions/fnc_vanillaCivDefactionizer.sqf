#include "script_component.hpp"

params ["_unit"];

private _faction = faction _unit;
private _type = typeOf _unit;
private _result = "";

if (_faction != "CIV_F") exitWith {""};

_type select [2];