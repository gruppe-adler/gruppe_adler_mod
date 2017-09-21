#include "script_component.hpp"

private _editBox = uiNamespace getVariable ["grad_adminMessages_sendBoxCtrl",controlNull];

if (isNull _editBox) exitWith {};

private _message = ctrlText _editBox;
if (_message == "") exitWith {};

_editBox ctrlSetText "";

ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign localize "STR_GA_ADMINMESSAGES_SENDCONFIRM_CHANNEL";

player customChat [ga_adminMessages_channel, localize "STR_GA_ADMINMESSAGES_SENDCONFIRM"];
player say2D "3DEN_notificationDefault";

ga_adminMessages_channel radioChannelRemove [player];


[profileName,_message] remoteExec ["grad_adminMessages_fnc_receiveMessage",0,false];
