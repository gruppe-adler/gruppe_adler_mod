#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_ctrlEditName"];

private _display = findDisplay IDD_SAVEMARKERS;
[_display] call FUNC(updateButtonSave);

// second param is only nil if this function was called by an actual keystroke (and not by clicking on a save from list)
if (isNil {_this param [1]}) exitWith {};

if (isNil "_ctrlEditName") then {
    _ctrlEditName = _display displayCtrl IDC_EDITNAME;
};

private _editText = ctrlText _ctrlEditName;
private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
_ctrlSavesList lnbSetCurSelRow ([_editText,worldName] call FUNC(findSaveInList));
