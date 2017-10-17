#include "script_component.hpp"

private _stHudEnabled = !(isNil "STHud_UIMode");
private _newState = param [0, true];

if (!_stHudEnabled) exitWith {};

if (_newState) then {
    STHud_UIMode = GVAR(stUIMode);
} else {
    GVAR(stUIMode) = STHud_UIMode;
    STHud_UIMode = 0;
};
