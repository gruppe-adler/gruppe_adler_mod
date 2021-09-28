#include "script_component.hpp"

if (isServer) then {
    [QGVAR(setBuildingMainSwitch),FUNC(server_setBuildingMainSwitch)] call CBA_fnc_addEventHandler;
};
