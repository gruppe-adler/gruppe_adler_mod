#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_display"];

if (isNil "_display") then {
    _display = findDisplay IDD_SAVEMARKERS;
};

private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
if (isNull _ctrlSavesList) exitWith {};

lnbClear _ctrlSavesList;

private _saveMarkersData = profileNamespace getVariable [QGVAR(saveData),[]];
{
    _x params [["_saveAs","ERROR: NO NAME"],["_worldName","ERROR: NO WORLDNAME"]];

    private _rowID = _ctrlSavesList lnbAddRow [_saveAs,_worldName];
    _ctrlSavesList lnbSetValue [[_rowID,0],_forEachIndex];

    _textColor = [[0.50,0.50,0.50,1],[1,1,1,1]] select (_worldName == worldName);
    {_ctrlSavesList lnbSetColor [[_rowID,_x],_textColor]} forEach [0,1];
} forEach _saveMarkersData;

_ctrlSavesList lnbSetCurSelRow _selID;
