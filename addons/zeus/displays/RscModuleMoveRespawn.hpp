class GVAR(RscModuleMoveRespawn): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscModuleMoveRespawn)))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscModuleMoveRespawn)))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class moveRespawn: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_moduleMoveRespawn));
                    idc = 27000;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(1.5);
                    class controls {
                        class ToggleNvgTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleMoveRespawnSide);
                            toolTip = "";
                            x = H_PART(0);
                            y = H_PART(0);
                            w = W_PART(7);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class ToggleNvgCombo: RscCombo {
                            idc = 92100;
                            x = H_PART(6);
                            y = H_PART(0);
                            w = W_PART(10.1);
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
