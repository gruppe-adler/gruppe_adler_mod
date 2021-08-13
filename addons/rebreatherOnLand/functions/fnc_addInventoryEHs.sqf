#include "script_component.hpp"

player addEventHandler ["TAKE", {if (_this select 2 in MASKVESTS) then {[true] call FUNC(maskEffect)}}];
player addEventHandler ["PUT", {if (_this select 2 in MASKVESTS) then {[false] call FUNC(maskEffect)}}];
