// Includes
#include "\A3\ui_f\hpp\defineResincl.inc"
#include "\A3\ui_f\hpp\defineResinclDesign.inc"
#include "\A3\ui_f\hpp\defineCommonGrids.inc"

// Macros
#define CHECK(CONDITION) \
	if (CONDITION) exitWith {};

// Scripts
#define GROUPS								{ _this call (missionNamespace getVariable ["BIS_fnc_dynamicGroups", {}]); }
#define DISPLAY								{ _this call (uiNamespace getVariable ["RscDisplayDynamicGroups_script", {}]); }

// Variables
#define VAR_INITIALIZED						"BIS_dg_ini"
#define VAR_MAX_UNITS_PER_GROUP				"BIS_dg_mupg"
#define VAR_MINIMAL_INTERACTION				"BIS_dg_mii"
#define VAR_FORCED_INSIGNIA					"BIS_dg_fia"
#define VAR_GROUP_REGISTERED				"BIS_dg_reg"
#define VAR_GROUP_CREATOR					"BIS_dg_cre"
#define VAR_GROUP_INSIGNIA					"BIS_dg_ins"
#define VAR_GROUP_PRIVATE					"BIS_dg_pri"
#define VAR_GROUP_VAR						"BIS_dg_var"
#define VAR_KICKED_BY						"BIS_dg_kic"
#define VAR_INVITES							"BIS_dg_inv"
#define VAR_ON_CLIENT_MESSAGE				"BIS_dynamicGroups_clientMessage"
#define VAR_PLAYER_DRAW3D					"BIS_dynamicGroups_draw3D"
#define VAR_LAST_UPDATE_TIME				"BIS_dynamicGroups_lastUpdateTime"
#define VAR_PLAYER_RESPAWN_KEYDOWN			"BIS_dynamicGroups_respawnKeyDown"
#define VAR_UI_DISPLAY						"BIS_dynamicGroups_display"
#define VAR_OLD_GROUPS_LIST					"BIS_dynamicGroups_oldGroupsList"
#define VAR_OLD_GROUPS_DATA_LIST			"BIS_dynamicGroups_oldGroupsDataList"
#define VAR_OLD_GROUPS_PLAYERS_LIST			"BIS_dynamicGroups_oldGroupsPlayersList"
#define VAR_OLD_GROUPS_DATA_PLAYERS_LIST	"BIS_dynamicGroups_oldGroupsPlayersDataList"
#define VAR_OLD_PLAYERS_LIST				"BIS_dynamicGroups_oldPlayersList"
#define VAR_OLD_MEMBERS_LIST				"BIS_dynamicGroups_oldMembersList"
#define VAR_SHOW_GROUPS						"BIS_dynamicGroups_showGroups"
#define VAR_LAST_PLAYER_GROUP				"BIS_dynamicGroups_lastPlayerGroup"
#define VAR_HAS_FOCUS						"BIS_dynamicGroups_hasFocus"
#define VAR_SELECTED_MEMBER					"BIS_dynamicGroups_selectedMember"
#define VAR_SELECTED_PLAYER					"BIS_dynamicGroups_selectedPlayer"
#define VAR_SELECTED_GROUPORPLAYER			"BIS_dynamicGroups_selectedGroupOrPlayer"
#define VAR_OLD_MEMBERS						"BIS_dynamicGroups_oldMembers"
#define VAR_OLD_PLAYERS						"BIS_dynamicGroups_oldPlayers"
#define VAR_OLD_GROUPS						"BIS_dynamicGroups_oldGroups"
#define VAR_OLD_GROUP						"BIS_dynamicGroups_oldGroup"
#define VAR_COLLAPSED_GROUPS				"BIS_dynamicGroups_collapsedGroups"
#define VAR_ALLOW_INTERFACE					"BIS_dynamicGroups_allowInterface"

// Misc
#define UI_OPEN_KEY							"TeamSwitch"
#define DEFAULT_INSIGNIA					"NoInsignia"
#define HOLD_DOWN_TIME_FOR_INVITE_ACCEPT	0.7
#define INTERFACE_UPDATE_DELAY				0.4
#define INVITE_LIFETIME						60
#define IS_PUBLIC							true
#define IS_LOCAL							false
#define LOG_ENABLED							false
#define SECTION_FADE_TIME 					0.2
#define UPDATE_RATE							2.0
#define MAX_GROUP_NAME_SIZE					20
#define COLOR_DEFAULT						[1.0, 1.0, 1.0, 1.0]
#define COLOR_SELF							[1.0, 0.6, 0.0, 1.0]
#define COLOR_LOCKED						[0.5, 0.5, 0.5, 1.0]
#define COLOR_DEAD							[0.5, 0.5, 0.5, 0.6]
#define COLOR_GROUP							[0.0, 0.5, 0.0, 1.0]
#define COLOR_INCAPACITATED					[0.5, 0.0, 0.0, 1.0]
#define ICON_KIA							"a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"
#define ICON_REVIVE							"A3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\ReviveIcon_ca.paa"
#define ICON_GENERAL						"a3\Ui_f\data\GUI\Cfg\Ranks\general_gs.paa"
#define ICON_LOCK							"a3\Ui_f\data\GUI\Rsc\RscDisplayDynamicGroups\Lock.paa"
#define UNSORTED_GROUP_ID					localize "STR_A3_RscDisplayDynamicGroups_Ungrouped"
#define UNSORTED_GROUP_DATA					"UnsortedGroupData"
#define VAR_NEEDS_REVIVE					"BIS_revive_incapacitated"
