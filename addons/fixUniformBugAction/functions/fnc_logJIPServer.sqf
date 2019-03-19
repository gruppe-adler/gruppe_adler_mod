params ["_initiator"];
{
    [
        {
            params ["_unit"];
            ((isNil (uniform _unit)) || {isNil (uniformContainer _unit)})
        },
        {
            params ["_unit", "_initiator"];


            private _log = [format ["Initiator: %1", _initiator]];
            [_log] remoteExecCall [QFUNC(logJIPPlayer), _this select 0];
        },
        [_unit, _initiator],
        60,
        {}
    ] call CBA_fnc_waitUntilAndExecute;
}forEach allPlayers;
