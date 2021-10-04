#include "script_component.hpp"

if (isServer) then {
    [QGVAR(fuseboxSwitched), FUNC(server_fuseboxSwitched)] call CBA_fnc_addEventHandler;
};
