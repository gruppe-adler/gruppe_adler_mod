#include "script_component.hpp"

class CfgPatches
{
	class ADDON {
		author = "$STR_grad_Author";
		name = QUOTE(ADDON);
		url = "$STR_grad_URL";
		requiredVersion = 0.1;
		requiredAddons[] = {"grad_main","ace_medical"};
		units[] = {};
		weapons[] = {};
		VERSION_CONFIG;
    authors[] = {"Salbei [A]"};
	};
};

#include <CfgEventHandlers.hpp>
