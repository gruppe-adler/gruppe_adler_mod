#include "script_component.hpp"
#include "..\ui\defines.hpp"

params ["_display"];

if (isNil "_display") then {
    _display = findDisplay IDD_SAVEMARKERS;
};

private _editText = ctrlText (_display displayCtrl IDC_EDITNAME);
private _enabled = (count _editText > 0) && {count GVAR(selectedMarkers) > 0};

[IDC_BUTTONSAVE,_enabled] call FUNC(setButtonEnabled);
