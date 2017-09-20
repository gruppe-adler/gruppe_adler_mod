#include "script_component.hpp"
SCRIPT(XEH_preInit);

grad_versionCheck_versions = [[],""] call CBA_fnc_hashCreate;

private _cfgPatches = (configFile >> "CfgPatches");
for [{_i=0},{_i<(count _cfgPatches)-1},{_i=_i+1}] do {
    _addonClass = _cfgPatches select _i;
    _addonName = configName _addonClass;
    if (_addonName find "A3" != 0) then {
        _vNo = [_addonClass] call grad_versionCheck_fnc_getVersionNo;
        if (_vNo != "") then {
            [grad_versionCheck_versions,_addonName,_vNo] call CBA_fnc_hashSet;
        };
    };
};


[
    "grad_versionCheck_setting_kickOnVersionMismatch",
    "CHECKBOX",
    "Kick if client has version mismatch",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;

[
    "grad_versionCheck_setting_kickOnMissingClient",
    "CHECKBOX",
    "Kick if client is missing addon",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;

[
    "grad_versionCheck_setting_kickOnMissingServer",
    "CHECKBOX",
    "Kick if client loaded additional addon",
    "GRAD Version Check",
    true,
    1
] call CBA_settings_fnc_init;
