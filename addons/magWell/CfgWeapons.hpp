class CfgWeapons {

	class gm_machineGun_base;
	class gm_mg3_base: gm_machineGun_base {
		magazineWell[] += {"CBA_762x51_MG3"};
	};

	class gm_rifle_base;
	class gm_g3_base: gm_rifle_base {
		magazineWell[] += {"CBA_762x51_G3"};
	};


	class hlc_MG42_base;
	class hlc_lmg_MG3: hlc_MG42_base {
		magazineWell[] += {"gm_magazineWell_762x51mm_mg3"};
	};

	class Rifle_Base_F;
	class hlc_g3_base: Rifle_Base_F {
		magazineWell[] += {"gm_magazineWell_762x51mm_g3"};
	};
};