#include "script_component.hpp"

params ["","_key","","_ctrl","_alt"];

// H key
if (_key == 35) exitWith {
    [] call FUNC(toggleHelp);
};

// A key
if (_ctrl && {_key == 30}) exitWith {
    GVAR(selectedMarkers) = [_alt] call FUNC(allMarkers);
    [] call FUNC(updateButtonSave);
};
