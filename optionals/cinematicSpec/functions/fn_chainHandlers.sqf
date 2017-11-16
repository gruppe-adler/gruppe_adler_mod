#include "script_component.hpp"

private _result = false;
if (!isNil "ACE_spectator_fnc_ui_handleKeyDown") then {
    _result = _this call ACE_spectator_fnc_ui_handleKeyDown;
} else { if (!isNil "ACE_spectator_fnc_handleInterface") then {
    _result = ["onKeyDown", _this] call ACE_spectator_fnc_handleInterface;
};};

if (_this call FUNC(ui_handleKeyDown)) then {
    _result = true;
};

_result;
