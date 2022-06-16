#include "script_component.hpp"

params ["_clothes"];

diag_log str _clothes;

private _return = nil;
if (!isNil "_clothes" && {_clothes isNotEqualTo []}) then {
    _return = _clothes select 0;
};

_return
