#include "script_component.hpp"
#include "..\..\dialog\directConnectDefines.hpp"

params [["_buttonCtrl",controlNull]];

private _display = ctrlParent _buttonCtrl;
private _port = ctrlText (_display displayCtrl DIRECTCONNECT_IDC_PASSWORD);

_display closeDisplay 1;

[parseNumber _port] call (uiNamespace getVariable QFUNC(onButtonConnect));
