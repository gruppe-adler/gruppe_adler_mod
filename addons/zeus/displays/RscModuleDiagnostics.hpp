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
                        class Title5: Title1 {
                            idc = -1;
                            text = "Summary window";
                            tooltip = "Show summary window.";
                            y = H_PART(4.4);
                        };
                        class SummaryWindow: PlayerFPS {
                            idc = 27005;
                            y = H_PART(4.4);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
