class RscText;
class RscTitle;
class RscEdit;
class RscButtonMenu;
class RscCombo;

class ga_adminMessages_sendBoxTitleBase: RscTitle {
    idc = -1;
    style = 0;

    onLoad = "_this call grad_adminMessages_fnc_setTitle";

    text = "ERROR ";
    colorBackground[] = {
        "(profilenamespace getvariable ['GUI_BCG_RGB_R',0.13])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.54])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.21])",
        "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.8])"
    };

    x = GA_ADMINMESSAGES_TITLE_X;
    y = GA_ADMINMESSAGES_TITLE_Y;
    w = GA_ADMINMESSAGES_TOTAL_W;
    h = GA_ADMINMESSAGES_ELEMENT_H;
};

class ga_adminMessages_sendBoxBGBase: RscText {
    idc = -1;

    colorBackground[] = {0, 0, 0, 0.700000};

    x = GA_ADMINMESSAGES_TITLE_X;
    y = GA_ADMINMESSAGES_EDITBOX_BG_Y;
    w = GA_ADMINMESSAGES_TOTAL_W;
    h = GA_ADMINMESSAGES_EDITBOX_BG_H;
};

class ga_adminMessages_sendBoxBase: RscEdit {
    idc = -1;
    style = 16;

    autocomplete = "";
    shadow = 0;
    font = "EtelkaMonospacePro";
    sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

    onLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxCtrl"",(_this select 0)]";
    onUnLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxCtrl"",nil]";

    x = GA_ADMINMESSAGES_EDITBOX_X;
    y = GA_ADMINMESSAGES_EDITBOX_Y;
    w = GA_ADMINMESSAGES_EDITBOX_W;
    h = GA_ADMINMESSAGES_EDITBOX_H;
};

class ga_adminMessages_sendBoxButtonBase: RscButtonMenu {
    idc = GA_ADMINMESSAGES_IDC_SENDBUTTON;

    onLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxButtonCtrl"",(_this select 0)]; _this call grad_adminMessages_fnc_setSendButtonPosition";
    onUnLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxButtonCtrl"",nil]";

    text = "$STR_grad_ADMINMESSAGES_SENDBOXBUTTON";
    action = "call grad_adminMessages_fnc_sendMessage";

    x = GA_ADMINMESSAGES_TITLE_X;
    y = GA_ADMINMESSAGES_SENDBUTTON_Y;
    w = GA_ADMINMESSAGES_TOTAL_W;
    h = GA_ADMINMESSAGES_ELEMENT_H;
};

class ga_adminMessages_sendBoxListboxBase: RscCombo {
    idc = -1;

    font = "EtelkaMonospacePro";
    rowHeight = 10;
    /*sizeEx = "0.7 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";*/

    onLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxListboxCtrl"",(_this select 0)]; _this call grad_adminMessages_fnc_initListbox";
    onUnLoad = "uiNamespace setVariable [""grad_adminMessages_sendBoxListboxCtrl"",nil]";
    onLBSelChanged = "_this call grad_adminMessages_fnc_onRecipientChanged";

    x = GA_ADMINMESSAGES_TITLE_X;
    y = GA_ADMINMESSAGES_SENDBUTTON_Y;
    w = GA_ADMINMESSAGES_TOTAL_W;
    h = GA_ADMINMESSAGES_ELEMENT_H;
};
