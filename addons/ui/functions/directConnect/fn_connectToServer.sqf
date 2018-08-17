#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

#define GRAD_UI_DIRECTCONNECTTIMEOUT        5

params [["_password",""]];

grad_ui_directConnectPassword = _password;
profileNamespace setVariable ["grad_ui_directConnectPassword",_password];
saveProfileNamespace;

grad_ui_directConnectPort = [configFile >> "GRAD_CfgConnectButton","port",2302] call (uiNamespace getVariable "BIS_fnc_returnConfigEntry");

onEachFrame {
    grad_ui_directConnectStartTime = diag_tickTime;

    _displayMain = findDisplay IDD_MAIN;
    _ctrlServerBrowser = _displayMain displayCtrl IDC_MAIN_MULTIPLAYER;
    ctrlActivate _ctrlServerBrowser;

    onEachFrame {
        ctrlActivate (findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_TAB_DIRECT_CONNECT);

        onEachFrame {
            _ctrlServerAddress = findDisplay IDD_IP_ADDRESS displayCtrl 2300;
            _ctrlServerAddress controlsGroupCtrl IDC_IP_ADDRESS ctrlSetText "arma.gruppe-adler.de";
            _ctrlServerAddress controlsGroupCtrl IDC_IP_PORT ctrlSetText str grad_ui_directConnectPort;
            ctrlActivate (_ctrlServerAddress controlsGroupCtrl IDC_OK);

            onEachFrame {
                _ctrlServerList = findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS;

                ([_ctrlServerList lbText 0,_ctrlServerList lbData 0]) call {
                    params [["_serverName",""],["_serverData",""]];

                    if (diag_tickTime > (grad_ui_directConnectStartTime + GRAD_UI_DIRECTCONNECTTIMEOUT)) then {
                        ERROR("direct connect timed out");
                        profileNamespace setVariable ["grad_ui_directConnectLastConnectSuccessful",true];
                        saveProfileNamespace;
                        onEachFrame {};
                    };

                    if (_serverData isEqualTo format ["138.201.30.246:%1",grad_ui_directConnectPort]) then {
                        findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS lbSetCurSel 0;

                        onEachFrame {
                            ctrlActivate (findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_JOIN);

                            onEachFrame {
                                if (diag_tickTime > grad_ui_directConnectStartTime + GRAD_UI_DIRECTCONNECTTIMEOUT) then {
                                    ERROR("direct connect timed out");
                                    profileNamespace setVariable ["grad_ui_directConnectLastConnectSuccessful",false];
                                    saveProfileNamespace;
                                    onEachFrame {};
                                };

                                if (!isNull findDisplay IDD_PASSWORD) then {
                                    private _ctrlPassword = findDisplay IDD_PASSWORD displayCtrl IDC_PASSWORD;
                                    _ctrlPassword ctrlSetTextColor [0,0,0,0];
                                    _ctrlPassword ctrlSetText grad_ui_directConnectPassword;
                                    ctrlActivate (findDisplay IDD_PASSWORD displayCtrl IDC_OK);
                                };

                                if (getClientStateNumber >= 3) then {
                                    INFO("direct connect successful");
                                    profileNamespace setVariable ["grad_ui_directConnectLastConnectSuccessful",true];
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
