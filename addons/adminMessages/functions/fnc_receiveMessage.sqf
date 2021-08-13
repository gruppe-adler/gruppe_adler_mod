#include "script_component.hpp"

params ["_sender","_UID","_message",["_receiveCondition",{[] call FUNC(isAdminOrZeus)}],["_receiveConditionParams",[]]];

if !(hasInterface) exitWith {};
if !(_receiveConditionParams call _receiveCondition) exitWith {};
if (profileName == _sender) exitWith {};

if (isNil QGVAR(latestConvos)) then {GVAR(latestConvos) = []};
if (GVAR(latestConvos) find [toUpper _sender,_UID] < 0) then {
    reverse GVAR(latestConvos);
    GVAR(latestConvos) pushBack [toUpper _sender,_UID];
    reverse GVAR(latestConvos);
};
if (count GVAR(latestConvos) > 5) then {GVAR(latestConvos) resize 5};

[_sender,_message] call FUNC(displayMessage);

playSound "3DEN_notificationWarning";
