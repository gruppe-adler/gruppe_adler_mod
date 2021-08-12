#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_GRAD_MOD_AUTHOR";
		name = CSTRING(component);
		url = "$STR_GRAD_MOD_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main","ace_spectator"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
		authors[] = {"[A] Fusselwurm <fusselwurm@gmail.com>"};
	};
};

#include "cfgEventHandlers.hpp"
#include "cfgFunctions.hpp"

class ACE_spectator_display {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};
class ACE_spectator_interface {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};
