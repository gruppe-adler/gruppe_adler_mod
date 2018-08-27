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
            text = QPATHTOF(dialog\logo_128.paa);

            x = DIRECTCONNECT_LOGOX;
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
            onLoad = QUOTE(_this call (uiNamespace getVariable QQFUNC(onLoadButtonConnect)));

            x = DIRECTCONNECT_X;
            y = "safezoneY + 2 * (pixelH * pixelGrid * 2)";
            w = "9 * (pixelW * pixelGrid * 2)";
            h = "2 * (pixelH * pixelGrid * 2)";

            action = QUOTE(call (uiNamespace getVariable QQFUNC(onButtonConnect)));
            onMouseButtonClick = QUOTE(_this call (uiNamespace getVariable QQFUNC(onButtonConnect_rightClick)));

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
    onLoad = QUOTE(_this call (uiNamespace getVariable QQFUNC(onLoadRscDisplayDirectConnectPassword)));

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
            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_TOTALY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_ELEMENTH;
        };
        class MainBackground: RscText
        {
            colorBackground[]={0,0,0,0.69999999};
            idc=1082;
            x= DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_MAINY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_MAINH;
        };
    };

    class Controls {
        class Title: RscTitle {
            colorBackground[] = {0,0,0,0};
            style = 0;
            idc = 1000;
            text= CSTRING(DIRECTCONNECTPASSWORDWINDOWTITLE);

            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_TOTALY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class Text: RscText {
            idc = DIRECTCONNECT_IDC_PASSWORDTEXT;
            text = "";
            x = DIRECTCONNECT_CONTENTX;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_CONTENTW;
            h = DIRECTCONNECT_TEXTBOXH;
            colorBackground[]={0,0,0,0};
        };

        class PasswordText: RscText {
            idc = -1;
            text = "PASSWORD";
            x = DIRECTCONNECT_CONTENTX;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY + DIRECTCONNECT_TEXTBOXH + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_XSCALE * 5;
            h = DIRECTCONNECT_ELEMENTH;
            colorBackground[] = {0,0,0,0};
        };

        class PasswordBox: RscEdit {
            idc = DIRECTCONNECT_IDC_PASSWORD;

            x = DIRECTCONNECT_CONTENTX + DIRECTCONNECT_XSCALE * 5.5;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY + DIRECTCONNECT_TEXTBOXH + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_CONTENTW - DIRECTCONNECT_XSCALE * 5.5;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class ButtonCancel: RscButtonMenuCancel {
            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_BUTTONY;
            w = DIRECTCONNECT_BUTTONW;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class ButtonOK: RscButtonMenu {
            x = DIRECTCONNECT_BUTTONOKX;
            y = DIRECTCONNECT_BUTTONY;
            w = DIRECTCONNECT_BUTTONW;
            h = DIRECTCONNECT_ELEMENTH;

            text = "OK";
            style = 16;
            shortcuts[] = {28,156};

            onButtonClick = QUOTE(_this call (uiNamespace getVariable QQFUNC(onButtonPasswordOK)));
        };
    };
};


class GVAR(RscDisplayDirectConnectPort) {
    idd = -1;
    movingEnable=0;
    enableDisplay=1;
    //onLoad = QUOTE(_this call (uiNamespace getVariable QQFUNC(onLoadRscDisplayDirectConnectPassword)));

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
            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_TOTALY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_ELEMENTH;
        };
        class MainBackground: RscText
        {
            colorBackground[]={0,0,0,0.69999999};
            idc=1082;
            x= DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_MAINY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_MAINH;
        };
    };

    class Controls {
        class Title: RscTitle {
            colorBackground[] = {0,0,0,0};
            style = 0;
            idc = 1000;
            text= CSTRING(DIRECTCONNECTPASSWORDWINDOWTITLE);

            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_TOTALY;
            w = DIRECTCONNECT_TOTALW;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class Text: RscText {
            idc = DIRECTCONNECT_IDC_PASSWORDTEXT;
            text = CSTRING(DIRECTCONNECTPORTTEXT);
            x = DIRECTCONNECT_CONTENTX;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_CONTENTW;
            h = DIRECTCONNECT_TEXTBOXH;
            colorBackground[]={0,0,0,0};
        };

        class PortText: RscText {
            idc = -1;
            text = "PORT";
            x = DIRECTCONNECT_CONTENTX;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY + DIRECTCONNECT_TEXTBOXH + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_XSCALE * 5;
            h = DIRECTCONNECT_ELEMENTH;
            colorBackground[] = {0,0,0,0};
        };

        class PortBox: RscEdit {
            idc = DIRECTCONNECT_IDC_PASSWORD;
            text="2302";
            x = DIRECTCONNECT_CONTENTX + DIRECTCONNECT_XSCALE * 5.5;
            y = DIRECTCONNECT_MAINY + DIRECTCONNECT_PADDINGY + DIRECTCONNECT_TEXTBOXH + DIRECTCONNECT_PADDINGY;
            w = DIRECTCONNECT_CONTENTW - DIRECTCONNECT_XSCALE * 5.5;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class ButtonCancel: RscButtonMenuCancel {
            x = DIRECTCONNECT_TOTALX;
            y = DIRECTCONNECT_BUTTONY;
            w = DIRECTCONNECT_BUTTONW;
            h = DIRECTCONNECT_ELEMENTH;
        };

        class ButtonOK: RscButtonMenu {
            x = DIRECTCONNECT_BUTTONOKX;
            y = DIRECTCONNECT_BUTTONY;
            w = DIRECTCONNECT_BUTTONW;
            h = DIRECTCONNECT_ELEMENTH;

            text = "OK";
            style = 16;
            shortcuts[] = {28,156};

            onButtonClick = QUOTE(_this call (uiNamespace getVariable QQFUNC(onButtonPortOK)));
        };
    };
};
