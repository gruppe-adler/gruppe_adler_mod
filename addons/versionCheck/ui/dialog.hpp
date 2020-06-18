#include "defines.hpp"

class RscText;
class RscTitle;
class RscStandardDisplay;
class RscControlsGroup;
class RscStructuredText;
class RscButtonMenuCancel;

class grad_RscDisplayVersionCheck: RscStandardDisplay {
    idd = 60022;

    onLoad = "uiNamespace setVariable ['GVAR(display)',_this select 0]";
    onUnload = "uiNamespace setVariable ['GVAR(display)',nil]";

    class ControlsBackground {
        class Title: RscText
        {
            idc = -1;

            x = GRAD_VERSIONCHECK_TOTALX;
            y = GRAD_VERSIONCHECK_TOTALY;
            w = GRAD_VERSIONCHECK_TOTALW;
            h = GRAD_VERSIONCHECK_TITLEH;

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

			x = GRAD_VERSIONCHECK_TOTALX;
            y = GRAD_VERSIONCHECK_TEXTY;
            w = GRAD_VERSIONCHECK_TOTALW;
            h = GRAD_VERSIONCHECK_TEXTH;

			colorBackground[]={0,0,0,0.69999999};
		};
    };

    class Controls {
        class Title: RscTitle {
            idc = -1;

            x = GRAD_VERSIONCHECK_TOTALX;
            y = GRAD_VERSIONCHECK_TOTALY;
            w = GRAD_VERSIONCHECK_TOTALW;
            h = GRAD_VERSIONCHECK_TITLEH;

            text = "GRAD VERSIONCHECK";
        };

        class TextCG: RscControlsGroup {
			idc=2300;

            x = GRAD_VERSIONCHECK_TOTALX;
            y = GRAD_VERSIONCHECK_TEXTY;
            w = GRAD_VERSIONCHECK_TOTALW;
            h = GRAD_VERSIONCHECK_TEXTH;

			class Controls {
				class Text: RscStructuredText {
                    idc=1100;

                    x = 0;
                    y = 0;
                    w = GRAD_VERSIONCHECK_TOTALW;
                    h = GRAD_VERSIONCHECK_TEXTH;

					size="(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
				};
			};
		};

		class ButtonOK: RscButtonMenuCancel {
			text="OK";

			x = GRAD_VERSIONCHECK_BUTTONX;
			y = GRAD_VERSIONCHECK_BUTTONY;
			w = GRAD_VERSIONCHECK_BUTTONW;
			h = GRAD_VERSIONCHECK_TITLEH;
		};
    };
};
