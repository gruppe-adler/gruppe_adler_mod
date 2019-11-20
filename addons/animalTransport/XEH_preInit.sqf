#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

private _settingsGroup = "GRAD Animal Transport";

[
    QGVAR(loadingRange),
    "SLIDER",
    "Maximal distance from which an animal may be loaded onto a vehicle",
    _settingsGroup,
    [2, 25, 5, 1]
] call CBA_settings_fnc_init;

[
    QGVAR(unloadSpeed),
    "SLIDER",
    "The rate at which animals may be unloaded from vehicles",
    _settingsGroup,
    [0.1, 10, 1, 1]
] call CBA_settings_fnc_init;

GVAR(stoppedAnimals) = [];


ADDON = true;
