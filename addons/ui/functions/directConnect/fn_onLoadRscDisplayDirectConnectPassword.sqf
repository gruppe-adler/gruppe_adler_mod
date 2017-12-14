#include "script_component.hpp"
#include "\x\grad\addons\ui\dialog\directConnectDefines.hpp"

params [["_display",displayNull]];

private _passwordCtrl = _display displayCtrl GRAD_DIRECTCONNECT_IDC_PASSWORD;
private _textCtrl = _display displayCtrl GRAD_DIRECTCONNECT_IDC_PASSWORDTEXT;

private _password = profileNamespace getVariable ["grad_ui_directConnectPassword",""];
private _lastConnectSuccessful = profileNamespace getVariable ["grad_ui_directConnectLastConnectSuccessful",false];

if (_password != "") then {
    _passwordCtrl ctrlSetText _password;
    _textCtrl ctrlSetText (localize "STR_GRAD_UI_DIRECTCONNECTPASSWORDTEXTFAIL");
} else {
    _textCtrl ctrlSetText (localize "STR_GRAD_UI_DIRECTCONNECTPASSWORDTEXTFIRST");
};
