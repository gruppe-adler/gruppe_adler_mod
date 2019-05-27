class GVAR(RscModuleSetLoadouts): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscModuleSetLoadouts)))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscModuleSetLoadouts)))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class setLoadouts: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_moduleSetLoadouts));
                    idc = 27000;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(4.5);
                    class controls {
                        class SelectSideTitle: Title {
                            idc = -1;
                            text = CSTRING(side);
                            toolTip = "";
                            x = H_PART(0);
                            y = H_PART(0);
                            w = W_PART(7);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class SelectSideCombo: RscCombo {
                            idc = 84210;
                            x = H_PART(6);
                            y = H_PART(0);
                            w = W_PART(10.1);
                            h = H_PART(1);
                        };
                        class SelectFactionTitle: SelectSideTitle {
                            text = CSTRING(faction);
                            y = H_PART(1.1);
                        };
                        class SelectFactionCombo: SelectSideCombo {
                            idc = 84211;
                            y = H_PART(1.1);
                        };
                        class SelectLoadoutTitle: SelectSideTitle {
                            text = CSTRING(loadouts);
                            y = H_PART(2.2);
                        };
                        class SelectLoadoutCombo: SelectSideCombo {
                            idc = 84212;
                            y = H_PART(2.2);
                        };
                        class ReapplyTitle: SelectSideTitle {
                            text = CSTRING(moduleSetLoadoutsReapply);
                            y = H_PART(3.3);
                        };
                        class ReapplyCheckbox: RscCheckBox {
                            idc = 84213;
                            x = H_PART(6);
                            y = H_PART(3.3);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                    };
                };
            };
        };
        class ButtonOK: ButtonOK {};
        class ButtonCancel: ButtonCancel {};
    };
};
