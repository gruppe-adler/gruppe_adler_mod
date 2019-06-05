class RscStructuredText;

class RscTitles {
    class GVAR(rscCustomChat) {
        duration = 10;
        enableSimulation = 1;
        fadeIn = 0.2;
        fadeOut = 0.2;
        idd = -1;
        movingEnable = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(rscCustomChat),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(rscCustomChat),nil)]);

        class controls {
            class chatBox: RscStructuredText {
                idc = GA_ADMINMESSAGES_IDC_CUSTOMCHATTEXT;

                colorBackground[] = {0,0,0,0.3};
                font = "RobotoCondensed";
                shadow = 1;
                shadowColor[] = {0,0,0,0.5};
                size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";

                x = "(profilenamespace getvariable [""IGUI_GRID_CHAT_X"", (safezoneX + 1 * (((safezoneW / safezoneH) min 1.2) / 40))])";
                y = "(profilenamespace getvariable [""IGUI_GRID_CHAT_Y"", (safezoneY + safezoneH - 10.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
                w = "(profileNamespace getvariable [""IGUI_GRID_CHAT_W"", (30 *(((safezoneW / safezoneH) min 1.2) / 40))])";
                h = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
            };
        };
    };
};
