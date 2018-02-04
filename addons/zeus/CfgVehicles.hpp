class CfgVehicles {
	class ace_zeus_moduleBase;

	class GVAR(moduleBase): ace_zeus_moduleBase {
		author = "$STR_grad_Author";
	};

	class GVAR(moduleSupplyDrop): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = "Supply Drop";
		function = QFUNC(moduleSupplyDrop);
	};

	class GVAR(moduleDiagnostics): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = "Diagnostics";
		curatorInfoType = QGVAR(RscModuleDiagnostics);
	};
};
