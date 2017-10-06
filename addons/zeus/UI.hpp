class RscText;
class RscButtonMenu;
class RscListbox;

class GVAR(moduleSupplyDrop) {
    idd = 3646235;
    movingEnable = true;

    class controlsBackground {
        class Title: RscText {
        	text = "Supply drop";
        	x = 0.360781 * safezoneW + safezoneX;
        	y = 0.214 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.022 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.7};
        };

        class Background: RscText {
        	x = 0.360781 * safezoneW + safezoneX;
        	y = 0.236 * safezoneH + safezoneY;
        	w = 0.262969 * safezoneW;
        	h = 0.528 * safezoneH;
        	colorBackground[] = {-1,-1,-1,0.4};
        };
    };

    class controls {
        class PlaneList: RscListbox {
        	idc = 1500;
        	x = 0.365937 * safezoneW + safezoneX;
        	y = 0.247 * safezoneH + safezoneY;
        	w = 0.252656 * safezoneW;
        	h = 0.506 * safezoneH;
        };

        class ConfirmButton: RscButtonMenu {
        	idc = 2400;
        	text = "Anfordern";
        	x = 0.561615 * safezoneW + safezoneX;
        	y = 0.76713 * safezoneH + safezoneY;
        	w = 0.0626562 * safezoneW;
        	h = 0.0252408 * safezoneH;
        };

        class AbortButton: RscButtonMenu {
        	idc = 2401;
        	text = "Abbrechen";
        	x = 0.497395 * safezoneW + safezoneX;
        	y = 0.766667 * safezoneH + safezoneY;
        	w = 0.0626562 * safezoneW;
        	h = 0.0252408 * safezoneH;
        };
    };
};
