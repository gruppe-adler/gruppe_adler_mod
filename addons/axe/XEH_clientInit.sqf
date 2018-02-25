#include "script_component.hpp"

if (!hasInterface) exitWith {};

["ace_interactMenuOpened", {_this call grad_axe_fnc_interactEH}] call CBA_fnc_addEventHandler;
