class CfgVehicles
{
    class Flag_White_F;
    class GVAR(gruppeAdlerWhite): Flag_White_F
    {
        author="$STR_GRAD_MOD_AUTHOR";

        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Flag_White_F.jpg";
        _generalMacro=QGVAR(gruppeAdlerWhite);
        displayName=CSTRING(gruppeAdlerWhite_display);
        class EventHandlers
        {
            init=QUOTE((_this select 0) setFlagTexture QUOTE(QPATHTOF(data\gruppeAdlerWhite.paa)));
        };
    };
};
