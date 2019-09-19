#include "script_component.hpp"

params ["_sender","_UID","_message",["_receiveCondition",{[] call grad_adminMessages_fnc_isAdminOrZeus}],["_receiveConditionParams",[]]];

if !(hasInterface) exitWith {};
if !(_receiveConditionParams call _receiveCondition) exitWith {};
if (profileName == _sender) exitWith {};

if (isNil "grad_adminMessages_latestConvos") then {grad_adminMessages_latestConvos = []};
if (grad_adminMessages_latestConvos find [toUpper _sender,_UID] < 0) then {
    reverse grad_adminMessages_latestConvos;
    grad_adminMessages_latestConvos pushBack [toUpper _sender,_UID];
    reverse grad_adminMessages_latestConvos;
};
if (count grad_adminMessages_latestConvos > 5) then {grad_adminMessages_latestConvos resize 5};

[_sender,_message] call FUNC(displayMessage);

playSound "3DEN_notificationWarning";
