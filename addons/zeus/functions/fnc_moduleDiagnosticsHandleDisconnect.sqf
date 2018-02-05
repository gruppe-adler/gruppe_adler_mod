#include "script_component.hpp"

params ["","",["_playerUID","XXXXXXXXXXXXXXXX"]];

{
    _arr = missionNamespace [getVariable _x,[]];
    _arr deleteAt (_arr find _playerUID);
    publicVariable _x;

    nil
} count [QGVAR(usersPlayerFPS),QGVAR(usersObjectLocality)];

false
