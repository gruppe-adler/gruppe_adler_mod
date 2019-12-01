#include "script_component.hpp"

{
    [
        {
            params ["_unit"];
            
            ((isNil (uniform _unit)) || {isNil (uniformContainer _unit)})
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
