#include "script_component.hpp"

params [["_playerFPS",false],["_objectLocality",false]];


if !(GVAR(DiagnosticsSettings) isEqualTo _this) then {[] call FUNC(moduleDiagnosticsRender)};
GVAR(DiagnosticsSettings) params ["_oldPlayerFPS","_oldObjectLocality"];
GVAR(DiagnosticsSettings) = +_this;


if !(_playerFPS isEqualTo _oldPlayerFPS) then {
    [QGVAR(moduleDiagnosticsServerToggle),["playerFPS",getPlayerUID player,_playerFPS]] call CBA_fnc_serverEvent;
};

if !(_objectLocality isEqualTo _oldObjectLocality) then {
    [QGVAR(moduleDiagnosticsServerToggle),["objectLocality",getPlayerUID player,_objectLocality]] call CBA_fnc_serverEvent;
};
