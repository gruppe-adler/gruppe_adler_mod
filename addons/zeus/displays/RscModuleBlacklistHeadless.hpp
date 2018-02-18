class GVAR(RscModuleBlacklistHeadless): RscDisplayAttributes {
    onLoad = QUOTE([ARR_3('onLoad', _this, QUOTE(QGVAR(RscModuleBlacklistHeadless)))] call ace_zeus_fnc_zeusAttributes);
    onUnload = QUOTE([ARR_3('onUnload', _this, QUOTE(QGVAR(RscModuleBlacklistHeadless)))] call ace_zeus_fnc_zeusAttributes);
    class Controls: Controls {
        class Background: Background {};
        class Title: Title {};
        class Content: Content {
            class Controls {
                class blacklistHeadless: RscControlsGroupNoScrollbars {
                    onSetFocus = QUOTE(_this call FUNC(ui_moduleBlacklistHeadless));
                    idc = 27000;
                    x = 0;
                    y = 0;
                    w = W_PART(26);
                    h = H_PART(2.5);
                    class controls {
                        class BlacklistTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleBlacklistHeadlessDoBlacklist);
                            toolTip = "";
                            x = H_PART(0);
                            y = H_PART(0);
                            w = W_PART(7);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class BlacklistCheckbox: RscCheckBox {
                            idc = 84502;
                            x = H_PART(6);
                            y = H_PART(0);
                            w = W_PART(1);
                            h = H_PART(1);
                        };
                        class MoveToTitle: Title {
                            idc = -1;
                            text = CSTRING(moduleBlacklistHeadlessMoveTo);
                            toolTip = "";
                            x = H_PART(0);
                            y = H_PART(1.1);
                            w = W_PART(7);
                            colorBackground[] = {0,0,0,0.5};
                        };
                        class MoveToCombo: RscCombo {
                            idc = 84501;
                            x = H_PART(6);
                            y = H_PART(1.1);
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
