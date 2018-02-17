#include "script_component.hpp"

params [["_pos",[0,0]],["_sideID",-1]];

private _marker = ["respawn_west","respawn_east","respawn_guerrila","respawn_civilian"] select _sideID;

if (getMarkerType _marker == "") exitWith {[objNull,format [localize LSTRING(moduleMoveRespawnError1),_marker]] call bis_fnc_showCuratorFeedbackMessage};

_marker setMarkerPos _pos;
[objNull,format [localize LSTRING(moduleMoveRespawnConfirm),_marker,_pos]] call bis_fnc_showCuratorFeedbackMessage;
