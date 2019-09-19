#include "script_component.hpp"

params ["_display","_key","","_ctrl","_alt"];

// user is currently typing in editName box
if (_display getVariable [QGVAR(editNameFocused),false]) exitWith {};

// H key
if (_key == 35) exitWith {
    [] call FUNC(toggleHelp);
};

// A key
if (_ctrl && {_key == 30}) exitWith {
    GVAR(selectedMarkers) = [_alt] call FUNC(allMarkers);
    [] call FUNC(updateButtonSave);
};

// close with map key
if (_key in actionKeys "hideMap") exitWith {
    _display closeDisplay 2;
};
