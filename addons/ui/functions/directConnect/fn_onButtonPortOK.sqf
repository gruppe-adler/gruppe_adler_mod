#include "script_component.hpp"
#include "..\..\dialog\directConnectDefines.hpp"

params [["_buttonCtrl",controlNull]];

private _display = ctrlParent _buttonCtrl;
private _port = ctrlText (_display displayCtrl DIRECTCONNECT_IDC_PASSWORD);

_display closeDisplay 1;

// game will crash if port dialog is still open when next dialog is created
[parseNumber _port] spawn {
    uiSleep 0.5;
    _this call (uiNamespace getVariable QFUNC(onButtonConnect));
};
