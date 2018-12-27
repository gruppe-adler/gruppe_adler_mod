#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_display",["_selID",-1]];

if (isNil "_display") then {
    _display = findDisplay IDD_SAVEMARKERS;
};

private _ctrlSavesList = _display displayCtrl IDC_SAVESLIST;
if (isNil "_ctrlSavesList" || {isNull _ctrlSavesList}) exitWith {};

_ctrlSavesList lnbSetCurSelRow _selID;
