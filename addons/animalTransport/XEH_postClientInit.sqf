#include "script_component.hpp"

LOG("postClientInit");

if (!hasInterface) exitWith {};

{
    private _unloadActionPoint = ([_x >> "GRAD_AnimalTransport", "unloadActionPoint", [0, 0, 0]] call BIS_fnc_returnConfigEntry);
    private _positionedUnloadAction = [
        QGVAR(unloadAction),
        "unload animals",
        "",
        FUNC(interact_unloadAction),
        FUNC(interact_unloadCondition),
        FUNC(interact_unloadChildren),
        [],
        _unloadActionPoint,
        2.5
    ] call ace_interact_menu_fnc_createAction;

    [
        configName _x,
        0,
        [],
        _positionedUnloadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass;
} forEach ([] call FUNC(getSupportedContainerConfigs));
