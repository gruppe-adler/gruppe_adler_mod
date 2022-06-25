class RscText;
class RscButton;
class RscPicture;
class RscListBox;
class RscActivePicture;
class RscButtonMenu;
class RscControlsGroupNoScrollbars;

class ACE_Medical_Menu;
class ace_medical_gui_BodyImage;
class ace_medical_gui_TriageToggle;
class ace_medical_gui_TriageSelect: RscControlsGroupNoScrollbars {
    class controls {
        class None;
        class Minimal;
        class Delayed;
        class Immediate;
        class Deceased;
    };
};

class GVAR(TriageToggle): ace_medical_gui_TriageToggle {
    onButtonClick = QUOTE([ctrlParent (_this select 0)] call FUNC(toggleTriageSelect));
};

class GVAR(TriageSelect): ace_medical_gui_TriageSelect {
    class controls: controls {
        class None: None {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),0)] call FUNC(handleTriageSelect));
        };
        class Minimal: Minimal {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),1)] call FUNC(handleTriageSelect));
        };
        class Delayed: Delayed {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),2)] call FUNC(handleTriageSelect));
        };
        class Immediate: Immediate {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),3)] call FUNC(handleTriageSelect));
        };
        class Deceased: Deceased {
            onButtonClick = QUOTE([ARR_3(ctrlParent (_this select 0),GVAR(target),4)] call FUNC(handleTriageSelect));
        };
    };
};

class GVAR(ACE_Medical_Menu): ACE_Medical_Menu {
    onLoad = QUOTE(_this call FUNC(onMenuOpen));
    onUnload = QUOTE(_this call FUNC(onMenuClose));
    class controls {
        class TreatmentHeader: RscText {
            idc = -1;
            style = ST_CENTER;
            text =  EECSTRING(ace,medical_gui,EXAMINE_TREATMENT);
            x = POS_X(1);
            y = POS_Y(1.5);
            w = POS_W(12.33);
            h = POS_H(1);
            sizeEx = POS_H(1.2);
            colorText[] = {1, 1, 1, 0.9};
        };
        class StatusHeader: TreatmentHeader {
            text =  EECSTRING(ace,medical_gui,STATUS);
            x = POS_X(13.33);
        };
        class OverviewHeader: TreatmentHeader {
            text =  EECSTRING(ace,medical_gui,OVERVIEW);
            x = POS_X(25.66);
        };
        class HeaderLine: RscText {
            idc = -1;
            x = POS_X(1.5);
            y = POS_Y(2.6);
            w = POS_W(37);
            h = POS_H(0.03);
            colorBackground[] = {1, 1, 1, 0.5};
        };
        class Triage: RscActivePicture {
            idc = IDC_TRIAGE;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'triage');
            text = QPATHTOEF(ace,medical_gui,data\categories\triage_card.paa);
            tooltip =  EECSTRING(ace,medical_gui,ViewTriageCard);
            x = POS_X(1.5);
            y = POS_Y(2.73);
            w = POS_W(1.5);
            h = POS_H(1.5);
            color[] = {1, 1, 1, 1};
            soundClick[] = {"\a3\ui_f\data\sound\rscbutton\soundClick", 0.09, 1};
            soundEnter[] = {"\a3\ui_f\data\sound\rscbutton\soundEnter", 0.09, 1};
            soundEscape[] = {"\a3\ui_f\data\sound\rscbutton\soundEscape", 0.09, 1};
            soundPush[] = {"\a3\ui_f\data\sound\rscbutton\soundPush", 0.09, 1};
        };
        class Examine: Triage {
            idc = IDC_EXAMINE;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'examine');
            text = QPATHTOEF(ace,medical_gui,data\categories\examine_patient.paa);
            tooltip =  EECSTRING(ace,medical_gui,ExaminePatient);
            x = POS_X(3);
        };
        class Bandage: Triage {
            idc = IDC_BANDAGE;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'bandage');
            text = QPATHTOEF(ace,medical_gui,data\categories\bandage_fracture.paa);
            tooltip =  EECSTRING(ace,medical_gui,BandageFractures);
            x = POS_X(4.5);
        };
        class Medication: Triage {
            idc = IDC_MEDICATION;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'medication');
            text = QPATHTOEF(ace,medical_gui,data\categories\medication.paa);
            tooltip =  EECSTRING(ace,medical_gui,Medication);
            x = POS_X(6);
        };
        class Airway: Triage {
            idc = IDC_AIRWAY;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'airway');
            text = QPATHTOEF(ace,medical_gui,data\categories\airway_management.paa);
            tooltip =  EECSTRING(ace,medical_gui,AirwayManagement);
            x = POS_X(7.5);
        };
        class Advanced: Triage {
            idc = IDC_ADVANCED;
            onButtonClick = QUOTE(EEGVAR(ace,medical_gui,selectedCategory) = 'advanced');
            text = QPATHTOEF(ace,medical_gui,data\categories\advanced_treatment.paa);
            tooltip =  EECSTRING(ace,medical_gui,AdvancedTreatment);
            x = POS_X(9);
        };
        class TriageCard: RscListBox {
            idc = IDC_TRIAGE_CARD;
            x = POS_X(1.5);
            y = POS_Y(4.4);
            w = POS_W(12);
            h = POS_H(10);
            sizeEx = POS_H(0.7);
            colorSelect[] = {1, 1, 1, 1};
            colorSelect2[] = {1, 1, 1, 1};
            colorBackground[] = {0, 0, 0, 0.2};
            colorSelectBackground[] = {0, 0, 0, 0};
            colorSelectBackground2[] = {0, 0, 0, 0};
            colorScrollbar[] = {0.9, 0.9, 0.9, 1};
        };
        class Action1: RscButtonMenu {
            idc = IDC_ACTION_1;
            style = ST_LEFT;
            x = POS_X(1.5);
            y = POS_Y(4.4);
            w = POS_W(12);
            h = POS_H(1);
            size = POS_H(0.9);
            class Attributes {
                align = "center";
                color = "#E5E5E5";
                font = "RobotoCondensed";
                shadow = "false";
            };
        };
        class Action2: Action1 {
            idc = IDC_ACTION_2;
            y = POS_Y(5.5);
        };
        class Action3: Action1 {
            idc = IDC_ACTION_3;
            y = POS_Y(6.6);
        };
        class Action4: Action1 {
            idc = IDC_ACTION_4;
            y = POS_Y(7.7);
        };
        class Action5: Action1 {
            idc = IDC_ACTION_5;
            y = POS_Y(8.8);
        };
        class Action6: Action1 {
            idc = IDC_ACTION_6;
            y = POS_Y(9.9);
        };
        class Action7: Action1 {
            idc = IDC_ACTION_7;
            y = POS_Y(11);
        };
        class Action8: Action1 {
            idc = IDC_ACTION_8;
            y = POS_Y(12.1);
        };
        class Action9: Action1 {
            idc = IDC_ACTION_9;
            y = POS_Y(13.2);
        };
        class BodyImage: ace_medical_gui_BodyImage {};
        class SelectHead: RscButton {
            idc = -1;
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 0);
            tooltip =  EECSTRING(ace,medical_gui,SelectHead);
            x = POS_X(18.8);
            y = POS_Y(3.2);
            w = POS_W(1.4);
            h = POS_H(1.8);
            colorFocused[] = {0, 0, 0, 0};
            colorBackground[] = {0, 0, 0, 0};
            colorBackgroundActive[] = {0, 0, 0, 0};
        };
        class SelectTorso: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 1);
            tooltip =  EECSTRING(ace,medical_gui,SelectTorso);
            x = POS_X(18.4);
            y = POS_Y(5);
            w = POS_W(2.2);
            h = POS_H(3.8);
        };
        class SelectArmLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 2);
            tooltip =  EECSTRING(ace,medical_gui,SelectLeftArm);
            x = POS_X(20.6);
            y = POS_Y(5.1);
            w = POS_W(1.1);
            h = POS_H(4.6);
        };
        class SelectArmRight: SelectArmLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 3);
            tooltip =  EECSTRING(ace,medical_gui,SelectRightArm);
            x = POS_X(17.4);
        };
        class SelectLegLeft: SelectHead {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 4);
            tooltip =  EECSTRING(ace,medical_gui,SelectLeftLeg);
            x = POS_X(19.5);
            y = POS_Y(8.8);
            w = POS_W(1.1);
            h = POS_H(5.8);
        };
        class SelectLegRight: SelectLegLeft {
            onButtonClick = QUOTE(GVAR(selectedBodyPart) = 5);
            tooltip =  EECSTRING(ace,medical_gui,SelectRightLeg);
            x = POS_X(18.4);
        };
        class Injuries: TriageCard {
            idc = IDC_INJURIES;
            x = POS_X(25.66);
            w = POS_W(12.33);
        };
        class ActivityHeader: TreatmentHeader {
            text =  EECSTRING(ace,medical_gui,ACTIVITY_LOG);
            y = POS_Y(17.6);
            w = POS_W(18.5);
            sizeEx = POS_H(1);
            colorText[] = {0.6, 0.7, 1, 1};
        };
        class QuickViewHeader: ActivityHeader {
            text =  EECSTRING(ace,medical_gui,QUICK_VIEW);
            x = POS_X(19.5);
        };
        class LowerLine: HeaderLine {
            y = POS_Y(18.5);
        };
        class Activity: Injuries {
            idc = IDC_ACTIVITY;
            x = POS_X(1.5);
            y = POS_Y(18.5);
            w = POS_W(18.5);
            h = POS_H(6.5);
            colorBackground[] = {0, 0, 0, 0};
        };
        class QuickView: Activity {
            idc = IDC_QUICKVIEW;
            x = POS_X(21.5);
        };
        class TriageStatus: RscText {
            idc = IDC_TRIAGE_STATUS;
            style = ST_CENTER;
            x = POS_X(13.33);
            y = POS_Y(15.5);
            w = POS_W(12.33);
            h = POS_H(1.1);
            shadow = 0;
        };
        class TriageToggle: GVAR(TriageToggle) {};
        class TriageSelect: GVAR(TriageSelect) {};
    };
    
};
