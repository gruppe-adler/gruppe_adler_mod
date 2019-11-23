#include "script_component.hpp"

params ["_target"];

private _animals = (_target getVariable [QGVAR(animals), ([] call cba_fnc_hashCreate)]);
([_animals] call cba_fnc_hashSize) > 0
