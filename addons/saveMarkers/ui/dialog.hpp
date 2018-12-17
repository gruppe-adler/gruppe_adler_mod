#include "defines.hpp"
#include "script_component.hpp"

class RscMapControl;
class RscPicture;
class RscText;
class RscTitle;
class RscActiveText;
class RscControlsGroupNoScrollbars;
class RscEdit;
class RscListNBox;
class RscButtonMenu;


class GVAR(RscDisplayMarkers) {
    access = 0;
    idd = IDD_SAVEMARKERS;
    movingEnable = 0;

    class controlsBackground {
        class map: RscMapControl {
            idc = IDC_MAP;

            x = "safezoneXAbs";
            y = "safezoneY";
            w = "safezoneWAbs";
            h = "safezoneH";
        };
    };

    class controls {

        class markersDialog: RscControlsGroupNoScrollbars {
            idc = -1;

            x = safezoneX + safezoneW - 25 * X_FACTOR;
            y = 0.9 * Y_FACTOR + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2);
            w = 20 * X_FACTOR;
            h = 22.2 * Y_FACTOR;

            deletable = 0;
            fade = 0;
            shadow = 0;
            style = 16;
            type = 15;
            moving = true;

            class controls {
                class title: RscTitle {
                    idc = -1;

                    x = 0 * X_FACTOR;
                    y = 0 * Y_FACTOR;
                    w = 20 * X_FACTOR;
                    h = 1 * Y_FACTOR;

                    sizeEx = (Y_FACTOR * 1);
                    text = "GRAD SAVE-MARKERS";
                    colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])","(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"};
                };

                class mainBackground: RscText {
                    idc = -1;

                    x = 0 * X_FACTOR;
                    y = 1.1 * Y_FACTOR;
                    w = 20 * X_FACTOR;
                    h = 20 * Y_FACTOR;

                    SizeEx = (Y_FACTOR * 1);
                    colorBackground[] = {0,0,0,0.8};
                };

                class editName: RscEdit {
                    idc = IDC_EDITNAME;

                    x = 6 * X_FACTOR;
                    y = 19.6 * Y_FACTOR;
                    w = 13.5 * X_FACTOR;
                    h = 1 * Y_FACTOR;

                    sizeEx = 0.8 * Y_FACTOR;
                };

                class saveAsText: RscText {
                    idc = -1;

                    text = "Save as:";

                    x = 0.5 * X_FACTOR;
                    y = 19.6 * Y_FACTOR;
                    w = 5.5 * X_FACTOR;
                    h = 1 * Y_FACTOR;

                    sizeEx = 0.8 * Y_FACTOR;
                    style = 1;
                };

                class savesList: RscListNBox {
                    idc = IDC_SAVESLIST;

                    x = 0.5 * X_FACTOR;
                    y = 1.6 * Y_FACTOR;
                    w = 19 * X_FACTOR;
                    h = 17.5 * Y_FACTOR;

                    sizeEx = 0.8 * Y_FACTOR;
                    columns[] = {0,0.7};

                    class ListScrollBar;
                    class ScrollBar;
                };

                class buttonCancel: RscButtonMenu {
                    idc = -1;
                    text = "Cancel";

                    action = QUOTE((findDisplay IDD_SAVEMARKERS) closeDisplay 2);

                    x = 0 * X_FACTOR;
                    y = 21.2 * Y_FACTOR;
                    w = 4.925 * X_FACTOR;
                    h = 1 * Y_FACTOR;
                };

                class buttonDelete: RscButtonMenu {
                    idc = IDC_BUTTONDELETE;

                    text = "Delete";

                    x = 5.025 * X_FACTOR;
                    y = 21.2 * Y_FACTOR;
                    w = 4.925 * X_FACTOR;
                    h = 1 * Y_FACTOR;
                };

                class buttonSave: RscButtonMenu {
                    idc = IDC_BUTTONSAVE;

                    text = "Save";

                    x = 10.050 * X_FACTOR;
                    y = 21.2 * Y_FACTOR;
                    w = 4.925 * X_FACTOR;
                    h = 1 * Y_FACTOR;
                };

                class buttonLoad: RscButtonMenu {
                    idc = IDC_BUTTONLOAD;

                    text = "Load";

                    x = 15.075 * X_FACTOR;
                    y = 21.2 * Y_FACTOR;
                    w = 4.925 * X_FACTOR;
                    h = 1 * Y_FACTOR;
                };
            };
        };
    };
};
