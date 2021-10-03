params ["_target"];

[QGVAR(setBuildingMainSwitch), [GVAR(house), true]] call CBA_fnc_serverEvent;
[_building] call FUNC(fadeFuseboxHelper);