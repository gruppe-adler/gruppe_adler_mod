#include "script_component.hpp"

params ["_clothes"];

private _return = "";
if !(_clothes isEqualTo []) then {
    _return = _clothes select 0;
};

_return
