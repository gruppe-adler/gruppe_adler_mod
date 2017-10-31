#include "script_component.hpp"

params ["_sender","_message",["_receiveCondition",{[] call grad_adminMessages_fnc_isAdminOrZeus}],["_receiveConditionParams",[]]];

if !(hasInterface) exitWith {};
if !(_receiveConditionParams call _receiveCondition) exitWith {};
if (profileName == _sender) exitWith {};


ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign format [localize "STR_grad_ADMINMESSAGES_RECEIVE_CHANNEL",_sender];

player customChat [ga_adminMessages_channel, _message];
player say2D "3DEN_notificationWarning";

ga_adminMessages_channel radioChannelRemove [player];
