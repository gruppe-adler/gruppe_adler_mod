#include "script_component.hpp"

LOG("postClientInit");

if (!hasInterface) exitWith {};

{
    private _interactPoint = ([_x >> "GRAD_AnimalTransport", "actionPoint", [0, 0, 0]] call BIS_fnc_returnConfigEntry);

    private _mainAction = [
        "ACE_MainActions",
        "Interactions",
        "",
        {},
        {true},
        {[]},
        [],
        _interactPoint
    ] call ace_interact_menu_fnc_createAction;

    [
        configName _x,
        0,
        [],
        _mainAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass;

    private _loadAction = [
        QGVAR(loadAction),
        "load on vehicle",
        "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa",
        FUNC(interact_loadAction),
        FUNC(interact_loadCondition),
        FUNC(interact_loadChildren),
        [],
        _interactPoint
    ] call ace_interact_menu_fnc_createAction;
    [
        configName _x,
        0,
        ["ACE_MainActions"],
        _loadAction,
        true
    ] call ace_interact_menu_fnc_addActionToClass;

} forEach ([] call FUNC(getSupportedAnimalConfigs));

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
} forEach ([] call FUNC(getSupportedCarConfigs));
