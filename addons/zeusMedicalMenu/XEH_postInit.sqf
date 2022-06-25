#include "script_component.hpp"

if (!hasInterface) exitWith {};

GVAR(target) = objNull;
GVAR(previousTarget) = objNull;
GVAR(selectedBodyPart) = 0;
GVAR(selectedCategory) = "triage";

GVAR(lastOpenedOn) = -1;
GVAR(pendingReopen) = false;

GVAR(menuPFH) = -1;

[] call FUNC(collectActions);
