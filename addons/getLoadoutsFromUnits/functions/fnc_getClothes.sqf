#include "script_component.hpp"
params ["_clothes"];
diag_log format ["GRAD_TEST: %1", _clothes];
private _return = "";
if !(_clothes isEqualTo []) then {
    _return = _clothes select 0;
};

_return
