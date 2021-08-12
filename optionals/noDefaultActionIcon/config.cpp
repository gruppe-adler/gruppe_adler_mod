#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		ACE_isOptional = 1;
		author = "$STR_GRAD_MOD_AUTHOR";
		authors[] = {"fusselwurm <fusselwurm@gmail.com>"};
		name = CSTRING(COMPONENT);
		requiredAddons[] = {"cba_main","ace_main"};
		requiredVersion = 1.0;
		units[] = {};
		url = "$STR_GRAD_MOD_URL";
		VERSION_CONFIG;
		weapons[] = {};
	};
};

#include "CfgInGameUI.hpp"
