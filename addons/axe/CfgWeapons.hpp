class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class grad_axe: ACE_ItemCore {
        author = "McDiod";
        displayName = "$STR_GRAD_AXE_AXENAME";
        descriptionShort = "$STR_GRAD_AXE_AXEDESCRIPTION";
        /* model = QPATHTOF(data\ace_wirecutter.p3d); */
        picture = "x\grad\addons\axe\ui\item_axe_ca.paa";
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };
};
