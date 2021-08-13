class RscControlsGroupNoScrollbars;
class RscButton;
class RscDisplayDynamicGroups
{
    onLoad = QUOTE([""onLoad"",_this,""RscDisplayDynamicGroups"",QUOTE(QUOTE(ADDON))] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'));
    onUnload = QUOTE([""onUnload"",_this,""RscDisplayDynamicGroups"",QUOTE(QUOTE(ADDON))] call 	(uinamespace getvariable 'BIS_fnc_initDisplay'));

    scriptPath = QUOTE(ADDON);

	class controls
	{
		class SectionManage: RscControlsGroupNoScrollbars
		{
			class controls
			{
                class SelectInsigniaButton: RscButton
                {
                    colorText[] = {0,0,0,0};
                    colorDisabled[] = {0,0,0,0};
                    colorBackground[] = {0,0,0,0};
                    colorBackgroundDisabled[] = {0,0,0,0};
                    colorBackgroundActive[] = {0,0,0,0};
                    colorFocused[] = {0,0,0,0};
                    colorShadow[] = {0,0,0,0};
                    colorBorder[] = {0,0,0,0};

                    action = QUOTE(call FUNC(selectInsignia));

                    x="12.3 * (((safezoneW / safezoneH) min 1.2) / 40)";
					y="1.9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
					w="7 * (((safezoneW / safezoneH) min 1.2) / 40)";
					h="5.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
			};
		};
	};
};
