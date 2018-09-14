#include "script_component.hpp"
#include "..\..\dialog\directConnectDefines.hpp"

params [["_buttonCtrl",controlNull]];

private _display = ctrlParent _buttonCtrl;
private _password = ctrlText (_display displayCtrl DIRECTCONNECT_IDC_PASSWORD);
private _port = uiNamespace getVariable [QGVAR(selectedPort),2302];

_display closeDisplay 1;

[_password,_port] call (uiNamespace getVariable QFUNC(connectToServer));
