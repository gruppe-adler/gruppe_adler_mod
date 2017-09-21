#include "script_component.hpp"

params ["_sender","_message"];

if (!hasInterface) exitWith {};
if (!serverCommandAvailable "#kick" && isNull (getAssignedCuratorlogic player)) exitWith {};
if (profileName == _sender) exitWith {};


ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign format [localize "STR_grad_ADMINMESSAGES_RECEIVE_CHANNEL",_sender];

player customChat [ga_adminMessages_channel, _message];
player say2D "3DEN_notificationWarning";

ga_adminMessages_channel radioChannelRemove [player];
