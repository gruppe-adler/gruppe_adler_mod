#include "script_component.hpp"

private _result = _this call ACE_spectator_fnc_ui_handleKeyDown;

if (_this call FUNC(ui_handleKeyDown)) then {
    _result = true;
};

_result;
