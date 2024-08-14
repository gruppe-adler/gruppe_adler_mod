// Do not serialize
disableSerialization;

// Include common defines file
#include "\z\cvo_aux\addons\dynGroups\DynamicGroupsCommonDefines.inc"

// Script parameters
private ["_mode", "_params"];
_mode   = _this param [0, "", [""]];
_params = _this param [1, [], [[]]];

switch _mode do
{
	case "onLoad":
	{
		private ["_display"];
		_display = _params select 0;

		// Store
		uiNamespace setVariable [VAR_UI_DISPLAY, _display];

		// Reset
		uiNamespace setVariable [VAR_SELECTED_MEMBER, nil];
		uiNamespace setVariable [VAR_SELECTED_PLAYER, nil];
		uiNamespace setVariable [VAR_SELECTED_GROUPORPLAYER, nil];

		// Sections
		private ["_sectionGroups", "_sectionManage"];
		_sectionGroups = _display displayCtrl IDC_DYNAMICGROUPS_SECTIONGROUPS;
		_sectionManage = _display displayCtrl IDC_DYNAMICGROUPS_SECTIONMANAGE;

		// List boxes
		private ["_groupsListbox", "_playersListbox", "_manageListbox"];
		_groupsListbox 	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		_playersListbox	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS;
		_manageListbox 	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXMANAGE;

		// Buttons
		private ["_createLeaveKickButton", "_promoteDisbandButton", "_joinButton", "_kickPlayerButton", "_invitePlayerButton", "_closeInterfaceButton", "_tabGroupsButton", "_tabPlayersButton"];
		_createLeaveKickButton = _display displayCtrl IDC_DYNAMICGROUPS_BUTTONCREATELEAVEKICK;
		_promoteDisbandButton = _display displayCtrl IDC_DYNAMICGROUPS_BUTTONPROMOTEDISBAND;
		_joinButton = _display displayCtrl IDC_DYNAMICGROUPS_BUTTONJOIN;
		_kickPlayerButton = _display displayCtrl IDC_DYNAMICGROUPS_BUTTONKICK;
		_invitePlayerButton = _display displayCtrl IDC_DYNAMICGROUPS_BUTTONINVITE;
		_closeInterfaceButton = _display displayCtrl IDC_DYNAMICGROUPS_CLOSEINTERFACE;
		_tabGroupsButton = _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONGROUPS;
		_tabPlayersButton = _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONPLAYERS;

		// Check boxes
		private ["_checkboxPrivate"];
		_checkboxPrivate = _display displayCtrl IDC_DYNAMICGROUPS_CHECKBOXPRIVATE;

		// Misc
		private ["_iconPicture", "_editGroupName"];
		_iconPicture = _display displayCtrl IDC_DYNAMICGROUPS_GROUPICON;
		_editGroupName = _display displayCtrl IDC_DYNAMICGROUPS_EDITGROUPNAME;

		// Add click events to list boxes
		_groupsListbox ctrlAddEventHandler ["TreeSelChanged", { with uiNamespace do { ['OnGroupsTreeSelChanged', _this] call DISPLAY; }; }];
		_playersListbox ctrlAddEventHandler ["LBSelChanged", { with uiNamespace do { ['OnPlayersLbSelChanged', _this] call DISPLAY; }; }];
		_manageListbox ctrlAddEventHandler ["LBSelChanged", { with uiNamespace do { ["OnManageLbSelChanged", _this] call DISPLAY; }; }];

		// Add double click events to list boxes
		_groupsListbox ctrlAddEventHandler ["TreeDblClick", { with uiNamespace do { ['OnTreeDoubleClick', _this] call DISPLAY; }; }];
		_playersListbox ctrlAddEventHandler ["LBDblClick", { with uiNamespace do { ['OnListDoubleClick', _this] call DISPLAY; }; }];
		_manageListbox ctrlAddEventHandler ["LBDblClick", { with uiNamespace do { ["OnListDoubleClick", _this] call DISPLAY; }; }];

		// Add expanded/collapsed events for Tree
		_groupsListbox ctrlAddEventHandler ["TreeExpanded", { with uiNamespace do { ['OnGroupExpanded', _this] call DISPLAY; }; }];
		_groupsListbox ctrlAddEventHandler ["TreeCollapsed", { with uiNamespace do { ['OnGroupCollapsed', _this] call DISPLAY; }; }];

		// Add event handlers to buttons
		_createLeaveKickButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnCreateLeaveKickButtonClick", _this] call DISPLAY; }; }];
		_promoteDisbandButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnPromoteDisbandButtonClick", _this] call DISPLAY; }; }];
		_joinButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnJoinButtonClick", _this] call DISPLAY; }; }];
		_invitePlayerButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnInvitePlayerButtonClick", _this] call DISPLAY; }; }];
		_closeInterfaceButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["CloseDisplay"] call DISPLAY; }; }];
		_tabGroupsButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnTabGroupsButtonClick", _this] call DISPLAY; }; }];
		_tabPlayersButton ctrlAddEventHandler ["ButtonClick", { with uiNamespace do { ["OnTabPlayersButtonClick", _this] call DISPLAY; }; }];

		// Add event handler to check box, detect when it's state changes
		_checkboxPrivate ctrlAddEventHandler ["CheckedChanged", { with uiNamespace do { ["OnPrivateStateChanged", _this] call DISPLAY; }; }];

		// Add event handlers to group picture/icon
		_iconPicture ctrlAddEventHandler ["MouseEnter", { with uiNamespace do { ["OnGroupIconMouseEnter", _this] call DISPLAY; }; }];
		_iconPicture ctrlAddEventHandler ["MouseExit", { with uiNamespace do { ["OnGroupIconMouseExit", _this] call DISPLAY; }; }];

		// Add event handlers for editing the group name
		_editGroupName ctrlAddEventHandler ["KeyDown", { with uiNamespace do { ["SetGroupName", _this] call DISPLAY; }; }];
		_editGroupName ctrlAddEventHandler ["SetFocus", { with uiNamespace do { ["OnGroupNameSetFocus", _this] call DISPLAY; }; }];
		_editGroupName ctrlAddEventHandler ["KillFocus", { with uiNamespace do { ["OnGroupNameKillFocus", _this] call DISPLAY; }; }];

		// Put Players list box right where groups list box is, both are never shown at the same time
		_playersListbox ctrlSetPosition (ctrlPosition _groupsListbox);
		_playersListbox ctrlCommit 0;
		_playersListbox ctrlShow false;

		// Make all sections invisible
		{ _x ctrlSetFade 1; _x ctrlShow false; _x ctrlCommit 0; } forEach [_sectionManage, _sectionGroups];

		// We always default to showing groups
		uiNamespace setVariable [VAR_SHOW_GROUPS, true];

		// Add key down event for our display
		["AddKeyEvents", [_display]] call GROUPS;

		// Hide hud and commanding menu
		showHud false;
		showCommandingMenu "";

		// Reset collapsed groups variable
		uiNamespace setVariable [VAR_COLLAPSED_GROUPS, []];

		// Initial update
		["Update", [true]] call DISPLAY;

		// Log
		if (LOG_ENABLED) then
		{
			["onLoad: %1 / %2 / %3 / %4 / %5", _display, _sectionManage, _sectionGroups] call BIS_fnc_logFormat;
		};
	};

	case "onUnload":
	{
		terminate (uiNamespace getVariable "BIS_dynamicGroups_update");

		uiNamespace setVariable [VAR_UI_DISPLAY, nil];
		uiNamespace setVariable [VAR_HAS_FOCUS, nil];
		uiNamespace setVariable [VAR_OLD_GROUPS_LIST, nil];
		uiNamespace setVariable [VAR_OLD_GROUPS_PLAYERS_LIST, nil];
		uiNamespace setVariable [VAR_OLD_PLAYERS_LIST, nil];
		uiNamespace setVariable [VAR_OLD_MEMBERS_LIST, nil];

		// Show hud and commanding menu
		showHud true;

		// Log
		if (LOG_ENABLED) then
		{
			"onUnload" call BIS_fnc_log;
		};
	};

	case "GetDisplay" :
	{
		uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
	};

	case "CreateDisplay" :
	{
		([] call BIS_fnc_displayMission) createDisplay "RscDisplayDynamicGroups";
	};

	case "CloseDisplay" :
	{
		(uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull]) closeDisplay IDC_CANCEL;
	};

	case "Update" :
	{
		private ["_initialUpdate"];
		_initialUpdate = _params param [0, false, [true]];

		// Update groups section
		["UpdateGroupsSection", [_initialUpdate]] call DISPLAY;

		// Update manage section
		["UpdateManageSection", [_initialUpdate]] call DISPLAY;

		// Store last known player group
		uiNamespace setVariable [VAR_LAST_PLAYER_GROUP, group player];
	};

	case "UpdateManageSection" :
	{
		private _initialUpdate = _params param [0, false, [true]];
		private _display = uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];

		// Make sure ourt display is valid
		CHECK(isNull _display);

		// Controls
		private
		[
			"_sectionManage", "_buttonPromoteDisband", "_buttonInvite", "_buttonCreateLeaveKick", "_editGroupName", "_textNumberOfPlayers",
			"_listBoxMembers", "_listBoxGroups", "_listBoxPlayers", "_checkboxPrivate", "_sidePicture", "_groupIcon", "_fillPlayerName",
			"_fillPlayerSide", "_fillPlayerScore"
		];
		_sectionManage 		= _display displayCtrl IDC_DYNAMICGROUPS_SECTIONMANAGE;
		_buttonPromoteDisband	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONPROMOTEDISBAND;
		_buttonInvite 		= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONINVITE;
		_buttonCreateLeaveKick	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONCREATELEAVEKICK;
		_editGroupName 		= _display displayCtrl IDC_DYNAMICGROUPS_EDITGROUPNAME;
		_textNumberOfPlayers 	= _display displayCtrl IDC_DYNAMICGROUPS_TEXTPLAYERCOUNT;
		_listBoxMembers		= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXMANAGE;
		_listBoxGroups 		= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		_listBoxPlayers		= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS;
		_checkboxPrivate 	= _display displayCtrl IDC_DYNAMICGROUPS_CHECKBOXPRIVATE;
		_sidePicture 		= _display displayCtrl IDC_DYNAMICGROUPS_PICTURESIDE;
		_groupIcon		= _display displayCtrl IDC_DYNAMICGROUPS_GROUPICON;
		_fillPlayerName		= _display displayCtrl IDC_DYNAMICGROUPS_TEXTPLAYERNAMEFILL;
		_fillPlayerSide		= _display displayCtrl IDC_DYNAMICGROUPS_TEXTPLAYERSIDEFILL;
		_fillPlayerScore	= _display displayCtrl IDC_DYNAMICGROUPS_TEXTPLAYERSCOREFILL;

		private ["_playerGroup", "_playerIsLeader", "_playerGroupRegistered"];
		_playerGroup 		= group player;
		_playerIsLeader		= player == leader _playerGroup;
		_playerGroupRegistered	= ["IsGroupRegistered", [_playerGroup]] call GROUPS;

		if (!_playerGroupRegistered) then
		{
			_sectionManage ctrlShow true;
			_sectionManage ctrlSetFade 0.5;
			_sectionManage ctrlCommit SECTION_FADE_TIME;

			_buttonCreateLeaveKick ctrlEnable true;
			_buttonCreateLeaveKick ctrlSetText (localize "STR_A3_RscDisplayDynamicGroups_Button_Create");
			_buttonCreateLeaveKick ctrlSetTooltip localize "STR_A3_DynamicGroups_Tooltip_CreateOwnGroup";

			_buttonPromoteDisband ctrlEnable false;
			_buttonInvite ctrlEnable false;

			_checkboxPrivate ctrlEnable false;
			_checkboxPrivate cbSetChecked false;

			_listBoxMembers ctrlEnable false;
			lbClear _listBoxMembers;

			_editGroupName ctrlEnable false;
			_editGroupName ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Hint";
			_editGroupName ctrlEnable false;

			_textNumberOfPlayers ctrlSetText "-";

			_fillPlayerName ctrlSetText "-";
			_fillPlayerSide ctrlSetText "-";
			_fillPlayerScore ctrlSetText "-";

			_sidePicture ctrlSetText "#(argb,8,8,3)color(0,0,0,0.5)";

			_groupIcon ctrlSetText "\A3\Ui_f\data\GUI\Cfg\UnitInsignia\bi_ca.paa";
		}
		else
		{
			private ["_groupName", "_groupPicture", "_groupInstance", "_groupLeader", "_groupPlayers", "_groupSide", "_groupIsPrivate"];
			_groupName 	= groupId _playerGroup;
			_groupPicture 	= _playerGroup getVariable [VAR_GROUP_INSIGNIA, ""];
			_groupIsPrivate = _playerGroup getVariable [VAR_GROUP_PRIVATE, false];
			_groupLeader 	= leader _playerGroup;
			_groupPlayers 	= units _playerGroup;
			_groupSide 	= side _playerGroup;

			_sectionManage ctrlShow true;
			_sectionManage ctrlSetFade 0;
			_sectionManage ctrlCommit SECTION_FADE_TIME;

			// Update members
			["FillPlayersListbox", [_listBoxMembers, _groupPlayers, true]] call DISPLAY;
			uiNamespace setVariable [VAR_OLD_MEMBERS, _groupPlayers];
			uiNamespace setVariable [VAR_OLD_GROUP, _playerGroup];

			private ["_selectedMemberIndex", "_selectedMemberUid"];
			_selectedMemberIndex 	= lnbCurSelRow _listBoxMembers;
			_selectedMemberUid	= "";

			if (!isNull _listBoxMembers && !isNil { _selectedMemberIndex } && { _selectedMemberIndex != -1 }) then
			{
				_selectedMemberUid = _listBoxMembers lnbData [_selectedMemberIndex, 0];
			};

			_listBoxMembers ctrlEnable true;
			_checkboxPrivate ctrlEnable (_playerIsLeader && {!(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false])});
			_checkboxPrivate cbSetChecked _groupIsPrivate;
			_fillPlayerName ctrlSetText ([player] call BIS_fnc_getName);
			_fillPlayerSide ctrlSetText (["GetSideFormattedString", [_groupSide]] call DISPLAY);
			_fillPlayerScore ctrlSetText str score player;

			// Update edit box only if player is not leader (cannot edit)
			private _lastPlayerGroup = uiNamespace getVariable [VAR_LAST_PLAYER_GROUP, grpNull];

			if (!_playerIsLeader || {_initialUpdate} || {_playerGroup != _lastPlayerGroup} || {ctrlText _editGroupName == ["ClampString", [localize "STR_A3_RscDisplayDynamicGroups_Hint"]] call DISPLAY}) then
			{
				_editGroupName ctrlSetText _groupName;
			};

			// Enable edit box only for leader, because only leader can change group name
			if (_playerIsLeader && {!(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false])}) then
			{
				_editGroupName ctrlEnable true;
			}
			else
			{
				_editGroupName ctrlEnable false;
			};

			// Fill the number of players in the group
			_textNumberOfPlayers ctrlSetText str (count _groupPlayers);

			// Set the side color
			private ["_sideColor", "_sideColorString"];
			_sideColor = [_groupSide] call BIS_fnc_sideColor;
			_sideColorString = switch (_groupSide) do
			{
				case WEST : 		{ format["#(argb,8,8,3)color(%1,%2,%3,0.6)", _sideColor select 0, _sideColor select 1, _sideColor select 2] };
				case EAST : 		{ format["#(argb,8,8,3)color(%1,%2,%3,0.6)", _sideColor select 0, _sideColor select 1, _sideColor select 2] };
				case RESISTANCE : 	{ format["#(argb,8,8,3)color(%1,%2,%3,0.6)", _sideColor select 0, _sideColor select 1, _sideColor select 2] };
				case default 		{ "#(argb,8,8,3)color(0.9,0.9,0.9,0.6)" };
			};
			_sidePicture ctrlSetText _sideColorString;

			// Set the group icon
			private _insignia = missionNamespace getVariable [VAR_FORCED_INSIGNIA, ""];
			private _insigniaTexture = if (_insignia != "") then {["GetInsigniaTexture", [_insignia]] call GROUPS} else {["GetInsigniaTexture", [_groupPicture]] call GROUPS};
			if (_insigniaTexture == "") then {
				_groupIcon ctrlSetText "\z\cvo_aux\addons\dynGroups\data\noInsignia.paa";
			} else {
				_groupIcon ctrlSetText _insigniaTexture;
			};
		};
	};

	case "UpdateGroupsSection" :
	{
		private ["_initialUpdate"];
		_initialUpdate = _params param [0, false, [true]];

		private "_display";
		_display = uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		CHECK(isNull _display);

		private ["_sectionGroups", "_buttonJoin", "_playersListbox"];
		_sectionGroups 	= _display displayCtrl IDC_DYNAMICGROUPS_SECTIONGROUPS;
		_buttonJoin 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONJOIN;
		_playersListbox	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS;

		// Show groups section
		_sectionGroups ctrlShow true;
		_sectionGroups ctrlSetFade 0;
		_sectionGroups ctrlCommit SECTION_FADE_TIME;

		// Disable the join button since groups section was just updated
		_buttonJoin ctrlEnable false;

		private "_friendlyGroups";
		_friendlyGroups = ["GetAllGroupsOfSide", [side group player]] call GROUPS;

		// Go through all players of same side and those which are not in the list are added to an "Unsorted Players" list
		private "_unsortedPlayers";
		_unsortedPlayers = [];

		{
			if (isPlayer _x && {side group _x == side group player} && {!(["IsGroupRegistered", [group _x]] call GROUPS)}) then
			{
				_unsortedPlayers pushBack _x;
			};
		} forEach playableUnits + switchableUnits + allDeadMen;

		private "_sidePlayers";
		_sidePlayers = [];

		{
			if (isPlayer _x && {side group _x == side group player}) then
			{
				_sidePlayers pushBack _x;
			};
		} forEach playableUnits + switchableUnits + allDeadMen;

		if (uiNamespace getVariable [VAR_SHOW_GROUPS, true]) then
		{
			["OnTabGroupsButtonClick"] call DISPLAY;

			["FillPlayersListbox", [_playersListbox, _sidePlayers]] call DISPLAY;
			uiNamespace setVariable [VAR_OLD_PLAYERS, _sidePlayers];

			["FillGroupsListbox", [_friendlyGroups, _unsortedPlayers]] call DISPLAY;
			uiNamespace setVariable [VAR_OLD_GROUPS, [_friendlyGroups, _unsortedPlayers]];
		}
		else
		{
			["OnTabPlayersButtonClick"] call DISPLAY;

			["FillGroupsListbox", [_friendlyGroups, _unsortedPlayers]] call DISPLAY;
			uiNamespace setVariable [VAR_OLD_GROUPS, [_friendlyGroups, _unsortedPlayers]];

			["FillPlayersListbox", [_playersListbox, _sidePlayers]] call DISPLAY;
			uiNamespace setVariable [VAR_OLD_PLAYERS, _sidePlayers];
		};
	};

	case "FillGroupsListbox" :
	{
		private ["_groupsList", "_unsortedPlayers"];
		_groupsList 		= _params param [0, [], [[]]];
		_unsortedPlayers	= _params param [1, [], [[]]];

		// The selected index, this is used to know if we should manually select a list element in case it was selected before this update
		private ["_selectedIndex", "_totalIndex"];
		_selectedIndex 	= [-1, -1];
		_totalIndex	= -1;

		private "_display";
		_display = uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		CHECK(isNull _display);

		private "_listbox";
		_listbox = _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		CHECK(isNull _listbox);

		// Clear the tree
		tvClear _listbox;

		// Add them to the list box
		{
			private "_index";
			_index = _forEachIndex;
			_totalIndex = _totalIndex + 1;

			private ["_groupName", "_groupPicture", "_groupIsPrivate", "_groupLeader", "_groupPlayers", "_wasKickedFrom", "_locked", "_maxUnitCount", "_isFull", "_autoName"];
			_groupName 	= groupId _x;
			_groupPicture 	= _x getVariable [VAR_GROUP_INSIGNIA, ["LoadRandomInsignia"] call GROUPS];
			_groupIsPrivate = _x getVariable [VAR_GROUP_PRIVATE, false];
			_groupLeader 	= leader _x;
			_groupPlayers 	= units _x;
			_wasKickedFrom	= ["WasPlayerKickedFrom", [_x, player]] call GROUPS;
			_hasInvite	= ["HasInvite", [_x, player]] call GROUPS;
			_locked		= (_groupIsPrivate || {_wasKickedFrom}) && {!(player in _groupPlayers)} && {!_hasInvite};
			_maxUnitCount	= missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99];
			_isFull		= count units _x >= _maxUnitCount;
			_autoName	= if (_maxUnitCount < 99) then { format ["%1  (%2/%3)", _groupName, count units _x, missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99]] } else { _groupName };

			// Selected group?
			if ((uiNamespace getVariable [VAR_SELECTED_GROUPORPLAYER, [grpNull, objNull]]) select 0 == _x) then
			{
				_selectedIndex = [_index, -1];
			};

			private _texture = if (_locked) then
			{
				"a3\Ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa";
			}
			else
			{
				["GetInsigniaTexture", [_groupPicture]] call GROUPS;
			};

			private _parent = _listbox tvAdd [[], _autoName];
			_listbox tvSetData [[_parent], _groupName];
			_listbox tvSort [[_parent], true];
			_listbox tvSetPicture [[_parent], _texture];
			if (_locked) then { _listbox tvSetPictureColor [[_parent], COLOR_LOCKED]; } else { _listbox tvSetPictureColor [[_parent], [1,1,1,1]]; };
			_listbox tvSetPictureColorSelected [[_parent], [1,1,1,1]];
			_listbox tvSetPictureColorDisabled [[_parent], [1,1,1,1]];
			if (_x in (uiNamespace getVariable [VAR_COLLAPSED_GROUPS, []])) then { _listbox tvCollapse [_parent]; } else { _listbox tvExpand [_parent]; };

			{
				private ["_groupPlayerName", "_isLeader", "_sameGroup", "_groupPlayerIcon", "_isDead", "_isIncapacitated"];
				_groupPlayerName 	= [_x] call BIS_fnc_getName;
				_isLeader		= _x == _groupLeader;
				_sameGroup		= group player == group _x;
				_groupPlayerIcon	= if (!_isLeader) then { ["GetPlayerIcon", [_x]] call DISPLAY; } else { ICON_GENERAL; };
				/*_isDead			= !alive _x;
				_isIncapacitated	= alive _x && _x getVariable ["BIS_revive_incapacitated", false];*/
                _isDead             = false;
                _isIncapacitated    = false;

				private _color = switch (true) do
				{
					case (_isDead) : 		{ COLOR_DEAD };
					case (_isIncapacitated) : 	{ COLOR_INCAPACITATED };
					case (player == _x) : 		{ COLOR_SELF };
					case (_sameGroup) : 		{ COLOR_GROUP };
					default 			{ COLOR_DEFAULT };
				};

				// Selected player?
				if ((uiNamespace getVariable [VAR_SELECTED_GROUPORPLAYER, [grpNull, objNull]]) select 1 == _x) then
				{
					_selectedIndex = [_index, _forEachIndex];
				};

				if (_isDead) then
				{
					_groupPlayerName = localize "STR_A3_rscdisplaydynamicgroups_deadplayer";
					_groupPlayerIcon = ICON_KIA;
				}
				else
				{
					if (_isIncapacitated) then { _groupPlayerIcon = ICON_REVIVE; };
				};

				private _child = _listbox tvAdd [[_parent], _groupPlayerName];
				_listbox tvSetData [[_parent, _child], getPlayerUid _x];
				_listbox tvSort [[_parent, _child], true];
				_listbox tvSetPicture [[_parent, _child], _groupPlayerIcon];
				_listbox tvSetPictureColor [[_parent, _child], _color];
			}
			forEach _groupPlayers;
		}
		forEach _groupsList;

		if (count _unsortedPlayers > 0) then
		{
			// Add unsorted players to the list
			private _parent = _listbox tvAdd [[], UNSORTED_GROUP_ID];
			_listbox tvSetData [[_parent], UNSORTED_GROUP_ID];
			_listbox tvSort [[_parent], true];
			_listbox tvExpand [_parent];

			_totalIndex = _totalIndex + 1;

			// Selected group?
			if (isNull ((uiNamespace getVariable [VAR_SELECTED_GROUPORPLAYER, [grpNull, objNull]]) select 0)) then
			{
				_selectedIndex = [count _groupsList, -1];
			};

			{
				private ["_unsortedPlayerName", "_unsortedPlayerIcon"];
				_unsortedPlayerName 	= [_x] call BIS_fnc_getName;
				_unsortedPlayerIcon	= ["GetPlayerIcon", [_x]] call DISPLAY;
				/*_isDead			= !alive _x;
				_isIncapacitated	= alive _x && {_x getVariable ["BIS_revive_incapacitated", false]};*/
                _isDead             = false;
                _isIncapacitated    = false;

				private _color = switch (true) do
				{
					case (_isDead) : 		{ COLOR_DEAD };
					case (_isIncapacitated) : 	{ COLOR_INCAPACITATED };
					case (player == _x) : 		{ COLOR_SELF };
					default 			{ COLOR_DEFAULT };
				};

				// Selected player?
				if ((uiNamespace getVariable [VAR_SELECTED_GROUPORPLAYER, [grpNull, objNull]]) select 1 == _x) then
				{
					_selectedIndex = [_totalIndex, _forEachIndex];
				};

				if (_isDead) then
				{
					_unsortedPlayerName = localize "STR_A3_rscdisplaydynamicgroups_deadplayer";
					_unsortedPlayerIcon = ICON_KIA;
				}
				else
				{
					if (_isIncapacitated) then { _unsortedPlayerIcon = ICON_REVIVE; };
				};

				private _child = _listbox tvAdd [[_parent], _unsortedPlayerName];
				_listbox tvSetData [[_parent, _child], getPlayerUid _x];
				_listbox tvSort [[_parent, _child], true];
				_listbox tvSetPicture [[_parent, _child], _unsortedPlayerIcon];
				_listbox tvSetPictureColor [[_parent, _child], _color];

				if (UNSORTED_GROUP_ID in (uiNamespace getVariable [VAR_COLLAPSED_GROUPS, []])) then
				{
					_listbox tvCollapse [_parent];
				}
				else
				{
					_listbox tvExpand [_parent];
				};
			}
			forEach _unsortedPlayers;
		};

		// If we had a previously selected element, try to re-set it if it still exists
		if (_selectedIndex select 0 != -1) then
		{
			if (_selectedIndex select 1 != -1) then
			{
				_listbox tvSetCurSel _selectedIndex;
			}
			else
			{
				_listbox tvSetCurSel [_selectedIndex select 0];
			};
		};
	};

	case "FillPlayersListbox" :
	{
		private ["_listbox", "_playerList", "_isManageSection"];
		_listbox		= _params param [0, controlNull, [controlNull]];
		_playerList 		= _params param [1, [], [[]]];
		_isManageSection	= _params param [2, false, [true]];

		private ["_targetVar", "_targetList"];
		_targetVar	= [VAR_SELECTED_PLAYER, VAR_SELECTED_MEMBER] select _isManageSection;
		_targetList	= [VAR_OLD_PLAYERS_LIST, VAR_OLD_MEMBERS_LIST] select _isManageSection;

		// All elements currently in list
		private _unitElements = [];
		for "_i" from 0 to (((lnbSize _listbox) select 0) - 1) do {_unitElements pushBackUnique (_listbox lnbData [_i, 0]);};

		// The old and new lists
		private _oldPlayersList = uiNamespace getVariable [_targetList, []];
		private _newPlayersList = [];

		// Create abstract data for comparation
		{
			_newPlayersList pushBack [_x, [_x] call BIS_fnc_getName, group _x, groupId group _x, leader group _x == _x, alive _x, alive _x && {_x getVariable ["BIS_revive_incapacitated", false]}];
		} forEach _playerList;

		// Make sure we need to update
		if !(_newPlayersList isEqualTo _oldPlayersList) then
		{
			// Store new list
			uiNamespace setVariable [_targetList, _newPlayersList];

			// The selected item index
			private _curSel = -1;

			// Fill listbox
			{
				_unitElements = _unitElements - [getPlayerUid _x];

				private ["_name", "_textureIcon", "_textureRank", "_isGroupLeader", "_texture", "_sameGroup", "_isDead", "_isIncapacitated"];
				_name 				= [_x] call BIS_fnc_getName;
				_textureIcon		= ["GetPlayerIcon", [_x]] call DISPLAY;
				_textureRank		= "a3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa";
				_isGroupLeader		= _x == leader group _x;
				_texture 			= [_textureIcon, _textureRank] select (_isGroupLeader && ["IsGroupRegistered", [group _x]] call GROUPS);
				_sameGroup			= group player == group _x;
				/*_isDead				= !alive _x;
				_isIncapacitated	= alive _x && _x getVariable ["BIS_revive_incapacitated", false];*/
                _isDead             = false;
                _isIncapacitated    = false;


				private _color = switch (true) do
				{
					case (_isDead) : 		{ COLOR_DEAD };
					case (_isIncapacitated) : 	{ COLOR_INCAPACITATED };
					case (player == _x) : 		{ COLOR_SELF };
					case (_sameGroup) : 		{ COLOR_GROUP };
				};

				if (_isDead) then
				{
					_name = localize "STR_A3_rscdisplaydynamicgroups_deadplayer";
					_texture = ICON_KIA;
				}
				else
				{
					if (_isIncapacitated) then { _texture = ICON_REVIVE; };
				};

				private _index = ["LnbGetDataIndex", [_listbox, getPlayerUid _x]] call DISPLAY;

				if (_index == -1) then
				{
					_listbox lnbAddRow [""];
					_listbox lnbSetData [[_forEachIndex, 0], getPlayerUid _x];
					_listbox lnbSetPicture [[_forEachIndex, 0], _texture];
					_listbox lnbSetText [[_forEachIndex, 1], _name];
					_listbox lnbSetColor [[_forEachIndex, 1], [1,1,1,1]];
					_listbox lnbSetPictureColor [[_forEachIndex, 0], _color];
					_listbox lnbSetPictureColorSelected [[_forEachIndex, 0], _color];
				}
				else
				{
					_listbox lnbSetPicture [[_index, 0], _texture];
					_listbox lnbSetText [[_index, 1], _name];
					_listbox lnbSetColor [[_index, 1], [1,1,1,1]];
					_listbox lnbSetPictureColor [[_index, 0], _color];
					_listbox lnbSetPictureColorSelected [[_index, 0], _color];
				};

				if (player == _x) then { _curSel = _forEachIndex; };
			} forEach _playerList;

			// Set selected item
			_listbox lbSetCurSel _curSel;

			// Delete leftovers
			{ ["LnbDeleteUnit", [_listbox, _x]] call DISPLAY; } forEach _unitElements;
		};
	};

	case "LnbGetDataIndex" :
	{
		private _listbox 	= _params param [0, controlNull, [controlNull]];
		private _data 		= _params param [1, "", [""]];
		private _index 		= -1;

		if (_data != "") then
		{
			for "_i" from 0 to (((lnbSize _listbox) select 0) - 1) do
			{
				if (_listbox lnbData [_i, 0] == _data) then {_index = _i};
			};
		};

		_index;
	};

	case "LnbDeleteUnit" :
	{
		private _listbox 	= _params param [0, controlNull, [controlNull]];
		private _data		= _params param [1, "", [""]];

		// Make sure data is not empty
		if (!isNull _listbox && {_data != ""}) then
		{
			for "_i" from 0 to (((lnbSize _listbox) select 0) - 1) do
			{
				if (_listbox lnbData [_i, 0] == _data) then {_listbox lnbDeleteRow _i};
			};
		};
	};

	case "TreeGetDataIndex" :
	{
		private _listbox 	= _params param [0, controlNull, [controlNull]];
		private _data 		= _params param [1, "", [""]];
		private _index 		= [];

		if (_data != "") then
		{
			for "_i" from 0 to ((_listbox tvCount []) - 1) do
			{
				if (_listbox tvData [_i] == _data) then {_index = [_i]};

				for "_a" from 0 to ((_listbox tvCount [_i]) - 1) do
				{
					if (_listbox tvData [_i, _a] == _data) then {_index = [_i, _a]};
				};
			};
		};

		_index;
	};

	case "TreeUpdateElement" :
	{
		_params params
		[
			["_listbox", controlNull, [controlNull]],
			["_data", "", [""]],
			["_text", "", [""]],
			["_picture", "", [""]],
			["_pictureColor", [1,1,1,1], [[]]]
		];

		// Make sure data is not empty
		if (_data != "") then
		{
			private _index = ["TreeGetDataIndex", [_listbox, _data]] call DISPLAY;

			if !(_index isEqualTo []) then
			{
				_listbox tvSetText [_index, _text];
				_listbox tvSetPicture [_index, _picture];
				_listbox tvSetPictureColor [_index, _pictureColor];
				_listbox tvSort [_index, true];
			};
		};
	};

	case "TreeGetAllElements" :
	{
		private _listbox = _params param [0, controlNull, [controlNull]];
		private _elements = [[], []];

		for "_i" from 0 to ((_listbox tvCount []) - 1) do
		{
			(_elements select 0) pushBack (_listbox tvData [_i]);

			for "_a" from 0 to ((_listbox tvCount [_i]) - 1) do
			{
				(_elements select 1) pushBack (_listbox tvData [_i, _a]);
			};
		};

		_elements;
	};

	case "TreeDeleteGroup" :
	{
		private _data = _params param [0, "", [""]];

		// Make sure data is not empty
		if (_data != "") then
		{
			private _display = uiNamespace getVariable [VAR_UI_DISPLAY, displayNull];
			private _listbox = _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;

			if (!isNull _listbox) then
			{
				for "_i" from 0 to ((_listbox tvCount []) - 1) do
				{
					if (_listbox tvData [_i] == _data) exitWith
					{
						_listbox tvDelete [_i];
						["Group Deleted: %1", _data] call BIS_fnc_error;
					};
				};
			};
		};
	};

	case "TreeDeleteUnit" :
	{
		private _data = _params param [0, "", [""]];

		// Make sure data is not empty
		if (_data != "") then
		{
			private _display = uiNamespace getVariable [VAR_UI_DISPLAY, displayNull];
			private _listbox = _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;

			if (!isNull _listbox) then
			{
				for "_i" from 0 to ((_listbox tvCount []) - 1) do
				{
					for "_a" from 0 to ((_listbox tvCount [_i]) - 1) do
					{
						if (_listbox tvData [_i, _a] == _data) exitWith
						{
							_listbox tvDelete [_i, _a];
							["Unit Deleted: %1", _data] call BIS_fnc_error;
						};
					};
				};
			};
		};
	};

	case "OnGroupsTreeSelChanged" :
	{
		private ["_listbox", "_index"];
		_listbox 	= _params select 0;
		_index 		= tvCurSel _listbox;

		// Exit if index is invalid
		if (count _index < 1 || { _index select 0 < 0 }) exitWith {};

		private ["_display", "_inviteButton", "_joinButton"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_inviteButton 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONINVITE;
		_joinButton 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONJOIN;

		_joinButton ctrlEnable false;
		_inviteButton ctrlEnable false;

		private "_data";
		_data = _listbox tvData _index;

		// If we are dealing with the unsorted group we exit
		if (_data == UNSORTED_GROUP_ID) exitWith
		{
			uiNamespace setVariable [VAR_SELECTED_GROUPORPLAYER, [grpNull, objNull]];
		};

		// The group
		private ["_group", "_player"];
		_group  = ["GetGroupByName", [_data, side group player]] call GROUPS;
		_player = [_data] call BIS_fnc_getUnitByUid;

		// Validate group or player
		if (isNull _group && {isNull _player}) exitWith
		{
			["OnGroupsTreeSelChanged: Group (%1) or player (%1) not found", _data] call BIS_fnc_error;
		};

		// Did the user just clicked a group or a player
		if (!isNull _group) then
		{
			// A group was selected
			private ["_groupIsPrivate", "_wasKickedFrom", "_isInGroup", "_hasInvite", "_isFull"];
			_groupIsPrivate 	= _group getVariable [VAR_GROUP_PRIVATE, false];
			_wasKickedFrom		= ["WasPlayerKickedFrom", [_group, player]] call GROUPS;
			_isInGroup		= _group == group player;
			_hasInvite 		= ["HasInvite", [_group, player]] call GROUPS;
			_isFull			= count units _group >= missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99];

			// Store the newly selected group
			uiNamespace setVariable [VAR_SELECTED_GROUPORPLAYER, [_group, objNull]];

			if (_isInGroup || {_isFull} || {!_hasInvite && {_groupIsPrivate || {_wasKickedFrom}}}) then
			{
				_joinButton ctrlEnable false;
			}
			else
			{
				_joinButton ctrlEnable true;
			};
		}
		else
		{
			// A player was selected
			private ["_playerName", "_weAreLeader", "_hasInvite", "_sameGroup", "_noGroup"];
			_playerName 	= [_player] call BIS_fnc_getName;
			_weAreLeader 	= player == leader group player;
			_hasInvite 	= ["HasInvite", [group player, _player]] call GROUPS;
			_sameGroup	= group player == group _player;
			_noGroup	= !(["PlayerHasGroup", [player]] call GROUPS);

			// Store the newly selected player
			uiNamespace setVariable [VAR_SELECTED_GROUPORPLAYER, [group _player, _player]];

			switch (true) do
			{
				case (_hasInvite) :
				{
					_inviteButton ctrlSetText localize "STR_A3_rscdisplaydynamicgroups_button_invited";
					_inviteButton ctrlSetTooltip localize "STR_A3_rscdisplaydynamicgroups_tooltip_invited";
					_inviteButton ctrlSetBackgroundColor [0.5, 0.5, 0.5, 1.0];
					_inviteButton ctrlSetTextColor [1.0, 1.0, 1.0, 1.0];
					_inviteButton ctrlEnable false;
					_joinButton ctrlEnable false;
				};

				case (!_weAreLeader || {_sameGroup} || {_noGroup} || {player == _player}) :
				{
					_inviteButton ctrlSetText localize "STR_A3_rscdisplaydynamicgroups_button_invite";
					_inviteButton ctrlSetTooltip "";
					_inviteButton ctrlEnable false;
					_joinButton ctrlEnable false;
				};

				default
				{
					_inviteButton ctrlSetText localize "STR_A3_rscdisplaydynamicgroups_button_invite";
					_inviteButton ctrlSetTooltip "";
					_inviteButton ctrlEnable true;
					_joinButton ctrlEnable false;
				};
			};
		};
	};

	case "OnPlayersLbSelChanged" :
	{
		private ["_listbox", "_index"];
		_listbox = _params select 0;
		_index = _params select 1;

		private ["_display", "_inviteButton", "_joinButton"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_inviteButton 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONINVITE;
		_joinButton 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONJOIN;

		_joinButton ctrlEnable false;
		_inviteButton ctrlEnable false;

		// Make sure we have a group, otherwise there is nothing for us to do here
		if !(["PlayerHasGroup", [player]] call GROUPS) exitWith {};

		// The clicked player
		private _clickedUid = _listbox lnbData [_index, 0];

		// The player to which the uid belongs to
		private ["_clickedPlayer", "_hasInvite", "_inSameGroup", "_weAreLeader"];
		_clickedPlayer 	= [_clickedUid] call BIS_fnc_getUnitByUid;
		_hasInvite 	= ["HasInvite", [group player, _clickedPlayer]] call GROUPS;
		_inSameGroup 	= group player == group _clickedPlayer;
		_weAreLeader 	= player == leader group player;

		// Store the newly selected player
		uiNamespace setVariable [VAR_SELECTED_PLAYER, _clickedPlayer];

		if (!_hasInvite && {!_inSameGroup} && {_weAreLeader} && {getPlayerUid player != _clickedUid}) then
		{
			_inviteButton ctrlEnable true;
		};
	};

	case "OnManageLbSelChanged" :
	{
		private ["_listbox", "_index"];
		_listbox 	= _params select 0;
		_index 		= _params select 1;

		// The clicked player uid
		private "_clickedUid";
		_clickedUid = _listbox lnbData [_index, 0];

		// The player to which the uid belongs to
		private ["_clickedPlayer", "_currentPlayerIsLeader"];
		_clickedPlayer 			= [_clickedUid] call BIS_fnc_getUnitByUid;
		_currentPlayerIsLeader 	= player == leader group player;

		// Store the newly selected member
		uiNamespace setVariable [VAR_SELECTED_MEMBER, _clickedPlayer];

		private ["_display", "_buttonCreateLeaveKick", "_buttonPromoteDisband"];
		_display 				= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_buttonCreateLeaveKick 	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONCREATELEAVEKICK;
		_buttonPromoteDisband	= _display displayCtrl IDC_DYNAMICGROUPS_BUTTONPROMOTEDISBAND;

		_buttonCreateLeaveKick ctrlEnable false;
		_buttonPromoteDisband ctrlEnable false;

		// Did we click ourselves?
		if (_clickedPlayer == player) then
		{
			if (count units group player < 2) then
			{
				_buttonCreateLeaveKick ctrlEnable !(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false]);
				_buttonCreateLeaveKick ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Leave";
				_buttonCreateLeaveKick ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_LeaveGroup";

				_buttonPromoteDisband ctrlEnable false;
				_buttonPromoteDisband ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Disband";
				_buttonPromoteDisband ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_KickAll";
			}
			else
			{
				_buttonCreateLeaveKick ctrlEnable !(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false]);
				_buttonCreateLeaveKick ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Leave";
				_buttonCreateLeaveKick ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_LeaveGroup";

				if (_currentPlayerIsLeader) then
				{
					_buttonPromoteDisband ctrlEnable !(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false]);
					_buttonPromoteDisband ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Disband";
					_buttonPromoteDisband ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_KickAll";
				};
			};
		}
		else
		{
			if (_currentPlayerIsLeader) then
			{
				_buttonCreateLeaveKick ctrlEnable !(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false]);
				_buttonCreateLeaveKick ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_KickBan";
				_buttonCreateLeaveKick ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_KickPlayer";

				_buttonPromoteDisband ctrlEnable true;
				_buttonPromoteDisband ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Promote";
				_buttonPromoteDisband ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_PromotePlayer";
			}
			else
			{
				_buttonCreateLeaveKick ctrlEnable !(missionNamespace getVariable [VAR_MINIMAL_INTERACTION, false]);
				_buttonCreateLeaveKick ctrlSetText localize "STR_A3_RscDisplayDynamicGroups_Button_Leave";
				_buttonCreateLeaveKick ctrlSetTooltip localize "STR_A3_RscDisplayDynamicGroups_Tooltip_LeaveGroup";
			};
		};
	};

	case "OnCreateLeaveKickButtonClick" :
	{
		private ["_button"];
		_button = _params select 0;

		_button ctrlEnable false;
		["SetDefaultFocus"] call DISPLAY;

		private ["_display", "_listbox", "_listBoxIndex", "_selectedUid"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_listbox 	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXMANAGE;
		_listBoxIndex	= lnbCurSelRow _listbox;
		_selectedUid	= _listbox lnbData [_listBoxIndex, 0];

		private ["_hasGroup", "_isLeader", "_isSelfSelected"];
		_hasGroup 	= ["PlayerHasGroup", [player]] call GROUPS;
		_isLeader 	= _hasGroup && {player == leader group player};
		_isSelfSelected	= _selectedUid == getPlayeruid player;

		switch (true) do
		{
			case (_hasGroup && {_isLeader} && {_isSelfSelected}) : 	{ ["OnLeaveGroupButtonClick"] call DISPLAY; };
			case (_hasGroup && {_isLeader} && {!_isSelfSelected}) : { ["OnKickPlayerButtonClick", [_selectedUid]] call DISPLAY; };
			case (_hasGroup && {!_isLeader}) :			{ ["OnLeaveGroupButtonClick"] call DISPLAY; };
			case default 						{ ["OnCreateGroupButtonClick"] call DISPLAY; };
		};
	};

	case "OnCreateGroupButtonClick" :
	{
		// Request group for player
		if (player == leader group player) then
		{
			["SendClientMessage", ["RegisterGroup", [group player, player]]] call GROUPS;
		}
		else
		{
			["SendClientMessage", ["CreateGroupAndRegister", [player]]] call GROUPS;
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnCreateGroupButtonClick: %1 / %2", group player, player] call BIS_fnc_logFormat;
		};
	};

	case "OnLeaveGroupButtonClick" :
	{
		// Request server to make player leave the current group
		["SendClientMessage", ["RemoveGroupMember", [group player, player]]] call GROUPS;

		// Event
		["OnGroupLeave", [group player, leader group player, player]] call GROUPS;

		// Log
		if (LOG_ENABLED) then
		{
			["OnLeaveGroupButtonClick: %1 / %2", group player, player] call BIS_fnc_logFormat;
		};
	};

	case "OnKickPlayerButtonClick" :
	{
		private ["_uid"];
		_uid = _params param [0, "", [""]];

		private ["_group", "_groupLeader", "_kickedPlayer"];
		_group 		= group player;
		_groupLeader	= leader _group;
		_kickedPlayer	= [_uid] call BIS_fnc_getUnitByUid;

		if (!isNull _group && {!isNull _groupLeader} && {!isNull _kickedPlayer} && {_groupLeader == player}) then
		{
			// Request server to make player leave the current group
			["SendClientMessage", ["KickPlayer", [_group, _groupLeader, _kickedPlayer]]] call GROUPS;

			// Event
			["OnKicked", [_group, _kickedPlayer, _groupLeader]] call GROUPS;
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnKickPlayerButtonClick: %1", _group, _groupLeader, _kickedPlayer] call BIS_fnc_logFormat;
		};
	};

	case "OnPromoteDisbandButtonClick" :
	{
		private _button = _params select 0;

		_button ctrlEnable false;
		["SetDefaultFocus"] call DISPLAY;

		private ["_hasGroup", "_hasEnoughPlayers"];
		_hasGroup 		= ["PlayerHasGroup", [player]] call GROUPS;
		_hasEnoughPlayers	= count units group player > 1;

		// Make sure player has a group, group has at least another player and that player is actually leader
		if (!_hasGroup && {!_hasEnoughPlayers} && {player == leader group player}) exitWith {};

		private ["_display", "_listbox", "_listBoxIndex", "_selectedUid"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_listbox 	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXMANAGE;
		_listBoxIndex	= lnbCurSelRow _listbox;
		_selectedUid	= _listbox lnbData [_listBoxIndex, 0];

		private _isSelfSelected	= _selectedUid == getPlayerUid player;

		// If we have ourselves selected in the listbox, we Disband group, otherwise we will Promote to leader
		if (_isSelfSelected) then
		{
			["OnDisbandGroupButtonClick"] call DISPLAY;
		}
		else
		{
			["OnPromotePlayerButtonClick", [_selectedUid]] call DISPLAY;
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnPromoteDisbandButtonClick: %1", _isSelfSelected] call BIS_fnc_logFormat;
		};
	};

	case "OnDisbandGroupButtonClick" :
	{
		private ["_group", "_group", "_groupPlayers", "_groupLeader"];
		_group	 	= group player;
		_groupPlayers	= units _group;
		_groupLeader	= leader _group;

		{
			["OnGroupDisbanded", [_group, _x, _groupLeader]] call GROUPS;
		} forEach _groupPlayers - [_groupLeader];

		{
			[_x] joinSilent grpNull;
		} forEach _groupPlayers;

		// Request server to make player leave the current group
		["SendClientMessage", ["UnregisterGroup", [_group]]] call GROUPS;

		// Log
		if (LOG_ENABLED) then
		{
			["OnDisbandGroupButtonClick: %1", _group, _groupPlayers, _groupLeader] call BIS_fnc_logFormat;
		};
	};

	case "OnPromotePlayerButtonClick" :
	{
		private ["_uid"];
		_uid = _params param [0, "", [""]];

		private ["_group", "_groupLeader", "_newLeader"];
		_group 			= group player;
		_groupLeader		= leader _group;
		_newLeader		= [_uid] call BIS_fnc_getUnitByUid;

		// Request server to switch leader
		["SendClientMessage", ["SwitchLeader", [_group, _newLeader]]] call GROUPS;

		// Event
		["OnPromotedToLeader", [_group, _newLeader, _groupLeader]] call GROUPS;

		// Log
		if (LOG_ENABLED) then
		{
			["OnPromotePlayerButtonClick: %1 / %2 / %3", _group, _groupLeader, _newLeader] call BIS_fnc_logFormat;
		};
	};

	case "OnJoinButtonClick" :
	{
		private ["_button"];
		_button = _params select 0;

		_button ctrlEnable false;
		["SetDefaultFocus"] call DISPLAY;

		private ["_display", "_listboxGroups", "_index", "_groupUniqueId"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_listboxGroups 	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		_index 		= tvCurSel _listboxGroups;
		_groupUniqueId 	= _listboxGroups tvData _index;

		private "_group";
		_group = ["GetGroupByName", [_groupUniqueId, side group player]] call GROUPS;

		if (!isNull _group) then
		{
			private ["_groupLeader", "_groupIsPrivate", "_hasInvite", "_isFull"];
			_groupLeader		= leader _group;
			_groupIsPrivate 	= _group getVariable [VAR_GROUP_PRIVATE, false];
			_hasInvite		= ["HasInvite", [_group, player]] call GROUPS;
			_isFull			= count units _group >= missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99];

			if ((!_groupIsPrivate || {_hasInvite}) && {!_isFull}) then
			{
				if !(["PlayerHasGroup", [player]] call GROUPS) then
				{
					["SendClientMessage", ["AddGroupMember", [_group, player]]] call GROUPS;
				}
				else
				{
					["SendClientMessage", ["SwitchGroup", [_group, player]]] call GROUPS;
				};

				if (_hasInvite) then
				{
					["RemoveInvite", [_group, player]] call GROUPS;
				};

				// Event
				["OnGroupJoin", [_group, _groupLeader, player]] call GROUPS;
			};
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnJoinButtonClick: %1", _button] call BIS_fnc_logFormat;
		};
	};

	case "OnInvitePlayerButtonClick" :
	{
		private ["_button"];
		_button = _params select 0;

		_button ctrlEnable false;
		["SetDefaultFocus"] call DISPLAY;

		private ["_display", "_isTree", "_listbox", "_listboxIndex"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_isTree		= uiNamespace getVariable [VAR_SHOW_GROUPS, true];
		_listbox 	= if (_isTree) then { _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS; } else { _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS; };
		_listboxIndex	= if (_isTree) then { tvCurSel _listbox; } else { lnbCurSelRow _listbox; };

		// Validate selected player in list box
		if (_listboxIndex isEqualTo []) exitWith
		{
			"OnInvitePlayerButtonClick: No player selected within the Tree/listNbox resource" call BIS_fnc_error;
		};

		// The local player group
		private "_group";
		_group = group player;

		// The clicked player uid
		private ["_clickedUid", "_clickedPlayer"];
		_clickedUid = if (_isTree) then { _listbox tvData _listboxIndex; } else { _listbox lnbData [_listboxIndex, 0]; };
		_clickedPlayer = [_clickedUid] call BIS_fnc_getUnitByUid;

		// Validate player object
		if (isNull _clickedPlayer) exitWith
		{
			["OnInvitePlayerButtonClick: Player with uid (%1) not found", _clickedUid] call BIS_fnc_error;
		};

		// Add invite
		if !(["HasInvite", [_group, _clickedPlayer]] call GROUPS) then
		{
			["AddInvite", [_group, player, _clickedPlayer]] call GROUPS;
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnInvitePlayerButtonClick: %1 / %2 / %3", _group, player, _clickedPlayer] call BIS_fnc_logFormat;
		};
	};

	case "OnTabGroupsButtonClick" :
	{
		private ["_display", "_listGroups", "_listPlayers", "_buttonGroups", "_buttonPlayers"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_listGroups	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		_listPlayers	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS;
		_buttonGroups	= _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONGROUPS;
		_buttonPlayers	= _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONPLAYERS;

		_listGroups ctrlShow true;
		_buttonGroups ctrlSetTextColor [1,1,1,1];
		_buttonGroups ctrlSetBackgroundColor [1,1,1,0.6];
		_buttonGroups ctrlSetActiveColor [1,1,1,0.6];

		_listPlayers ctrlShow false;
		_buttonPlayers ctrlSetTextColor [1,1,1,0.4];
		_buttonPlayers ctrlSetBackgroundColor [0,0,0,0.6];
		_buttonPlayers ctrlSetActiveColor [0,0,0,0.6];

		uiNamespace setVariable [VAR_SHOW_GROUPS, true];
	};

	case "OnTabPlayersButtonClick" :
	{
		private ["_display", "_listGroups", "_listPlayers"];
		_display 	= uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_listGroups	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXGROUPS;
		_listPlayers	= _display displayCtrl IDC_DYNAMICGROUPS_LISTBOXPLAYERS;
		_buttonGroups	= _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONGROUPS;
		_buttonPlayers	= _display displayCtrl IDC_DYNAMICGROUPS_TABBUTTONPLAYERS;

		_listPlayers ctrlShow true;
		_buttonPlayers ctrlSetTextColor [1,1,1,1];
		_buttonPlayers ctrlSetBackgroundColor [1,1,1,0.6];
		_buttonPlayers ctrlSetActiveColor [1,1,1,0.6];

		_listGroups ctrlShow false;
		_buttonGroups ctrlSetTextColor [1,1,1,0.4];
		_buttonGroups ctrlSetBackgroundColor [0,0,0,0.6];
		_buttonGroups ctrlSetActiveColor [0,0,0,0.6];

		uiNamespace setVariable [VAR_SHOW_GROUPS, false];
	};

	case "OnGroupIconMouseEnter" :
	{

	};

	case "OnGroupIconMouseExit" :
	{

	};

	case "OnPrivateStateChanged" :
	{
		private ["_checkboxPrivate", "_isChecked"];
		_checkboxPrivate = _params select 0;
		_isChecked = (_params select 1) == 1;

		["SendClientMessage", ["SetPrivateState", [group player, _isChecked]]] call GROUPS;

		// Log
		if (LOG_ENABLED) then
		{
			["OnPrivateStateChanged: %1", _isChecked] call BIS_fnc_logFormat;
		};
	};

	case "OnTreeDoubleClick" :
	{
		private "_tree";
		_tree = _params select 0;

		private "_index";
		_index = tvCurSel _tree;

		if (count _index > 1) then
		{
			private "_clickedUid";
			_clickedUid = _tree tvData _index;

			// The player to which the uid belongs to
			private "_clickedPlayer";
			_clickedPlayer = [_clickedUid] call BIS_fnc_getUnitByUid;

			// Player was clicked
			if (player != _clickedPlayer) then
			{
				["OnPlayerDoubleClick", [_clickedPlayer]] call DISPLAY;
			};
		}
		else
		{
			private ["_clickedName", "_clickedId"];
			_clickedId 	= _tree tvData _index;
			_clickedGroup	= ["GetGroupByName", [_clickedId, side group player]] call GROUPS;

			// Group was clicked
			if (!isNull _clickedGroup) then
			{
				["OnGroupDoubleClick", [_clickedGroup]] call DISPLAY;
			};
		};
	};

	case "OnListDoubleClick" :
	{
		private ["_listbox", "_index"];
		_listbox 	= _params select 0;
		_index 		= _params select 1;

		// The clicked player uid
		private "_clickedUid";
		_clickedUid = _listbox lnbData [_index, 0];

		// The player to which the uid belongs to
		private "_clickedPlayer";
		_clickedPlayer = [_clickedUid] call BIS_fnc_getUnitByUid;

		// Player was clicked
		if (player != _clickedPlayer) then
		{
			["OnPlayerDoubleClick", [_clickedPlayer]] call DISPLAY;
		};
	};

	case "OnGroupDoubleClick" :
	{
		private ["_group"];
		_group = _params select 0;

		private ["_groupPrivate", "_wasKickedFrom", "_hasInvite", "_isFull"];
		_groupPrivate 	= _group getVariable [VAR_GROUP_PRIVATE, false];
		_wasKickedFrom	= ["WasPlayerKickedFrom", [_group, player]] call GROUPS;
		_hasInvite	= ["HasInvite", [_group, player]] call GROUPS;
		_isFull		= count units _group >= missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99];

		// Make sure that group is not private and player is not kicked from it, or player as invite
		if (!_isFull && {_hasInvite || {!_groupPrivate && {!_wasKickedFrom}}}) then
		{
			if (["PlayerHasGroup", [player]] call GROUPS) then
			{
				["SendClientMessage", ["AddGroupMember", [_group, player]]] call GROUPS;
			}
			else
			{
				["SendClientMessage", ["SwitchGroup", [_group, player]]] call GROUPS;
			};

			if (_hasInvite) then
			{
				["RemoveInvite", [_group, player]] call GROUPS;
			};
		};
	};

	case "OnPlayerDoubleClick" :
	{
		private _clickedPlayer = _params select 0;

		// Did we clicked ourselves
		if (_clickedPlayer != player) then
		{
			private ["_selfInGroup", "_otherInGroup", "_hasInvite", "_wasKicked", "_groupIsLocked", "_isFull"];
			_selfInGroup 	= ["PlayerHasGroup", [player]] call GROUPS;
			_otherInGroup	= ["PlayerHasGroup", [_clickedPlayer]] call GROUPS;
			_hasInvite	= ["HasInvite", [group player, _clickedPlayer]] call GROUPS;
			_wasKicked	= ["WasPlayerKickedFrom", [group _clickedPlayer, player]] call GROUPS;
			_groupIsLocked	= (group _clickedPlayer) getVariable [VAR_GROUP_PRIVATE, false];
			_isFull		= count units (group _clickedPlayer) >= missionNamespace getVariable [VAR_MAX_UNITS_PER_GROUP, 99];

			switch (true) do
			{
				// Invite player
				case (_selfInGroup && {!_hasInvite} && {group player != group _clickedPlayer}) :
				{
					["AddInvite", [group player, player, _clickedPlayer]] call GROUPS;
				};

				// Join other player's group
				case (!_selfInGroup && {_otherInGroup} && {!_wasKicked} && {!_groupIsLocked} && {!_isFull}) :
				{
					["SendClientMessage", ["AddGroupMember", [group _clickedPlayer, player]]] call GROUPS;

					if (_hasInvite) then
					{
						["RemoveInvite", [group _clickedPlayer, player]] call GROUPS;
					};
				};
			};
		};
	};

	case "SetGroupName" :
	{
		private _editGroupName 	= _params param [0, controlNull, [controlNull]];
		private _key		= _params param [1, -1, [0]];

		if (_key == 28 || {_key == 156} || {_key == -1}) then
		{
			// Lose focus
			ctrlSetFocus ((uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull]) displayCtrl IDC_DYNAMICGROUPS_LISTBOXMANAGE);

			// Log
			if (LOG_ENABLED) then
			{
				"SetGroupName: %1 / %2" call BIS_fnc_logFormat;
			};
		};
	};

	case "OnGroupNameChanged" :
	{
		private _editGroupName = _params param [0, controlNull, [controlNull]];

		// New and old group name
		private _oldGroupName = groupid (group player);
		private _groupName = ctrlText _editGroupName;

		// Make sure names are different
		if (_oldGroupName == _groupName) exitWith {};

		private ["_wasUpdated", "_groupNameSize"];
		_wasUpdated 	= false;
		_groupNameSize	= count (toArray _groupName);

		private ["_clampedGroupName", "_groupNameWasClamped"];
		_clampedGroupName 	= ["ClampString", [_groupName]] call DISPLAY;
		_groupNameWasClamped	= _groupNameSize > count (toArray _clampedGroupName);

		private ["_groupsOfSide", "_nameTaken"];
		_groupsOfSide 	= ["GetAllGroupsOfSide", [side group player]] call GROUPS;
		_nameTaken 	= false;

		{
			if (groupId _x isEqualTo _clampedGroupName) then
			{
				_nameTaken = true;
			};
		}
		forEach _groupsOfSide;

		if (typeName _clampedGroupName == "STRING" && {_clampedGroupName != _oldGroupName} && {_clampedGroupName != ""} && {!_nameTaken}) then
		{
			(group player) setGroupId [_clampedGroupName];
			["SendClientMessage", ["SetName", [group player, _clampedGroupName]]] call GROUPS;
			playsound "ReadoutHideClick1";
			_wasUpdated = true;
		};

		// Animate
		private ["_backgroundGroupName", "_color"];
		_backgroundGroupName = (uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull]) displayCtrl IDC_DYNAMICGROUPS_BACKGROUNDGROUPNAME;
		_color = switch (true) do
		{
			case (_wasUpdated && {!_groupNameWasClamped}) : 	{ [RESISTANCE] call BIS_fnc_sideColor };
			case (_wasUpdated && {_groupNameWasClamped}) :  	{ [CIVILIAN] call BIS_fnc_sideColor };
			case default 						{ [EAST] call BIS_fnc_sideColor };
		};
		_backgroundGroupName ctrlSetBackgroundColor _color;
		_editGroupName ctrlSetTextColor [1,1,1,1];

		[_backgroundGroupName, _editGroupName, [_oldGroupName, _clampedGroupName] select (_wasUpdated)] spawn
		{
			scriptName "RscDisplayDynamicGroups RscEdit animation";

			disableSerialization;

			sleep 0.3;
			(_this select 0) ctrlSetBackgroundColor [0, 0, 0, 1];
			(_this select 1) ctrlEnable true;
			(_this select 1) ctrlSetText (_this select 2);
			(_this select 1) ctrlSetTextColor [1, 1, 1, 1];
		};

		// Log
		if (LOG_ENABLED) then
		{
			["OnGroupNameChanged: %1 / %2", _this, _clampedGroupName] call BIS_fnc_logFormat;
		};
	};

	case "OnGroupExpanded" :
	{
		private ["_tree", "_index"];
		_tree = _params select 0;
		_index = _params select 1;

		private ["_data", "_collapsedGroups"];
		_data 			= _tree tvData _index;
		_collapsedGroups 	= uiNamespace getVariable [VAR_COLLAPSED_GROUPS, []];
		_group			= ["GetGroupByName", [_data, side group player]] call GROUPS;

		if (!isNull _group && {_group in _collapsedGroups}) then
		{
			_collapsedGroups deleteAt (_collapsedGroups find _group);
			uiNamespace setVariable [VAR_COLLAPSED_GROUPS, _collapsedGroups];
		};
	};

	case "OnGroupCollapsed" :
	{
		private ["_tree", "_index"];
		_tree 	= _params select 0;
		_index 	= _params select 1;

		private ["_data", "_collapsedGroups", "_group"];
		_data 			= _tree tvData _index;
		_collapsedGroups 	= uiNamespace getVariable [VAR_COLLAPSED_GROUPS, []];
		_group			= ["GetGroupByName", [_data, side group player]] call GROUPS;

		if (!isNull _group && {!(_group in _collapsedGroups)}) then
		{
			_collapsedGroups pushBack _group;
			uiNamespace setVariable [VAR_COLLAPSED_GROUPS, _collapsedGroups];
		};
	};

	case "SetDefaultFocus" :
	{
		private ["_display", "_control"];
		_display = uiNamespace getVariable ["BIS_dynamicGroups_display", displayNull];
		_control = _display displayCtrl IDC_CANCEL;

		ctrlSetFocus _control;
	};

	case "OnGroupNameSetFocus" :
	{
		private ["_editGroupName"];
		_editGroupName = _params select 0;

		// Flag
		uiNamespace setVariable [VAR_HAS_FOCUS, true];

		// Log
		if (LOG_ENABLED) then
		{
			["OnGroupNameFocus: Group Name has focus (%1)", _editGroupName] call BIS_fnc_log;
		};
	};

	case "OnGroupNameKillFocus" :
	{
		private ["_editGroupName"];
		_editGroupName = _params select 0;

		// Flag
		uiNamespace setVariable [VAR_HAS_FOCUS, nil];

		// Apply group name change
		["OnGroupNameChanged", [_editGroupName]] call DISPLAY;

		// Log
		if (LOG_ENABLED) then
		{
			["OnGroupNameFocus: Group Name lost focus (%1)", _editGroupName] call BIS_fnc_log;
		};
	};

	case "GetFactionPicture" :
	{
		private ["_leader"];
		_leader = _params param [0, objNull, [objNull]];

		private "_picture";
		_picture = getText (configFile >> "CfgFactionClasses" >> faction _leader >> "flag");

		if (_picture != "") then
		{
			_picture;
		}
		else
		{
			["GetSideColor", [side group _leader]] call DISPLAY;
		};
	};

	case "GetSideColor" :
	{
		private ["_side"];
		_side = _params param [0, SIDEUNKNOWN, [SIDEUNKNOWN]];

		private "_color";
		_color = switch (_side) do
		{
			case WEST : 		{ "#(argb,8,8,3)color(0,0,1,0.6)" };
			case EAST : 		{ "#(argb,8,8,3)color(1,0,0,0.6)" };
			case RESISTANCE : 	{ "#(argb,8,8,3)color(0,1,0,0.6)" };
			case CIVILIAN : 	{ "#(argb,8,8,3)color(0.5,0.5,0.5,0.6)" };
			case default 		{ "#(argb,8,8,3)color(0,0,0,0.6)" };
		};

		_color;
	};

	case "GetPlayerIcon" :
	{
		private "_player";
		_player = _params param [0, objNull, [objNull, ""]];

		if (typeName _player == "STRING") then
		{
			_player = [_player] call BIS_fnc_getUnitByUid;
		};

		if (isNull _player) exitWith { ""; };

		private ["_icon", "_texture"];
		_icon 		= getText (configfile >> "CfgVehicles" >> typeOf _player >> "icon");
		_texture	= if (_icon != "") then {getText (configfile >> "CfgVehicleIcons" >> _icon)} else {""};

		_texture;
	};

	case "GetSideFormattedString" :
	{
		private ["_side"];
		_side = _params param [0, sideUnknown, [sideUnknown]];

		private "_string";
		_string = switch (_side) do
		{
			case WEST : 		{ localize "STR_A3_texturesources_blu0" };
			case EAST : 		{ localize "STR_A3_truck_02_transport_base_f_texturesources_opfor0" };
			case RESISTANCE : 	{ localize "STR_A3_cfggroups_indep0" };
			case default 		{ localize "STR_A3_cfgvehicles_c_man_10" };
		};

		_string;
	};

	case "ClampString" :
	{
		private ["_inString", "_maxSize"];
		_inString 	= _params param [0, "", [""]];
		_maxSize 	= _params param [1, MAX_GROUP_NAME_SIZE, [0]];

		private ["_outString", "_groupNameArray"];
		_outString = "";
		_groupNameArray = toArray _inString;

		if (count _groupNameArray > _maxSize) then
		{
			_groupNameArray resize _maxSize;
			_outString = toString _groupNameArray;
		}
		else
		{
			_outString = _inString;
		};

		_outString;
	};

	case default
	{
		["Unknown mode: %1", _mode] call BIS_fnc_error;
	};
};
