class RscPicture;
class GVAR(defaultCtrl): RscPicture {
    idc = -1;
    x = safezoneX;
    y = safezoneY;
    w = safezoneW;
    h = safezoneH;
    colorBackground[] = {1,1,1,1};
};

class RscTitles {
    class GVAR(Default) {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };

	class GVAR(Mask) {
		idd = -1;
		movingEnable = 0;
		duration = 99999;
		fadein = 0.1;
		fadeout = 0.1;
        class controls {
			class mask: GVAR(defaultCtrl) {
	    		text = QPATHTOF(titles\mask.paa);
	    		colorText[] = {1,1,1,1};
			};
        };
	};

    class GVAR(FogIn) {
        idd = -1;
        movingEnable = 0;
        duration = 99999;
        fadein = FOGFADE;
        fadeout = 0;
        class controls {
            class fog: GVAR(defaultCtrl) {
                text = QPATHTOF(titles\fog.paa);
                colorText[] = {1,1,1,0.6};
            };
        };
    };

    class GVAR(FogOut) {
        idd = -1;
        movingEnable = 0;
        duration = 0;
        fadein = 0;
        fadeout = FOGFADE;
        class controls {
            class fog: GVAR(defaultCtrl) {
                text = QPATHTOF(titles\fog.paa);
                colorText[] = {1,1,1,0.6};
            };
        };

    };

    class GVAR(IceIn) {
        idd = -1;
        movingEnable = 0;
        duration = 99999;
        fadein = ICEFADE;
        fadeout = 0;
        class controls {
            class ice: GVAR(defaultCtrl) {
                text = QPATHTOF(titles\ice.paa);
                colorText[] = {1,1,1,0.6};
            };

            // class fog: GVAR(defaultCtrl) {
            //     text = QPATHTOF(titles\fog.paa);
            //     colorText[] = {1,1,1,0.2};
            // };
        };

    };

    class GVAR(IceOut) {
        idd = -1;
        movingEnable = 0;
        duration = 0;
        fadein = 0;
        fadeout = ICEFADE;
        class controls {
            class ice: GVAR(defaultCtrl) {
                text = QPATHTOF(titles\ice.paa);
                colorText[] = {1,1,1,0.6};
            };

            // class fog: GVAR(defaultCtrl) {
            //     text = QPATHTOF(titles\fog.paa);
            //     colorText[] = {1,1,1,0.2};
            // };
        };
    };
};
