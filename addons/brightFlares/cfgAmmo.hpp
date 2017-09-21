class CfgAmmo {
	class F_40mm_White;
	class GRAD_F_40mm_white: F_40mm_white {
		intensity = 3000000;
	};

	class GRAD_F_40mm_red: GRAD_F_40mm_white {
		lightColor[] = {0.5,0.25,0.25,0};
	};

	class GRAD_F_40mm_yellow: GRAD_F_40mm_white {
		lightColor[] = {0.5,0.5,0.25,0};
	};

	class GRAD_F_40mm_green: GRAD_F_40mm_white {
		lightColor[] = {0.25,0.5,0.25,0};
	};
};