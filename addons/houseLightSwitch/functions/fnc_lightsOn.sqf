#include "script_component.hpp"

params [
	["_fusebox", objNull, [objNull]]
];

[QGVAR(fuseboxSwitched), [_fusebox, true]] call CBA_fnc_serverEvent;
