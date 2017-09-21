#include "..\script_component.hpp"

params ["_class"];

private _version = "";

_version = [_class,"version",""] call BIS_fnc_returnConfigEntry;
if (_version isEqualType 0) then {_version = str _version};

_version
