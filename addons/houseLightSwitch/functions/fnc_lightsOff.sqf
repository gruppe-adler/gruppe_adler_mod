#include "script_component.hpp"

params [
	["_fusebox", objNull, [objNull]]
];

[QGVAR(fuseboxSwitched), [_fusebox, false]] call CBA_fnc_serverEvent;
