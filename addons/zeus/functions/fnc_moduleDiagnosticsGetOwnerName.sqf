#include "script_component.hpp"

params [["_id",-1]];

if (_id == 2) exitWith {"Server"};

private _ownerName = str _id;
{
    if (owner _x == _id) exitWith {
        _ownerName = name _x;
    };
    nil
} count allPlayers;

_ownerName
