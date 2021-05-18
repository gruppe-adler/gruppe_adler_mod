class CfgVehicles {

	class EGVAR(zeus,moduleBase):;
	class GVAR(handleDamageViaZeus): EGVAR(zeus,moduleBase) {
		curatorCanAttach = 1;
		category = QEGVAR(zeus,Grad);
		displayName = CSTRING(handleDamageViaZeus_displayName);
		function = QFUNC(init);
	}
};