#include "script_component.hpp"

[
    {
        !isNull(["GetDisplay"] call BIS_fnc_EGSpectator);
    },
    {
        INFO("EndGame spec active, adding keydown handler...");
        (["GetDisplay"] call BIS_fnc_EGSpectator) displayAddEventHandler ["KeyDown", {
            _this call FUNC(ui_eg_handleKeyDown);
        }];

        [
            {
                isNull (["GetDisplay"] call BIS_fnc_EGSpectator)
            },
            {
                INFO("EndGame spectator seems to have finished. setting up watch...");
                [] call FUNC(watchEGSpectator);
            },
            []
        ] call CBA_fnc_waitUntilAndExecute;

    },
    []
] call CBA_fnc_waitUntilAndExecute;
