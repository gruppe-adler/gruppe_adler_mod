#include "script_component.hpp"

{
    [
        {
            params ["_unit"];

            (("" == (uniform _unit)) || {isNull (uniformContainer _unit)})
        },
        {
            params ["_unit"];

            [] remoteExecCall [QFUNC(resetUniform), _unit];
        },
        [_x],
        60,
        {}
    ] call CBA_fnc_waitUntilAndExecute;
}forEach allPlayers;
