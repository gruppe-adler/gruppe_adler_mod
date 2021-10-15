#include "script_component.hpp"

#define COLOR_RED               ("#dd191a")
#define COLOR_YELLOW            ("#f6f300")
#define COLOR_GREEN             ("#66f000")
#define COLOR_WHITE             ("#ffffff")

params ["_args"];
_args params [["_updatePartID",0]];

private _summaryWindowCtrlGrp = uiNamespace getVariable [QGVAR(summaryWindowCtrlGrp),controlNull];
if (isNull _summaryWindowCtrlGrp) exitWith {};

private _nextUpdateID = _updatePartID + 1;
private _allPlayers = call CBA_fnc_players;

switch (_updatePartID) do {

    // column 0 ================================================================
    case (0): {
        _playersNumber = count _allPlayers;
        _serverFPS = missionNamespace getVariable [QGVAR(serverFPS),-1];
        _totalFPS = 0;
        _playersCounted = 0;
        {
            _fps = _x getVariable [QGVAR(playerFPS),-1];
            if (_fps > 0) then {
                _totalFPS = _totalFPS + _fps;
                _playersCounted = _playersCounted + 1;
            };
        } forEach _allPlayers;
        _avgFPS = _totalFPS / (_playersCounted max 1);

        // update players number
        (_summaryWindowCtrlGrp controlsGroupCtrl 96000) ctrlSetStructuredText parseText str _playersNumber;

        // update average fps
        _textColor = switch (true) do {
            case (_avgFPS < 25): {COLOR_RED};
            case (_avgFPS < 35): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96001) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,round _avgFPS];

        // update server fps
        _textColor = switch (true) do {
            case (_serverFPS < 20): {COLOR_RED};
            case (_serverFPS < 35): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96002) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,_serverFPS];
    };


    // column 1 ================================================================
    case (1): {
        _playersNumber = count _allPlayers;
        _unconsciousNumber = {_x getVariable ["ACE_isUnconscious",false]} count _allPlayers;
        _unconsciousRatio = _unconsciousNumber/(_playersNumber max 1);
        _injuredNumber = {!([_x] call ACE_medical_fnc_isInStableCondition)} count _allPlayers;
        _injuredRatio = _injuredNumber/(_playersNumber max 1);

        // update conscious number
        (_summaryWindowCtrlGrp controlsGroupCtrl 96010) ctrlSetStructuredText parseText str (_playersNumber - _unconsciousNumber);

        // update unconscious number
        _textColor = switch (true) do {
            case (_unconsciousRatio > 0.40): {COLOR_RED};
            case (_unconsciousRatio > 0.20): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96011) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,_unconsciousNumber];

        // update injured number
        _textColor = switch (true) do {
            case (_injuredRatio > 0.40): {COLOR_RED};
            case (_injuredRatio > 0.20): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96012) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,_injuredNumber];
    };


    // column 3 ================================================================
    case (2): {
        _allAI = allUnits - _allPlayers;
        _aiGroupsNumber = {count (units _x) > 0 && {{isPlayer _x} count (units _x) == 0}} count allGroups;
        _aiUnitsNumber = {!isPlayer _x} count _allAI;

        //update AI units number
        _textColor = switch (true) do {
            case (_aiUnitsNumber > 170): {COLOR_RED};
            case (_aiUnitsNumber > 120): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96020) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,_aiUnitsNumber];

        //update AI groups number
        _textColor = switch (true) do {
            case (_aiGroupsNumber > 80): {COLOR_RED};
            case (_aiGroupsNumber > 50): {COLOR_YELLOW};
            default {COLOR_WHITE};
        };
        (_summaryWindowCtrlGrp controlsGroupCtrl 96021) ctrlSetStructuredText parseText format ["<t color='%1'>%2</t>",_textColor,_aiGroupsNumber];
    };


    // column 4 ================================================================
    case (3): {
        _allAI = allUnits - _allPlayers;
        _ownerNameArray = [];
        _ownerCountArray = [];
        _ownerArray = [];
        {
            _ownerName = (group _x) getVariable [QGVAR(ownerName),"UNKNOWN"];
            _ownerID = _ownerNameArray find _ownerName;

            if (_ownerID < 0) then {
                _ownerNameArray pushBack _ownerName;
                _ownerCountArray pushBack 1;
            } else {
                _ownerCountArray set [_ownerID,(_ownerCountArray select _ownerID) + 1];
            };

            nil
        } count _allAI;
        {_ownerArray pushBack [_ownerCountArray select _forEachIndex,_x]} forEach _ownerNameArray;
        _ownerArray sort false;

        // update owner 1
        if (count _ownerArray > 0) then {
            _ownerData = _ownerArray select 0;
            (_summaryWindowCtrlGrp controlsGroupCtrl 95030) ctrlSetStructuredText parseText format ["%1 %2",localize LSTRING(onOwner),(_ownerData select 1)];
            (_summaryWindowCtrlGrp controlsGroupCtrl 96030) ctrlSetStructuredText parseText str (_ownerData select 0);
        } else {
            (_summaryWindowCtrlGrp controlsGroupCtrl 95030) ctrlSetStructuredText parseText "";
            (_summaryWindowCtrlGrp controlsGroupCtrl 96030) ctrlSetStructuredText parseText "";
        };

        // update owner 2
        if (count _ownerArray > 1) then {
            _ownerData = _ownerArray select 1;
            (_summaryWindowCtrlGrp controlsGroupCtrl 95031) ctrlSetStructuredText parseText format ["%1 %2",localize LSTRING(onOwner),(_ownerData select 1)];
            (_summaryWindowCtrlGrp controlsGroupCtrl 96031) ctrlSetStructuredText parseText str (_ownerData select 0);
        } else {
            (_summaryWindowCtrlGrp controlsGroupCtrl 95031) ctrlSetStructuredText parseText "";
            (_summaryWindowCtrlGrp controlsGroupCtrl 96031) ctrlSetStructuredText parseText "";
        };

        // update owner 3
        if (count _ownerArray > 2) then {
            _ownerData = _ownerArray select 2;
            (_summaryWindowCtrlGrp controlsGroupCtrl 95032) ctrlSetStructuredText parseText format ["%1 %2",localize LSTRING(onOwner),(_ownerData select 1)];
            (_summaryWindowCtrlGrp controlsGroupCtrl 96032) ctrlSetStructuredText parseText str (_ownerData select 0);
        } else {
            (_summaryWindowCtrlGrp controlsGroupCtrl 95032) ctrlSetStructuredText parseText "";
            (_summaryWindowCtrlGrp controlsGroupCtrl 96032) ctrlSetStructuredText parseText "";
        };

        // return to first column for next update
        _nextUpdateID = 0;
    };
};

_args set [0,_nextUpdateID];
