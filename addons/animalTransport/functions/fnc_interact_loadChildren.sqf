#include "script_component.hpp"

params ["_target"];

private _spaces = [_target] call FUNC(findSuitableVehicles);
([_spaces] call CBA_fnc_hashKeys) apply {
    private _vehicle = _x;
    private _vehicleSpaces = [_spaces, _vehicle] call CBA_fnc_hashGet;

    _vehicleAction = [
        format ["GRAD_animalTransport_loadAction_%1", _vehicle],
        ([_vehicle] call FUNC(vehicleName)),
        ([typeOf _vehicle] call ace_common_fnc_getVehicleIcon),
        {
            params ["_target", "", "_params"];
            _params params ["_vehicle"];

            [QGVAR(vehicle_loadAnimal), [_vehicle, _target], _vehicle] call CBA_fnc_targetEvent;
        },
        {params ["", "", "_args"]; _args params ["","_vehicleSpaces"]; _vehicleSpaces > 0},
        FUNC(interact_loadChildrenSpaces),
        [_vehicle, count _vehicleSpaces]
    ] call ace_interact_menu_fnc_createAction;

    [
        _vehicleAction,
        [],
        _target
    ]
};
