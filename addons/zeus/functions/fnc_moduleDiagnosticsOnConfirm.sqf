#include "script_component.hpp"

params [["_playerFPS",false],["_medicalStatus",false],["_playerFreqs",false],["_objectLocality",false],["_aiStatus",false],["_summaryWindow",false]];


//compare to previous settings
GVAR(DiagnosticsSettings) params ["_oldPlayerFPS","_oldMedicalStatus","_oldPlayerFreqs","_oldObjectLocality","_oldAiStatus","_oldSummaryWindow"];
GVAR(DiagnosticsSettings) = +_this;


if ({_x} count GVAR(DiagnosticsSettings) > 0) then {[] call FUNC(moduleDiagnosticsRender)};


//update users
if (
    ((!_oldPlayerFPS && !_oldSummaryWindow) && (_playerFPS || _summaryWindow)) ||
    ((!_playerFPS && !_summaryWindow) && (_oldPlayerFPS || _oldSummaryWindow))
) then {
    [QGVAR(moduleDiagnosticsServerToggle),["playerFPS",getPlayerUID player,_playerFPS || _summaryWindow]] call CBA_fnc_serverEvent;
};

if (
    ((!_oldObjectLocality && !_oldSummaryWindow) && (_objectLocality || _summaryWindow)) ||
    ((!_objectLocality && !_summaryWindow) && (_oldObjectLocality || _oldSummaryWindow))
) then {
    [QGVAR(moduleDiagnosticsServerToggle),["objectLocality",getPlayerUID player,_objectLocality || _summaryWindow]] call CBA_fnc_serverEvent;
};


//toggle summary window
if !(_summaryWindow isEqualTo _oldSummaryWindow) then {
    [_summaryWindow] call FUNC(ui_moduleDiagnosticsActivateSummaryWindow);
    (uiNamespace getVariable [QGVAR(summaryWindowCtrlGrp),controlNull]) ctrlShow _summaryWindow;
};
