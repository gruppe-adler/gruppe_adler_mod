#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		ACE_isOptional = 1;
		author = "$STR_grad_Author";
		authors[] = {"fusselwurm <fusselwurm@gmail.com>"};
		name = CSTRING(COMPONENT);
		requiredAddons[] = {"cba_main","ace_main"};
		requiredVersion = 1.0;
		units[] = {};
		url = "$STR_grad_URL";
		VERSION_CONFIG;
		weapons[] = {};
	};
};

#include "CfgInGameUI.hpp"
