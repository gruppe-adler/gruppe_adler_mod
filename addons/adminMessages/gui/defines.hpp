#define IDC_SENDBUTTON     33500
#define IDC_CUSTOMCHATTEXT 33601

#define UISIZESMALL        0.55
#define UISCALE            ((getResolution select 5)/UISIZESMALL)

#define SCALEFACTOR_Y      ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)
#define SCALESUMMAND_Y     (safezoneY)

#define SCALEFACTOR_X      (((safezoneW / safezoneH) min 1.2) / 40)
#define SCALESUMMAND_X     (safezoneX)

#define SPACER_Y           (0.1 * SCALEFACTOR_Y)

#define TITLE_Y            (1 * SCALEFACTOR_Y + SCALESUMMAND_Y)
#define TITLE_X            (1 *  SCALEFACTOR_X + SCALESUMMAND_X)

#define ELEMENT_H          (1 * SCALEFACTOR_Y)
#define TOTAL_W            (15 * SCALEFACTOR_X)

#define EDITBOX_BG_Y       (TITLE_Y + ELEMENT_H + SPACER_Y)
#define EDITBOX_BG_H       ((8 * ELEMENT_H) / UISCALE)

#define EDITBOX_PADDING_Y  ((0.5 * ELEMENT_H) / UISCALE)
#define EDITBOX_H          (EDITBOX_BG_H - 2 * EDITBOX_PADDING_Y)
#define EDITBOX_Y          (EDITBOX_BG_Y + EDITBOX_PADDING_Y)

#define EDITBOX_PADDING_X  (0.5 * (((safezoneW / safezoneH) min 1.2) / 40))
#define EDITBOX_X          (TITLE_X + EDITBOX_PADDING_X)
#define EDITBOX_W          (TOTAL_W - 2 * EDITBOX_PADDING_X)

#define SENDBUTTON_Y       (EDITBOX_BG_Y + EDITBOX_BG_H + SPACER_Y)
#define SENDBUTTON_Y_2     (EDITBOX_BG_Y + EDITBOX_BG_H + 2*SPACER_Y + ELEMENT_H)
