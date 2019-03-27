params ["_logs"];

private _loadout = getUnitLoadout player;
_logs pushBack "============================================================================";
_log pushBack format ["Bugged Player: %1, Unit: %2, Uniform: %3, UniformContainer: %4", player, typeOf player, uniform player, uniformContainer player];
_log pushBack format ["getUnitLoadout: %1", _loadout];

[player, _logs] remoteExecCall [QFUNC(logServer), 2];

if ((_loadout select 3 select 0) isEqualTo "") then {
    private _configPath = [] call GRAD_Loadout_fnc_getLoadoutConfigPath;
    private _loadoutConfig = [player, _configPath] call GRAD_Loadout_fnc_getUnitLoadoutFromConfig;
    _loadoutConfig = [_loadoutConfig, player] call GRAD_Loadout_fnc_ApplyRevivers;

    if (([_loadoutConfig] call CBA_fnc_hashSize) > 0) then {
        private _uniform = [_loadoutConfig, "uniform"] call CBA_fnc_hashGet;
        if !(_uniform isEqualTo "") then {
            private _uniformArray = (_loadout select 3);
            _uniformArray set [0, _uniform];
            _loadout set [3, _uniformArray];
        };
    };
}else{
    player setUnitLoadout _loadout;
};
