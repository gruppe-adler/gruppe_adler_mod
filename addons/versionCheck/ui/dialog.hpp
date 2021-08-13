#include "defines.hpp"

class RscText;
class RscTitle;
class RscStandardDisplay;
class RscControlsGroup;
class RscStructuredText;
class RscButtonMenuCancel;

class GVAR(display): RscStandardDisplay {
    idd = 60022;

    class ControlsBackground {
        class Title: RscText
        {
            idc = -1;

            x = VERSIONCHECK_TOTALX;
            y = VERSIONCHECK_TOTALY;
            w = VERSIONCHECK_TOTALW;
            h = VERSIONCHECK_TITLEH;

            colorBackground[]=
            {
                "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
                "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
            };
        };

		class Text: RscText	{
			idc=-1;

			x = VERSIONCHECK_TOTALX;
            y = VERSIONCHECK_TEXTY;
            w = VERSIONCHECK_TOTALW;
            h = VERSIONCHECK_TEXTH;

			colorBackground[]={0,0,0,0.69999999};
		};
    };

    class Controls {
        class Title: RscTitle {
            idc = -1;

            x = VERSIONCHECK_TOTALX;
            y = VERSIONCHECK_TOTALY;
            w = VERSIONCHECK_TOTALW;
            h = VERSIONCHECK_TITLEH;

            text = "GRAD VERSIONCHECK";
        };

        class TextCG: RscControlsGroup {
			idc=2300;

            x = VERSIONCHECK_TOTALX;
            y = VERSIONCHECK_TEXTY;
            w = VERSIONCHECK_TOTALW;
            h = VERSIONCHECK_TEXTH;

			class Controls {
				class Text: RscStructuredText {
                    idc=1100;

                    x = 0;
                    y = 0;
                    w = VERSIONCHECK_TOTALW;
                    h = VERSIONCHECK_TEXTH;

					size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				};
			};
		};

		class ButtonOK: RscButtonMenuCancel {
			text="OK";

			x = VERSIONCHECK_BUTTONX;
			y = VERSIONCHECK_BUTTONY;
			w = VERSIONCHECK_BUTTONW;
			h = VERSIONCHECK_TITLEH;
		};
    };
};
