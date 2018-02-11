//summary window settings
#define SUMMARYWINDOW_H             (H_PART(5))
#define COLUMNS_NUMBER              4
#define COLUMN_W                    W_PART(7)
#define ROWS_NUMBER                 3
#define ROW_H                       H_PART(1)
#define PADDING_X                   W_PART(3.0)
#define PADDING_Y                   H_PART(1)

//summary window dependent dimensions
#define SUMMARYWINDOW_W             (safeZoneW - W_PART(25))
#define SUMMARYWINDOW_X             (safezoneX + W_PART(12.5))
#define SUMMARYWINDOW_Y             (safezoneY + safezoneH - H_PART(0.5) - SUMMARYWINDOW_H)
#define COLUMN_X(columnID)          (PADDING_X + columnID * (COLUMN_W + ((SUMMARYWINDOW_W - 2 * PADDING_X - COLUMNS_NUMBER * COLUMN_W) / ((COLUMNS_NUMBER - 1) max 1))))
#define ROW_Y(rowID)                (PADDING_Y + rowID * (ROW_H + ((SUMMARYWINDOW_H - 2 * PADDING_Y - ROWS_NUMBER * ROW_H) / ((ROWS_NUMBER - 1) max 1))))


class RscDisplayCurator {
    class Controls {

        //remove watermark
        class Watermark {};

        //summary window for diagnostics module
        class GVAR(SummaryWindow): RscControlsGroupNoScrollbars {
            idc = -1;

            onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(summaryWindowCtrlGrp),_this select 0)]; (_this select 0) ctrlShow (GVAR(DiagnosticsSettings) select 4));
            onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(summaryWindowCtrlGrp),nil)]);

            x = SUMMARYWINDOW_X;
            y = SUMMARYWINDOW_Y;
            w = SUMMARYWINDOW_W;
            h = SUMMARYWINDOW_H;

            class Controls {
                class Background: RscText {
                    idc = -1;
                    shadow = 2;
                    colorShadow[] = {0,0,0,1};
                    x = 0;
                    y = 0;
                    w = SUMMARYWINDOW_W;
                    h = SUMMARYWINDOW_H;
                    colorBackground[] = {0.100000, 0.100000, 0.100000, 0.500000};
                };

                //column 0 =====================================================
                class content_0_0: RscStructuredText {
                    idc = 95000;
                    text = CSTRING(players);
                    x = COLUMN_X(0);
                    y = ROW_Y(0);
                    w = COLUMN_W;
                    h = ROW_H;
                    class Attributes: Attributes {};
                };

                class content_value_0_0: content_0_0 {
                    idc = 96000;
                    text = "";
                    class Attributes: Attributes {
                        align = "right";
                    };
                };

                class content_0_1: content_0_0 {
                    idc = 95001;
                    text = CSTRING(avgFPS);
                    x = COLUMN_X(0);
                    y = ROW_Y(1);
                };

                class content_value_0_1: content_value_0_0 {
                    idc = 96001;
                    x = COLUMN_X(0);
                    y = ROW_Y(1);
                };

                /* class content_0_2: content_0_0 {
                    idc = 95002;
                    x = COLUMN_X(0);
                    y = ROW_Y(2);
                };

                class content_value_0_2: content_value_0_0 {
                    idc = 96002;
                    x = COLUMN_X(0);
                    y = ROW_Y(2);
                }; */

                //column 1 =====================================================
                class content_1_0: content_0_0 {
                    idc = 95010;
                    text = CSTRING(conscious);
                    x = COLUMN_X(1);
                    y = ROW_Y(0);
                };

                class content_value_1_0: content_value_0_0 {
                    idc = 96010;
                    x = COLUMN_X(1);
                    y = ROW_Y(0);
                };

                class content_1_1: content_0_0 {
                    idc = 95011;
                    text = CSTRING(unconscious);
                    x = COLUMN_X(1);
                    y = ROW_Y(1);
                };

                class content_value_1_1: content_value_0_0 {
                    idc = 96011;
                    x = COLUMN_X(1);
                    y = ROW_Y(1);
                };

                class content_1_2: content_0_0 {
                    idc = 95012;
                    text = CSTRING(injured);
                    x = COLUMN_X(1);
                    y = ROW_Y(2);
                };

                class content_value_1_2: content_value_0_0 {
                    idc = 96012;
                    x = COLUMN_X(1);
                    y = ROW_Y(2);
                };

                //column 2 =====================================================
                class content_2_0: content_0_0 {
                    idc = 95020;
                    text = CSTRING(aiUnits);
                    x = COLUMN_X(2);
                    y = ROW_Y(0);
                };

                class content_value_2_0: content_value_0_0 {
                    idc = 96020;
                    x = COLUMN_X(2);
                    y = ROW_Y(0);
                };

                class content_2_1: content_0_0 {
                    idc = 95021;
                    text = CSTRING(aiGroups);
                    x = COLUMN_X(2);
                    y = ROW_Y(1);
                };

                class content_value_2_1: content_value_0_0 {
                    idc = 96021;
                    x = COLUMN_X(2);
                    y = ROW_Y(1);
                };

                /* class content_2_2: content_0_0 {
                    idc = 95022;
                    x = COLUMN_X(2);
                    y = ROW_Y(2);
                };

                class content_value_2_2: content_value_0_0 {
                    idc = 96022;
                    x = COLUMN_X(2);
                    y = ROW_Y(2);
                }; */

                //column 3 =====================================================
                class content_3_0: content_0_0 {
                    idc = 95030;
                    text = "";
                    x = COLUMN_X(3);
                    y = ROW_Y(0);
                };

                class content_value_3_0: content_value_0_0 {
                    idc = 96030;
                    x = COLUMN_X(3);
                    y = ROW_Y(0);
                };

                class content_3_1: content_0_0 {
                    idc = 95031;
                    text = "";
                    x = COLUMN_X(3);
                    y = ROW_Y(1);
                };

                class content_value_3_1: content_value_0_0 {
                    idc = 96031;
                    x = COLUMN_X(3);
                    y = ROW_Y(1);
                };

                class content_3_2: content_0_0 {
                    idc = 95032;
                    text = "";
                    x = COLUMN_X(3);
                    y = ROW_Y(2);
                };

                class content_value_3_2: content_value_0_0 {
                    idc = 96032;
                    x = COLUMN_X(3);
                    y = ROW_Y(2);
                };
            };
        };
    };
};
