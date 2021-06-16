#include "..\script_component.hpp"

params [
    ["_class", configNull, [configNull]]
];

private _version = [_class, "version", ""] call BIS_fnc_returnConfigEntry;
if (_version isEqualType 0) then {
    _version = str _version
};

_version
