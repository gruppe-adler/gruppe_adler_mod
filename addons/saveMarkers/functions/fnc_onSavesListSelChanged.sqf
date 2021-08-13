#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_ctrlSavesList","_selID"];

if (_selID < 0) exitWith {
    [] call FUNC(createMarkerPreview);
    [IDC_BUTTONDELETE,false] call FUNC(setButtonEnabled);
    [IDC_BUTTONLOAD,false] call FUNC(setButtonEnabled);
};

private _dataID = _ctrlSavesList lnbValue [_selID,0];
private _saveMarkersData = profileNamespace getVariable QGVAR(saveData);
(_saveMarkersData select _dataID) params ["_saveName","_worldName",["_markersData",[]]];

private _isThisWorld = _worldName == worldName;

[IDC_BUTTONLOAD,_isThisWorld] call FUNC(setButtonEnabled);
[IDC_BUTTONDELETE,true] call FUNC(setButtonEnabled);

if (_isThisWorld) then {
    [_markersData] call FUNC(createMarkerPreview);
} else {
    [] call FUNC(createMarkerPreview);
};

private _display = ctrlParent _ctrlSavesList;
private _ctrlEditName = _display displayCtrl IDC_EDITNAME;

_ctrlEditName ctrlSetText _saveName;
[] call FUNC(onEditNameChanged);
