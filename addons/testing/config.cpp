#include "script_component.hpp"

class CfgPatches {
	class ADDON {
		author = "$STR_GRAD_MOD_AUTHOR";
		name = QUOTE(ADDON);
		url = "$STR_GRAD_MOD_URL";
		requiredAddons[] = {};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
		authors[] = {"Fusselwurm"};
	};
};

#include "CfgEventHandlers.hpp"
