#include "script_component.hpp"

private _editBox = uiNamespace getVariable ["grad_adminMessages_sendBoxCtrl",controlNull];
private _listbox = uiNamespace getVariable ["grad_adminMessages_sendBoxListboxCtrl",controlNull];

if (isNull _editBox || isNull _listbox) exitWith {};

private _message = ctrlText _editBox;
if (_message == "") exitWith {};

_editBox ctrlSetText "";

if ([] call grad_adminMessages_fnc_isAdminOrZeus) then {

    private _lbCurSel = lbCurSel _listbox;
    private _lbData = _listbox lbData _lbCurSel;
    private _lbText = _listbox lbText _lbCurSel;
    private _receiveConditionParams = [];

    private _receiveCondition = if ((call compile _lbData) < 0) then {
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

    // display sent message locally
    [format ["%1 %2",localize "STR_grad_ADMINMESSAGES_TO",_lbText],_message] call FUNC(displayMessage);

    // send message to recipient
    [profileName,getPlayerUID player,_message,_receiveCondition,_receiveConditionParams] remoteExec ["grad_adminMessages_fnc_receiveMessage",0,false];

} else {
    // display sent message locally
    [format ["%1 %2",localize "STR_grad_ADMINMESSAGES_TO","Admin"],_message] call FUNC(displayMessage);

    // send message to recipient
    [profileName,getPlayerUID player,_message] remoteExec ["grad_adminMessages_fnc_receiveMessage",0,false];
};

playSound "3DEN_notificationDefault";
