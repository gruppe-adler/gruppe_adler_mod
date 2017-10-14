#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_grad_Author";
		name = CSTRING(component);
		url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"grad_main"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
		authors[] = {"[A] Fusselwurm <fusselwurm@gmail.com>"};
	};
};

#include "cfgFunctions.hpp"

class ACE_spectator_display {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};
class ACE_spectator_interface {
	onKeyDown = "_this call GRAD_cinematicSpec_fnc_chainHandlers";
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};
