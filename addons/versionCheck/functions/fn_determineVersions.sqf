#include "..\script_component.hpp"

GVAR(versions) = [[],nil] call CBA_fnc_hashCreate;

{
    _x params ["_name", "_version", "_isPatched"];
    _name = toLower _name;
    if (_name find "a3" != 0) then {
        [GVAR(versions), _name, [_version, _isPatched]] call CBA_fnc_hashSet;
    };
} forEach allAddonsInfo;