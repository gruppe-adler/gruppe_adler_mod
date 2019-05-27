#include "script_component.hpp"

params [["_curatorLogic",objNull]];

if (isNull _curatorLogic) exitWith {};

_curatorLogic addCuratorEditableObjects [allPlayers - entities "HeadlessClient_F",false];
