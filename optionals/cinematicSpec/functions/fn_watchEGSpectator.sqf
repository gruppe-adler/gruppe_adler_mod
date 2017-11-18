#include "script_component.hpp"

[
    {
        (!isNull findDisplay IDD_RSCDISPLAYEGSPECTATOR)
    },
    {
        INFO("EG spec active, adding keydown handler...");
        (findDisplay IDD_RSCDISPLAYEGSPECTATOR) displayAddEventHandler ["KeyDown", {
            INFO("why hello! keydown in EG spec...");
            _this call FUNC(ui_eg_handleKeyDown);
        }];

        [
            {
                (isNull findDisplay IDD_RSCDISPLAYEGSPECTATOR)
            },
            {
                INFO("eg spectator seems to have finished. setting up watch...");
                [] call FUNC(watchEGSpectator);
            },
            []
        ] call CBA_fnc_waitUntilAndExecute;

    },
    []
] call CBA_fnc_waitUntilAndExecute;
