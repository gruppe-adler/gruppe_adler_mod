class CfgPatches {
	class ADDON {
        author = "$STR_grad_Author";
        name = QUOTE(ADDON);
        url = "$STR_grad_URL";
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Data_F", "A3_Weapons_F", "RHS_US_A2_AirImport"};
		units[] = {"RHS_UH1Y_base"};
		weapons[] = {};
        authors[] = {
			"nomisum <nomisum@gmail.com>"
		};
	};
};

class CfgVehicles {

    /*extern*/ class Air;
    /*extern*/ class Helicopter;
    /*extern*/ class Helicopter_Base_F;
    /*extern*/ class Heli_Light_03_base_F;
    /*extern*/ class RHS_UH1_Base;

	class RHS_UH1Y_base: RHS_UH1_Base {

        class Reflectors {

            class Middle {
                color[] = {7000, 7500, 10000, 1};
                ambient[] = {100, 100, 100, 0};
                position = "gun_begin"; /*"svetlo" == light"*/
                direction = "gun_end"; /*"svetlo konec   konec" == "end"*/
                hitpoint = "svetlo";
                selection = "svetlo";
                size = 1;
                innerAngle = 5;
                outerAngle = 15;
                coneFadeCoef = 5;
                intensity = 3000;
                useFlare = 1;
                dayLight = 0;
                FlareSize = 10;

                class Attenuation {
                    start = 1;
                    constant = 0;
                    linear = 0;
                    quadratic = 2; /*for a less abrupt fading, lower this value toward 1, and increase the linear or maybe constant part */
                };
            };
        };
    };
};