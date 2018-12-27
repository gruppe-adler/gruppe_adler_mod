#include "script_component.hpp"
#include "..\ui\defines.hpp"

GVAR(helpEnabled) = !(missionNamespace getVariable [QGVAR(helpEnabled),false]);

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlHelp = _display displayCtrl IDC_HELP;

private _ctrlHelpPos = ctrlPosition _ctrlHelp;
_ctrlHelpPos set [3,[1 * Y_FACTOR,22.2 * Y_FACTOR] select GVAR(helpEnabled)];
_ctrlHelp ctrlSetPosition _ctrlHelpPos;
_ctrlHelp ctrlCommit 0.5;
