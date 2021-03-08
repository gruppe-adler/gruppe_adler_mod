#include "script_component.hpp"

params ["_initiator"];

{
    [
        {
            params ["_unit"];

            (("" == (uniform _unit)) || {isNull (uniformContainer _unit)})
        },
        {
            params ["_unit", "_initiator"];
            INFO_2("forcing uniform reset on %1 (check initiated by %2)", _unit, _initiator);
            [_unit] remoteExecCall [QFUNC(resetUniform), _unit];
        },
        [_x, _initiator],
        60,
        {}
    ] call CBA_fnc_waitUntilAndExecute;
}forEach allPlayers;
