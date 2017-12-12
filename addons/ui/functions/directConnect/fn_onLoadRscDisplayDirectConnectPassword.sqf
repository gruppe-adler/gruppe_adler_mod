#include "script_component.hpp"
#include "\x\grad\addons\ui\dialog\directConnectDefines.hpp"

params [["_display",displayNull]];

private _passwordCtrl = _display displayCtrl GRAD_DIRECTCONNECT_IDC_PASSWORD;
private _textCtrl = _display displayCtrl GRAD_DIRECTCONNECT_IDC_PASSWORDTEXT;

private _password = profileNamespace getVariable ["grad_ui_directConnectPassword",""];
private _lastConnectSuccessful = profileNamespace getVariable ["grad_ui_directConnectLastConnectSuccessful",false];

if (_password != "") then {
    _passwordCtrl ctrlSetText _password;
    _textCtrl ctrlSetText "Looks like your last connection attempt didn't work. Please check your password.";
} else {
    _textCtrl ctrlSetText "Looks like you are connecting for the first time. Please enter the password.";
};
