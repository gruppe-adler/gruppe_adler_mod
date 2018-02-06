class RscText;
class RscButtonMenu;
class RscListbox;
class RscCheckBox;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;

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

class GVAR(RscModuleDiagnostics): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscModuleDiagnostics)))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscModuleDiagnostics)))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class globalSetSkill: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_moduleDiagnostics));
                    idc = 27000;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(6.5);
                    class controls {
                        class Title1: RscText {
                            idc = -1;
                            /* text = CSTRING(ASD); */
                            text = "Player FPS";
                            /* toolTip = CSTRING(ASD); */
                            toolTip = "Show player FPS";
                            x = 0;
                            y = 0;
                            w = W_PART(10);
                            h = H_PART(1);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class PlayerFPS: RscCheckBox {
                            idc = 27001;
                            x = W_PART(10.1);
                            y = 0;
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class Title2: Title1 {
                            idc = -1;
                            text = "Player medical status";
                            tooltip = "Show medical status of players.";
                            y = H_PART(1.1);
                        };
                        class MedicalStatus: PlayerFPS {
                            idc = 27002;
                            y = H_PART(1.1);
                        };
                        class Title3: Title1 {
                            idc = -1;
                            text = "Object locality";
                            tooltip = "Show owner of objects and units.";
                            y = H_PART(2.2);
                        };
                        class ObjectLocality: PlayerFPS {
                            idc = 27003;
                            y = H_PART(2.2);
                        };
                        class Title4: Title1 {
                            idc = -1;
                            text = "AI status";
                            tooltip = "Show combat mode, fleeing, etc.";
                            y = H_PART(3.3);
                        };
                        class AIStatus: PlayerFPS {
                            idc = 27004;
                            y = H_PART(3.3);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
