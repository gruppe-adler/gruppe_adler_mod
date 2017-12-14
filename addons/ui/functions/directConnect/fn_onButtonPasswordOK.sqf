#include "script_component.hpp"
#include "\x\grad\addons\ui\dialog\directConnectDefines.hpp"

params [["_buttonCtrl",controlNull]];

private _display = ctrlParent _buttonCtrl;
private _password = ctrlText (_display displayCtrl GRAD_DIRECTCONNECT_IDC_PASSWORD);

_display closeDisplay 1;

[_password] call (uiNamespace getVariable "grad_ui_fnc_connectToServer");
