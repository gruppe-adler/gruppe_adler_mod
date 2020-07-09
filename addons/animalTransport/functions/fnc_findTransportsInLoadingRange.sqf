#include "script_component.hpp"
#define CONTAINER_SIZE_BUFFER 20
/* return transport vehicles with a (un)loading point close enough to the passed animal */

params [
    ["_animal", objNull]
];

private _possibleVehicleClasses = [] call FUNC(getSupportedContainerConfigs); // configured vehicle classes
private _possibleVehicleClassNames = _possibleVehicleClasses apply { configName _x};
(nearestObjects [_animal, _possibleVehicleClassNames, GVAR(loadingRange) + CONTAINER_SIZE_BUFFER, false]) select {
    private _unloadPoint = [
        [_x] call FUNC(getCustomConfig),
        "unloadPoint",
        [0, 0, 0]
    ] call BIS_fnc_returnConfigEntry;

    private _unloadPointWorld = (_x vectorModelToWorld _unloadPoint) vectorAdd (getPos _x);

    (_animal distance _unloadPointWorld) < GVAR(loadingRange);
}
