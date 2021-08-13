class RscText;
class RscTitle;
class RscEdit;
class RscButtonMenu;
class RscCombo;

class GVAR(sendBoxTitleBase): RscTitle {
    idc = -1;
    style = 0;

    onLoad = QUOTE(_this call FUNC(setTitle));

    text = "ERROR ";
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
    };

    x = TITLE_X;
    y = TITLE_Y;
    w = TOTAL_W;
    h = ELEMENT_H;
};

class GVAR(sendBoxBGBase): RscText {
    idc = -1;

    colorBackground[] = {0, 0, 0, 0.700000};

    x = TITLE_X;
    y = EDITBOX_BG_Y;
    w = TOTAL_W;
    h = EDITBOX_BG_H;
};

class GVAR(sendBoxBase): RscEdit {
    idc = -1;
    style = 16;

    autocomplete = "";
    shadow = 0;
    font = "EtelkaMonospacePro";
    sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

    onLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxCtrl),(_this select 0)]);
    onUnLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxCtrl),nil]);

    x = EDITBOX_X;
    y = EDITBOX_Y;
    w = EDITBOX_W;
    h = EDITBOX_H;
};

class GVAR(sendBoxButtonBase): RscButtonMenu {
    idc = IDC_SENDBUTTON;

    onLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxButtonCtrl),(_this select 0)]; _this call FUNC(setSendButtonPosition));
    onUnLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxButtonCtrl),nil]);

    text = CSTRING(sendBoxButton);
    action = QUOTE(call FUNC(sendMessage));

    x = TITLE_X;
    y = SENDBUTTON_Y;
    w = TOTAL_W;
    h = ELEMENT_H;
};

class GVAR(sendBoxListboxBase): RscCombo {
    idc = -1;

    font = "EtelkaMonospacePro";
    rowHeight = 10;
    /*sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";*/

    onLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxListboxCtrl),(_this select 0)]; _this call FUNC(initListbox));
    onUnLoad = QUOTE(uiNamespace setVariable [QQGVAR(sendBoxListboxCtrl),nil]);
    onLBSelChanged = QUOTE(_this call FUNC(onRecipientChanged));

    x = TITLE_X;
    y = SENDBUTTON_Y;
    w = TOTAL_W;
    h = ELEMENT_H;
};
