#include "script_component.hpp"

/* return transport vehicles with a (un)loading point close enough to the passed animal */

params [
    ["_animal", objNull]
];

private _possibleVehicleClasses = [] call FUNC(getSupportedCarConfigs); // configured vehicle classes
private _possibleVehicleClassNames = _possibleVehicleClasses apply { configName _x};
(nearestObjects [_animal, _possibleVehicleClassNames, GVAR(loadingRange) + 10, false]) select {
    private _unloadPoint = [
        [_x] call FUNC(getCustomConfig),
        "unloadPoint",
        [0, 0, 0]
    ] call BIS_fnc_returnConfigEntry;

    _animal distance (_unloadPoint vectorAdd (getPos _x)) < GVAR(loadingRange);
}
