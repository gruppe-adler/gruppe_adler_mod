#include "script_component.hpp"

params ["_clothes"];

private _return = objNull;
if (_clothes isNotEqualTo []) then {
    _return = _clothes select 0;
};

_return
