class CfgVehicles {
	class ace_zeus_moduleBase;

	class GVAR(moduleBase): ace_zeus_moduleBase {
		author = "$STR_grad_Author";
	};

	class GVAR(moduleSupplyDrop): ace_zeus_moduleBase {
		curatorCanAttach = 1;
		category = QUOTE(Curator);
		displayName = "Supply Drop";
		function = QFUNC(moduleSupplyDrop);
	};
};
