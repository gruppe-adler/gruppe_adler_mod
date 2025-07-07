#include "script_component.hpp"

#define ARMA_GRAD_IP "136.243.149.162"

params [["_port",2302]];

INFO_1("Attempting direct connect to port %1", _port);

private _passwordCache = profileNamespace getVariable ["cba_ui_ServerPasswords", []];
private _serverIndex = -1;
private _password = "wrong_password";   // force warning message if no stored password was found

if (count _passwordCache > 0) then {
    _serverIndex = (_passwordCache select 0) find format ["%1:%2", ARMA_GRAD_IP, _port];
};

if (_serverIndex >= 0) then {
    INFO("Using password in CBA cache");
    _password = (_passwordCache select 1) select _serverIndex;
};

connectToServer [ARMA_GRAD_IP, _port, _password];
