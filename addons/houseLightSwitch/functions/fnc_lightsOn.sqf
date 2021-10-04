params ["_target"];

[QGVAR(fuseboxSwitched), [_target, true]] call CBA_fnc_serverEvent;
