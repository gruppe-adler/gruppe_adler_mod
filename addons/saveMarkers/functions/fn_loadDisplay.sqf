#include "script_component.hpp"
#include "..\ui\defines.hpp"


GVAR(selectedMarkers) = [] call FUNC(allMarkers);
GVAR(previewMarkers) = [];

private _display = (findDisplay 46) createDisplay QGVAR(RscDisplayMarkers);

// map =========================================================================
private _mapCtrl = _display displayCtrl IDC_MAP;
_mapCtrl ctrlAddEventHandler ["MouseButtonDown",FUNC(onMouseButtonDownMap)];
_mapCtrl ctrlAddEventHandler ["MouseButtonUp",FUNC(onMouseButtonUpMap)];
_mapCtrl ctrlAddEventHandler ["Draw",FUNC(onDraw)];
_mapCtrl ctrlMapAnimAdd [0,0.8,[worldSize/2,worldSize/2]];
ctrlMapAnimCommit _mapCtrl;

// select all event
_mapCtrl ctrlAddEventHandler ["KeyDown",{
    params ["","_key","","_ctrl"];
    if (_ctrl && {_key == 30}) then {
        GVAR(selectedMarkers) = [] call FUNC(allMarkers);
        [] call FUNC(updateButtonSave);
    };
}];

// buttons =====================================================================
private _ctrlButtonSave = _display displayCtrl IDC_BUTTONSAVE;
_ctrlButtonSave ctrlAddEventHandler ["buttonClick",FUNC(onButtonSave)];

private _ctrlButtonDelete = _display displayCtrl IDC_BUTTONDELETE;
_ctrlButtonDelete ctrlAddEventHandler ["buttonClick",FUNC(onButtonDelete)];

private _ctrlButtonLoad = _display displayCtrl IDC_BUTTONLOAD;
_ctrlButtonLoad ctrlAddEventHandler ["buttonClick",FUNC(onButtonLoad)];

[IDC_BUTTONDELETE,false] call FUNC(setButtonEnabled);
[IDC_BUTTONLOAD,false] call FUNC(setButtonEnabled);
[IDC_BUTTONSAVE,false] call FUNC(setButtonEnabled);

// saves list ==================================================================
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
_ctrlSavesList ctrlAddEventHandler ["lbSelChanged",FUNC(onSavesListSelChanged)];

[_display] call FUNC(updateSavesList);

// edit name ===================================================================
private _ctrlEditName = _display displayCtrl IDC_EDITNAME;
// execNextFrame here, because handler fires before backspace deletes a character
_ctrlEditName ctrlAddEventHandler ["keyDown",{[FUNC(onEditNameChanged),_this] call CBA_fnc_execNextFrame}];
