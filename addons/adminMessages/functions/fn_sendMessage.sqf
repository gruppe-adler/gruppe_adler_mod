#include "script_component.hpp"

private _editBox = uiNamespace getVariable ["grad_adminMessages_sendBoxCtrl",controlNull];
private _listbox = uiNamespace getVariable ["grad_adminMessages_sendBoxListboxCtrl",controlNull];

if (isNull _editBox || isNull _listbox) exitWith {};

private _message = ctrlText _editBox;
if (_message == "") exitWith {};

_editBox ctrlSetText "";

ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign localize "STR_grad_ADMINMESSAGES_SENDCONFIRM_CHANNEL";

player customChat [ga_adminMessages_channel, localize "STR_grad_ADMINMESSAGES_SENDCONFIRM"];
player say2D "3DEN_notificationDefault";

ga_adminMessages_channel radioChannelRemove [player];

if ([] call grad_adminMessages_fnc_isAdminOrZeus) then {
    _lbData = _listbox lbData (lbCurSel _listbox);
    _receiveConditionParams = [];
    _receiveCondition = if ((call compile _lbData) < 0) then {
        switch (call compile _lbData) do {
            case (-2): {{true}};                                                //EVERYONE
            case (-3): {{[] call grad_adminMessages_fnc_isAdminOrZeus}};        //OTHER ADMINS AND ZEUS
            case (-4): {{playerSide == WEST}};
            case (-5): {{playerSide == EAST}};
            case (-6): {{playerSide == INDEPENDENT}};
            case (-7): {{playerSide == CIVILIAN}};
            default {{false}};
        }
    } else {
        _receiveConditionParams = [_lbData];
        {getPlayerUID player == (_this select 0)}
    };
    [profileName,getPlayerUID player,_message,_receiveCondition,_receiveConditionParams] remoteExec ["grad_adminMessages_fnc_receiveMessage",0,false];
} else {
    [profileName,getPlayerUID player,_message] remoteExec ["grad_adminMessages_fnc_receiveMessage",0,false];
};
