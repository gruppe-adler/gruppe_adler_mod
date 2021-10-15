#include "script_component.hpp"

/*
*   Credits: PabstMirror, ACE_zeus_fnc_ui_globalSetSkill
*   Adapted for grad_zeus by McDiod
*/


disableSerialization;

params ["_control"];

private _display = ctrlParent _control;
private _ctrlButtonOK = _display displayctrl 1; //IDC_OK

_control ctrlRemoveAllEventHandlers "setFocus";


// close and confirm EHs =======================================================
private _fnc_onUnload = {
    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    if (isNull _logic) exitWith {};
    deleteVehicle _logic;
};

private _fnc_onConfirm = {
    params [["_ctrlButtonOK", controlNull, [controlNull]]];

    private _display = ctrlParent _ctrlButtonOK;
    private _selectSideCombo = _display displayCtrl 84210;
    private _selectFactionCombo = _display displayCtrl 84211;
    private _selectLoadoutsCombo = _display displayCtrl 84212;
    private _reapplyCheckbox = _display displayCtrl 84213;

    [
        [EAST,WEST,INDEPENDENT,CIVILIAN] select (_selectSideCombo lbValue (lbCurSel _selectSideCombo)),
        _selectFactionCombo lbData (lbCurSel _selectFactionCombo),
        _selectLoadoutsCombo lbData (lbCurSel _selectLoadoutsCombo),
        cbChecked _reapplyCheckbox
    ] call FUNC(moduleSetLoadoutsOnConfirm);
    false
};

_display displayAddEventHandler ["unload", _fnc_onUnload];
_ctrlButtonOK ctrlAddEventHandler ["buttonclick", _fnc_onConfirm];


// fill loadouts combo =========================================================
private _selectLoadoutsCombo = _display displayCtrl 84212;
private _loadouts = "true" configClasses (missionConfigFile >> "Loadouts" >> "Faction");
if (count _loadouts == 0) exitWith {
    [objNull,localize LSTRING(moduleSetLoadoutsError1)] call bis_fnc_showCuratorFeedbackMessage;
    closeDialog 2;
};
{
    _name = [_x,"displayName",(configName _x)] call BIS_fnc_returnConfigEntry;
    _selectLoadoutsCombo lbSetData [_selectLoadoutsCombo lbAdd _name,configName _x];

    nil
} count _loadouts;
_selectLoadoutsCombo lbSetCurSel 0;


// fill side combo =============================================================
private _selectSideCombo = _display displayCtrl 84210;
{
    _selectSideCombo lbSetValue [_selectSideCombo lbAdd (_x select 0),_x select 1];
} forEach [
    ["BLUFOR", 1],
    ["OPFOR", 0],
    ["INDEPENDENT", 2],
    ["CIVILIAN", 3]
];


// update faction combo based on selected side =================================
_selectSideCombo ctrlAddEventHandler ["LBSelChanged",{
    params [["_selectSideCombo",controlNull],["_curSelID",-1]];
    if (_curSelID < 0) exitWith {};

    private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
    private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
    private _unitFaction = faction _unit;
    private _factionID = 0;

    private _sideID = _selectSideCombo lbValue _curSelID;
    private _selectFactionCombo = (ctrlParent _selectSideCombo) displayCtrl 84211;

    lbClear _selectFactionCombo;
    {
        _factionClass = configName _x;
        _classSideID = getNumber (_x >> "side");
        _classDisplayName = getText (_x >> "displayName");
        if (_classSideID == _sideID && {_classDisplayName != ""}) then {
            _curFactionID = _selectFactionCombo lbAdd _classDisplayName;
            _selectFactionCombo lbSetData [_curFactionID,_factionClass];
        };
        nil
    } count ("true" configClasses (configfile >> "CfgFactionClasses"));

    lbSort _selectFactionCombo;


    for [{_i=0},{_i < lbSize _selectFactionCombo},{_i=_i+1}] do {
        if (_selectFactionCombo lbData _i == _unitFaction) exitWith {
            _factionID = _i
        };
    };
    _selectFactionCombo lbSetCurSel _factionID;
}];


// select side of selected unit ================================================
private _logic = GETMVAR(BIS_fnc_initCuratorAttributes_target,objnull);
private _unit = _logic getvariable ["bis_fnc_curatorAttachObject_object",objnull];
private _unitSideID = [WEST,EAST,INDEPENDENT,CIVILIAN] find (side _unit);
if (_unitSideID < 0 || _unitSideID > 3) then {
    _selectSideCombo lbSetCurSel 0;
} else {
    _selectSideCombo lbSetCurSel _unitSideID;
};


// default value for reapply --> true ==========================================
private _reapplyCheckbox = _display displayCtrl 84213;
_reapplyCheckbox cbSetChecked true;
