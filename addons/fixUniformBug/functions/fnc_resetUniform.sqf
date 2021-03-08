#include "script_component.hpp"

params ["_unit"];

private _loadout = getUnitLoadout _unit;

if ((_loadout select 3 select 0) isEqualTo "") then {
    private _configPath = [] call GRAD_Loadout_fnc_getLoadoutConfigPath;
    private _loadoutConfig = [_unit, _configPath] call GRAD_Loadout_fnc_getUnitLoadoutFromConfig;
    _loadoutConfig = [_loadoutConfig, _unit] call GRAD_Loadout_fnc_ApplyRevivers;

    if (([_loadoutConfig] call CBA_fnc_hashSize) > 0) then {
        private _uniform = [_loadoutConfig, "uniform"] call CBA_fnc_hashGet;
        if !(_uniform isEqualTo "") then {
            private _uniformArray = (_loadout select 3);
            _uniformArray set [0, _uniform];
            _loadout set [3, _uniformArray];
        };
    };
};

_unit setUnitLoadout _loadout;

