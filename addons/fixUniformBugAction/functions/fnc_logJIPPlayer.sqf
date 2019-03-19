params ["_logs"];

private _loadout = getUnitLoadout player;
_logs pushBack "============================================================================";
_log pushBack format ["Bugged Player: %1, Unit: %2, Uniform: %3, UniformContainer: %4", player, typeOf player, uniform player, uniformContainer player];
_log pushBack format ["getUnitLoadout: %1", _loadout];

[player, _logs] remoteExecCall [QFUNC(logServer), 2];
