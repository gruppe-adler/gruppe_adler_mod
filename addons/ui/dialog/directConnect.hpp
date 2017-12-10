#include "directConnectDefines.hpp"

class RscButtonMenu;
class RscVignette;
class RscControlsGroupNoScrollbars;
class RscText;
class RscButtonMenuCancel;
class RscButtonMenuOK;
class RscTitle;
class RscEdit;

class RscDisplayMain {
    class Controls {
        class grad_directConnect: RscButtonMenu {
            idc = 62300;
			text = "ADLERCONNECT";
            colorBackground[]={0,0,0,0};
            colorBackground2[]={1,1,1,1};
            style="0x02 + 0xC0";
			size="1.25 * (pixelH * pixelGrid * 2)";

			x = "safezoneX + safezoneW - 50 * 2 * (pixelW * pixelGrid * 2)";
			y = "safezoneY + 2 * (pixelH * pixelGrid * 2)";
			w = "10 * 	(pixelW * pixelGrid * 2)";
			h = "2 * 	(pixelH * pixelGrid * 2)";

            action = "call compile preprocessFileLineNumbers '\x\grad\addons\ui\functions\fn_onButtonConnect.sqf'";

			class Attributes {
				align="center";
				color="#ffffff";
				font="PuristaLight";
				shadow=0;
				size=1;
			};
			class TextPos {
				left="0.1 * 2 * (pixelW * pixelGrid * 2)";
				top="0.18 * 2 * (pixelH * pixelGrid * 2)";
				right="0.1 * 2 * (pixelW * pixelGrid * 2)";
				bottom="0.18 * 2 * (pixelH * pixelGrid * 2)";
			};
        };
    };
};

class grad_RscDisplayDirectConnectPassword {
    idd = -1;
	movingEnable=0;
	enableDisplay=1;

	class ControlsBackground {
		class Vignette: RscVignette {
			idc=114998;
		};

		class TileGroup: RscControlsGroupNoScrollbars {
			idc=115099;
			x="safezoneXAbs";
			y="safezoneY";
			w="safezoneWAbs";
			h="safezoneH";

			class Controls {
				class Background: RscText {
					idc=114999;
					x=0;
					y=0;
					w="safezoneWAbs";
					h="safezoneH";
					colorBackground[]={0,0,0,0.5};
				};
			};
		};
		class RscTitleBackground: RscText {
			colorBackground[]= {
				"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
				"(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
			};
			idc=1080;
			x = GRAD_DIRECTCONNECT_TOTALX;
			y = GRAD_DIRECTCONNECT_TOTALY;
			w = GRAD_DIRECTCONNECT_TOTALW;
			h = GRAD_DIRECTCONNECT_ELEMENTH;
		};
		class MainBackground: RscText
		{
			colorBackground[]={0,0,0,0.69999999};
			idc=1082;
			x= GRAD_DIRECTCONNECT_TOTALX;
			y = GRAD_DIRECTCONNECT_MAINY;
			w = GRAD_DIRECTCONNECT_TOTALW;
			h = GRAD_DIRECTCONNECT_MAINH;
		};
	};

	class Controls {
		class Title: RscTitle {
			colorBackground[]={0,0,0,0};
			style=0;
			idc=1000;
			text = "CONNECT TO GRUPPE ADLER";
            x = GRAD_DIRECTCONNECT_TOTALX;
			y = GRAD_DIRECTCONNECT_TOTALY;
            w = GRAD_DIRECTCONNECT_TOTALW;
			h = GRAD_DIRECTCONNECT_TITLEH;
		};

        /*class Text: RscText {
            idc=1008;
            text="ENTER PASSWORD";
            x="0 * (((safezoneW / safezoneH) min 1.2) / 40)";
            y="0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            w="8 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h="1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            colorBackground[]={0,0,0,0};
        };

        class PasswordBox: RscEdit {
            idc = 1009;
            x="0 * (((safezoneW / safezoneH) min 1.2) / 40)";
            y="1.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            w="8 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h="1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
        };*/

		class ButtonCancel: RscButtonMenuCancel {
			x = GRAD_DIRECTCONNECT_TOTALX;
			y = GRAD_DIRECTCONNECT_BUTTONY;
			w = GRAD_DIRECTCONNECT_BUTTONW;
			h = GRAD_DIRECTCONNECT_ELEMENTH;
		};

		class ButtonOK: RscButtonMenuOK {
			x = GRAD_DIRECTCONNECT_BUTTONOKX;
			y = GRAD_DIRECTCONNECT_BUTTONY;
			w = GRAD_DIRECTCONNECT_BUTTONW;
			h = GRAD_DIRECTCONNECT_ELEMENTH;
		};
	};
};
