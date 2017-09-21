#include "..\defines.hpp"

player addEventHandler ["TAKE", {if (_this select 2 in MASKVESTS) then {[true] call grad_rebreatherOnLand_fnc_maskEffect}}];
player addEventHandler ["PUT", {if (_this select 2 in MASKVESTS) then {[false] call grad_rebreatherOnLand_fnc_maskEffect}}];
