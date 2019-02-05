class RscText;
class RscButtonMenu;
class RscListbox;
class RscCheckBox;
class RscCombo;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;

class RscStructuredText {
    class Attributes;
};

class RscDisplayAttributes {
    class Controls {
        class Background;
        class Title;
        class Content: RscControlsGroup {
            class controls;
        };
        class ButtonOK;
        class ButtonCancel;
    };
};

class GVAR(getUnitsLoadoutsGui) {
	idd = 57834212;
	enableSimulation = 1;
	movingEnable = 0;
	fadeIn=0;
	fadeOut=1;
	duration = 10e10;
	onLoad = "";
	class ControlsBackground
	{
		class Background: RscText {
			x = safeZoneX + safeZoneW * 0.29375;
			y = safeZoneY + safeZoneH * 0.22407408;
			w = safeZoneW * 0.4125;
			h = safeZoneH * 0.55;
			colorBackground[] = {-1,-1,-1,0.4};
		};
	};
	class Controls
	{
		class LoadoutNameText: RscText {
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.24814815;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
			text = "Loadout Name:";
		};
		class LoadoutNameEdit
		{
			type = 2;
			idc = 3456;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.2962963;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02962963;
			style = 0;
			text = "NewFactionLoadout";
			autocomplete = "";
			colorBackground[] = {0.1098,0.0667,0.8392,1};
			colorDisabled[] = {0.2,0.2,0.2,1};
			colorSelection[] = {1,0,0,1};
			colorText[] = {0.8902,0.9333,0.1608,1};
			font = "PuristaMedium";
			sizeEx = (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1);
		};
		class CFRText: RscText {
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.34444445;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
			text = "CFR Class:";
		};
		class CFRList: RscListbox {
			idc = 1500;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.3925926;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
		};
		class SQLText: RscText {
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.44074075;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
			text = "SQL Class:";
		};
		class SQLList: RscListbox {
			idc = 1501;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.48518519;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
		};
		class PTLText: RscText {
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.52407408;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
			text = "PTL Class:";
		};
		class PTLList: RscListbox {
			idc = 1502;
			x = safeZoneX + safeZoneW * 0.31875;
			y = safeZoneY + safeZoneH * 0.56851852;
			w = safeZoneW * 0.3;
			h = safeZoneH * 0.02;
		};
		class ConfirmButton: RscButtonMenu {
			idc = 2400;
			text = "OK";
			x = safeZoneX + safeZoneW * 0.33125;
			y = safeZoneY + safeZoneH * 0.65925926;
			w = 0.0626562 * safezoneW;
        	h = 0.0252408 * safezoneH;
		};
		class CancelButton: RscButtonMenu {
			idc = 2401;
			text = "Cancel";
			x = safeZoneX + safeZoneW * 0.5;
			y = safeZoneY + safeZoneH * 0.65925926;
			w = 0.0626562 * safezoneW;
        	h = 0.0252408 * safezoneH;
		};
	};
};
