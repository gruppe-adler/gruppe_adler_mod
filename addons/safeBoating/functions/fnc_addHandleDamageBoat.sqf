#include "script_component.hpp"

params ["_boat"];

_boat addEventHandler ['HandleDamage', FUNC(handleDamageBoat)]
