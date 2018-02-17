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
		displayName = CSTRING(moduleDiagnosticsName);
		curatorInfoType = QGVAR(RscModuleDiagnostics);
	};

	class GVAR(moduleToggleBFT): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = CSTRING(moduleToggleBFTName);
		function = QFUNC(moduleToggleBFT);
	};

	class GVAR(moduleReloadLoadout): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = CSTRING(moduleReloadLoadoutName);
		function = QFUNC(moduleReloadLoadout);
	};

	class GVAR(moduleSetLoadouts): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = CSTRING(moduleSetLoadoutsName);
		function = QFUNC(moduleSetLoadouts);
	};

	class GVAR(moduleMoveRespawn): GVAR(moduleBase) {
		curatorCanAttach = 1;
		category = QGVAR(Grad);
		displayName = CSTRING(moduleMoveRespawnName);
		curatorInfoType = QGVAR(RscModuleMoveRespawn);
	};
};
