class CfgVehicles {
    class Flag_White_F;
    class GVAR(white): Flag_White_F {
        author=AUTHOR;
        editorPreview=QPATHTOF(data\white_preview.jpg);
        displayName=CSTRING(displayName);
        class EventHandlers {
            init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\white.paa)));
        };
    };
};
