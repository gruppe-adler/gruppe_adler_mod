#include "script_component.hpp"

params ["_target", "", "_params"];
_params params ["_vehicle"];

private _spaces = [_vehicle, typeOf _target] call FUNC(findSuitableSpaces);
_spaces apply {
    private _spaceName = configName _x;
    [
        format ["GRAD_animalTransport_loadAction_%1_%2", _vehicle, _spaceName],
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
} apply {
    [_x, [], _target]
};
