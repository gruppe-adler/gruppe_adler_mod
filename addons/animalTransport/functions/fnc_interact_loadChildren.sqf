#include "script_component.hpp"

params ["_target"];

private _spaces = [_target] call FUNC(findSuitableVehicles);
([_spaces] call CBA_fnc_hashKeys) apply {
    private _vehicle = _x;
    private _vehicleSpaces = [_spaces, _vehicle] call CBA_fnc_hashGet;
    _vehicleAction = [
        format ["GRAD_animalTransport_loadAction_%1", _forEachIndex],
        format ["load onto %1", _vehicle],
        "",
        {
            params ["_target", "", "_params"];
            _params params ["_vehicle"];

            [QGVAR(vehicle_loadAnimal), [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
        },
        {true},
        {[]},
        [_vehicle]
    ] call ace_interact_menu_fnc_createAction;
    _spaceActions = _vehicleSpaces apply {
        private _spaceName = configName _x;
        [
            format ["GRAD_animalTransport_loadAction_%1_%2", _forEachIndex, _spaceName],
            _spaceName,
            "",
            {
                params ["_target", "", "_params"];
                _params params ["_vehicle", "_spaceName"];
                [QGVAR(vehicle_loadAnimal), [_vehicle, _target, _spaceName], _vehicle] call CBA_fnc_targetEvent;
            },
            {true},
            {[]},
            [_vehicle, _spaceName]
        ] call ace_interact_menu_fnc_createAction;
    };
    [
        _vehicleAction,
        _spaceActions apply {
            [
                _x,
                [],
                _target
            ]
        },
        _target
    ]
};
