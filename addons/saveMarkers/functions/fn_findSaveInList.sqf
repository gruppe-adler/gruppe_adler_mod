#include "script_component.hpp"
#include "..\ui\defines.hpp"


params ["_editText","_worldName"];

private _display = findDisplay IDD_SAVEMARKERS;
private _ctrlSavesList  = _display displayCtrl IDC_SAVESLIST;

private _return = -1;

for "_i" from 0 to ((lnbSize _ctrlSavesList) select 0)-1 do {
    if ((_ctrlSavesList lnbText [_i,0]) == _editText && {(_ctrlSavesList lnbText [_i,1]) == _worldName}) exitWith {
        _return = _i
    };
};

_return
