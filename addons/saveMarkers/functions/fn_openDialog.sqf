#include "script_component.hpp"

private _canOpen = switch (true) do {
    case (IS_ADMIN): {true};
    case (GVAR(setting_canBeOpened) == 2): {true};
    case (GVAR(setting_canBeOpened) == 1 && {(missionNamespace getVariable ["CBA_missionTime",0]) < 600}): {true};
    default {false};
};

if (!_canOpen) exitWith {
    playSound "3DEN_notificationWarning";
    systemChat "GRAD saveMarkers is currently disabled by the mission. Log in as admin to use.";
};

[] call FUNC(loadDisplay);
