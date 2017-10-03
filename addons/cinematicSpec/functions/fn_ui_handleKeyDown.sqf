#include "script_component.hpp"
#include "\A3\ui_f\hpp\defineDIKCodes.inc"

private _result = _this call ACE_spectator_fnc_ui_handleKeyDown;
private _key = param [1, 0];
if (!_result) then {
    INFO_1("KeyDown, key %1", _key);
    // Handle toggling camera
    if ([] call FUNC(isAceSpectator)) then {
        if (_key == DIK_F2) exitWith {
            [] call FUNC(cam);
            true
        };
    };
};

_result
