class CfgWeapons {
    class CBA_MiscItem_ItemInfo;
    class ACE_ItemCore;

    class ADDON: ACE_ItemCore {
        author = "McDiod";
        displayName = CSTRING(displayName);
        descriptionShort = CSTRING(description);
        model = "\A3\Structures_F\Items\Tools\Axe_F.p3d";
        picture = QPATHTOF(ui\item_axe_ca.paa);
        scope = 2;
        class ItemInfo: CBA_MiscItem_ItemInfo {
            mass = 25;
        };
    };
};
