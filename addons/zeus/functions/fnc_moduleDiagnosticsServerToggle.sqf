#include "script_component.hpp"

params [["_mode","UNKNOWN"],["_playerUID","XXXXXXXXXXXXXXXX"],["_toggleOn",false]];

if !(isServer) exitWith {};

private _fnc_addUser = {
    params ["_usersArray"];

    if (_toggleOn) then {
        _usersArray pushBackUnique _playerUID;
    } else {
        _usersArray deleteAt (_usersArray find _playerUID);
    };
};

private _fnc_modePlayerFPS = {
    [GVAR(usersPlayerFPS)] call _fnc_addUser;

    publicVariable QGVAR(usersPlayerFPS);
    [] call FUNC(moduleDiagnosticsUpdateFPS);
};

private _fnc_modeObjectLocality = {
    [GVAR(usersObjectLocality)] call _fnc_addUser;

    [] call FUNC(moduleDiagnosticsUpdateObjectLocality);
};

switch (_mode) do {
    case ("playerFPS"): _fnc_modePlayerFPS;
    case ("objectLocality"): _fnc_modeObjectLocality;
    default {ERROR_1("Unknown mode %1.",_mode)};
};
