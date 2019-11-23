#include "script_component.hpp"
#include "..\gui\defines.hpp"

params [["_info",""],["_message",""]];

// chat is disabled by grad_minui >> display message in custom rscTitle
if (
    !isNil "grad_minui_fnc_setting" &&
    {
        (!visibleMap && !(["chat_enabled"] call grad_minui_fnc_setting)) ||
        (visibleMap && !(["chat_enabled_map"] call grad_minui_fnc_setting))
    }
) then {

    QGVAR(customChatLayer) cutRsc [QGVAR(rscCustomChat),"PLAIN",-1,true];
    private _customChatTitleDisplay = uiNamespace getVariable [QGVAR(rscCustomChat),displayNull];
    private _ctrlText = _customChatTitleDisplay displayCtrl GA_ADMINMESSAGES_IDC_CUSTOMCHATTEXT;

    _ctrlText ctrlSetStructuredText parseText format ["<t color='#E51919'>%1</t> %2",format [localize "STR_grad_ADMINMESSAGES_CHANNEL",_info],_message];

    private _textHeight = ctrlTextHeight _ctrlText;
    /* private _textWidth = ctrlTextWidth _ctrlText; */

    (ctrlPosition _ctrlText) params ["_origX","_origY","_origW","_origH"];

    _ctrlText ctrlSetPosition [_origX,_origY - _textHeight,_origW,_textHeight];
    _ctrlText ctrlCommit 0;

};


// add message to chat either way >> user can check chat history on map, if enabled
ga_adminMessages_channel radioChannelAdd [player];
ga_adminMessages_channel radioChannelSetCallsign format [localize "STR_grad_ADMINMESSAGES_CHANNEL",_info];

player customChat [ga_adminMessages_channel, _message];
ga_adminMessages_channel radioChannelRemove [player];
