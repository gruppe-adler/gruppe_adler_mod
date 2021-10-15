#include "script_component.hpp"
#include "\A3\Ui_f\hpp\defineResincl.inc"

#define UI_DIRECTCONNECTTIMEOUT        5

params [["_port",2302]];

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

            _ctrlServerAddress controlsGroupCtrl IDC_IP_PORT ctrlSetText str GVAR(directConnectPort);

            ctrlActivate (_ctrlServerAddress controlsGroupCtrl IDC_OK);

            onEachFrame {
                _ctrlServerList = findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS;

                _exit = for "_i" from 0 to ((lbSize _ctrlServerList) - 1) do {
                    ([_ctrlServerList lbText _i,_ctrlServerList lbData _i]) call {
                        params [["_serverName",""],["_serverData",""]];

                        if (diag_tickTime > (GVAR(directConnectStartTime) + UI_DIRECTCONNECTTIMEOUT)) exitWith {
                            ERROR_1("direct connect on port %1 timed out", GVAR(directConnectPort));
                            onEachFrame {};
                            true
                        };

                        if (_serverData isEqualTo format ["136.243.149.162:%1",GVAR(directConnectPort)]) exitWith {
                            findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_SESSIONS lbSetCurSel _i;

                            onEachFrame {
                                ctrlActivate (findDisplay IDD_MULTIPLAYER displayCtrl IDC_MULTI_JOIN);

                                onEachFrame {
                                    if (diag_tickTime > GVAR(directConnectStartTime) + UI_DIRECTCONNECTTIMEOUT) then {
                                        ERROR_1("direct connect on port %1 timed out", GVAR(directConnectPort));
                                        onEachFrame {};
                                    };

                                    if (!isNull findDisplay IDD_PASSWORD) then {
                                        private _display = findDisplay IDD_PASSWORD;
                                        private _passwordEditBoxCtrl = _display displayCtrl IDC_PASSWORD;

                                        // no password saved by CBA --> abort here so user can enter password
                                        if (!isNull _passwordEditBoxCtrl && {ctrlText _passwordEditBoxCtrl == ""}) exitWith {
                                            onEachFrame {};
                                        };

                                        ctrlActivate (_display displayCtrl IDC_OK);
                                    };

                                    if (getClientStateNumber >= 3) then {
                                        INFO_1("direct connect on port %1 successful", GVAR(directConnectPort));
                                        onEachFrame {};
                                    };
                                };
                            };

                            true
                        };

                        false
                    };

                    if (_exit) exitWith {};
                };
            };
        };
    }
};
