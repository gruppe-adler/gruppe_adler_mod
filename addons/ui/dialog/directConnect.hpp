#include "directConnectDefines.hpp"

class RscButtonMenu;
class RscVignette;
class RscControlsGroupNoScrollbars;
class RscText;
class RscButtonMenuCancel;
class RscButtonMenuOK;
class RscTitle;
class RscEdit;
class RscPictureKeepAspectAllowPixelSplit;

class RscDisplayMain {
    class Controls {
        class GVAR(directConnectLogo): RscPictureKeepAspectAllowPixelSplit {
            text = "\x\grad\addons\ui\dialog\logo_128.paa";

            x = GRAD_DIRECTCONNECT_LOGOX;
            y = "safezoneY + 2.15 * (pixelH * pixelGrid * 2)";
            w = "2.00 * (pixelH * pixelGrid * 2)";
            h = "1.70 * (pixelH * pixelGrid * 2)";
        };

        class GVAR(directConnectButton): RscButtonMenu {
            idc = 62300;
            colorBackground[]={0,0,0,0};
            colorBackground2[]={1,1,1,1};
            style="0x02 + 0xC0";
            size="1.25 * (pixelH * pixelGrid * 2)";

            text = "ERROR SETTING TEXT";
            onLoad = "_this call compile preprocessFileLineNumbers '\x\grad\addons\ui\functions\directConnect\fn_onLoadButtonConnect.sqf'";

            x = GRAD_DIRECTCONNECT_X;
            y = "safezoneY + 2 * (pixelH * pixelGrid * 2)";
            w = "9 * (pixelW * pixelGrid * 2)";
            h = "2 * (pixelH * pixelGrid * 2)";

            action = "call compile preprocessFileLineNumbers '\x\grad\addons\ui\functions\directConnect\fn_onButtonConnect.sqf'";

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

class GVAR(RscDisplayDirectConnectPassword) {
    idd = -1;
    movingEnable=0;
    enableDisplay=1;
    onLoad = "_this call (uiNamespace getVariable 'grad_ui_fnc_onLoadRscDisplayDirectConnectPassword')";

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
            colorBackground[] = {0,0,0,0};
            style = 0;
            idc = 1000;
            text="$STR_GRAD_UI_DIRECTCONNECTPASSWORDWINDOWTITLE";

            x = GRAD_DIRECTCONNECT_TOTALX;
            y = GRAD_DIRECTCONNECT_TOTALY;
            w = GRAD_DIRECTCONNECT_TOTALW;
            h = GRAD_DIRECTCONNECT_ELEMENTH;
        };

        class Text: RscText {
            idc = GRAD_DIRECTCONNECT_IDC_PASSWORDTEXT;
            text = "";
            x = GRAD_DIRECTCONNECT_CONTENTX;
            y = GRAD_DIRECTCONNECT_MAINY + GRAD_DIRECTCONNECT_PADDINGY;
            w = GRAD_DIRECTCONNECT_CONTENTW;
            h = GRAD_DIRECTCONNECT_TEXTBOXH;
            colorBackground[]={0,0,0,0};
        };

        class PasswordText: RscText {
            idc = -1;
            text = "PASSWORD";
            x = GRAD_DIRECTCONNECT_CONTENTX;
            y = GRAD_DIRECTCONNECT_MAINY + GRAD_DIRECTCONNECT_PADDINGY + GRAD_DIRECTCONNECT_TEXTBOXH + GRAD_DIRECTCONNECT_PADDINGY;
            w = GRAD_DIRECTCONNECT_XSCALE * 5;
            h = GRAD_DIRECTCONNECT_ELEMENTH;
            colorBackground[] = {0,0,0,0};
        };

        class PasswordBox: RscEdit {
            idc = GRAD_DIRECTCONNECT_IDC_PASSWORD;

            x = GRAD_DIRECTCONNECT_CONTENTX + GRAD_DIRECTCONNECT_XSCALE * 5.5;
            y = GRAD_DIRECTCONNECT_MAINY + GRAD_DIRECTCONNECT_PADDINGY + GRAD_DIRECTCONNECT_TEXTBOXH + GRAD_DIRECTCONNECT_PADDINGY;
            w = GRAD_DIRECTCONNECT_CONTENTW - GRAD_DIRECTCONNECT_XSCALE * 5.5;
            h = GRAD_DIRECTCONNECT_ELEMENTH;
        };

        class ButtonCancel: RscButtonMenuCancel {
            x = GRAD_DIRECTCONNECT_TOTALX;
            y = GRAD_DIRECTCONNECT_BUTTONY;
            w = GRAD_DIRECTCONNECT_BUTTONW;
            h = GRAD_DIRECTCONNECT_ELEMENTH;
        };

        class ButtonOK: RscButtonMenu {
            x = GRAD_DIRECTCONNECT_BUTTONOKX;
            y = GRAD_DIRECTCONNECT_BUTTONY;
            w = GRAD_DIRECTCONNECT_BUTTONW;
            h = GRAD_DIRECTCONNECT_ELEMENTH;

            text = "OK";
            style = 16;
            shortcuts[] = {28,156};

            onButtonClick = "_this call (uiNamespace getVariable 'grad_ui_fnc_onButtonPasswordOK')";
        };
    };
};
