#include "script_component.hpp"

params [["_playerFPS",false],["_medicalStatus",false],["_objectLocality",false],["_aiStatus",false]];


if ({_x} count GVAR(DiagnosticsSettings) > 0) then {[] call FUNC(moduleDiagnosticsRender)};
GVAR(DiagnosticsSettings) params ["_oldPlayerFPS","_oldMedicalStatus","_oldObjectLocality","_oldAiStatus"];
GVAR(DiagnosticsSettings) = +_this;


if !(_playerFPS isEqualTo _oldPlayerFPS) then {
    [QGVAR(moduleDiagnosticsServerToggle),["playerFPS",getPlayerUID player,_playerFPS]] call CBA_fnc_serverEvent;
};

if !(_objectLocality isEqualTo _oldObjectLocality) then {
    [QGVAR(moduleDiagnosticsServerToggle),["objectLocality",getPlayerUID player,_objectLocality]] call CBA_fnc_serverEvent;
};
