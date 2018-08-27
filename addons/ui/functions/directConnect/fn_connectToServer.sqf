#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

#define UI_DIRECTCONNECTTIMEOUT        5

params [["_password",""], ["_port", [configFile >> QGVARMAIN(CfgConnectButton),"port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry")]];

GVAR(directConnectPassword) = _password;
profileNamespace setVariable [QGVAR(directConnectPassword),_password];
saveProfileNamespace;

INFO_1("Attempting direct connect to port %1", _port);

GVAR(directConnectPort) = _port;

onEachFrame {
    GVAR(directConnectStartTime) = diag_tickTime;

    _displayMain = findDisplay IDD_MAIN;
    _ctrlServerBrowser = _displayMain displayCtrl IDC_MAIN_MULTIPLAYER;
    ctrlActivate _ctrlServerBrowser;

    onEachFrame {
        ctrlActivate (findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_TAB_DIRECT_CONNECT);

        onEachFrame {
            _ctrlServerAddress = findDisplay IDD_IP_ADDRESS displayCtrl 2300;
            _ctrlServerAddress controlsGroupCtrl IDC_IP_ADDRESS ctrlSetText "arma.gruppe-adler.de";

            //does this even work? The input seems to always have "2302" as value
            _ctrlServerAddress controlsGroupCtrl IDC_IP_PORT ctrlSetText str GVAR(directConnectPort);

            ctrlActivate (_ctrlServerAddress controlsGroupCtrl IDC_OK);

            onEachFrame {
                _ctrlServerList = findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS;

                ([_ctrlServerList lbText 0,_ctrlServerList lbData 0]) call {
                    params [["_serverName",""],["_serverData",""]];

                    if (diag_tickTime > (GVAR(directConnectStartTime) + UI_DIRECTCONNECTTIMEOUT)) then {
                        ERROR_1("direct connect on port %1 timed out", GVAR(directConnectPort));
                        profileNamespace setVariable [QGVAR(directConnectLastConnectSuccessful),true];
                        saveProfileNamespace;
                        onEachFrame {};
                    };

                    INFO_1("Server Data: %1", _serverData);

                    if (_serverData isEqualTo format ["138.201.30.246:%1",GVAR(directConnectPort)]) then {
                        findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS lbSetCurSel 0;

                        onEachFrame {
                            ctrlActivate (findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_JOIN);

                            onEachFrame {
                                if (diag_tickTime > GVAR(directConnectStartTime) + UI_DIRECTCONNECTTIMEOUT) then {
                                    ERROR_1("direct connect on port %1 timed out", GVAR(directConnectPort));
                                    profileNamespace setVariable [QGVAR(directConnectLastConnectSuccessful),false];
                                    saveProfileNamespace;
                                    onEachFrame {};
                                };

                                if (!isNull findDisplay IDD_PASSWORD) then {
                                    private _ctrlPassword = findDisplay IDD_PASSWORD displayCtrl IDC_PASSWORD;
                                    _ctrlPassword ctrlSetTextColor [0,0,0,0];
                                    _ctrlPassword ctrlSetText GVAR(directConnectPassword);
                                    ctrlActivate (findDisplay IDD_PASSWORD displayCtrl IDC_OK);
                                };

                                if (getClientStateNumber >= 3) then {
                                    INFO_1("direct connect on port %1 successful", GVAR(directConnectPort));
                                    profileNamespace setVariable [QGVAR(directConnectLastConnectSuccessful),true];
                                    saveProfileNamespace;

                                    onEachFrame {};
                                };
                            };
                        };
                    };
                };
            };
        };
    }
};
