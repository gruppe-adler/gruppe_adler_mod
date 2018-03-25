class CfgVehicles
{
    class Flag_White_F;
    class QGAVR(gruppeAdlerWhite): Flag_White_F
    {
        author="$STR_grad_Author";

        editorPreview="\A3\EditorPreviews_F\Data\CfgVehicles\Flag_White_F.jpg";
        _generalMacro=QGAVR(gruppeAdlerWhite);
        displayName=CSTRING(gruppeAdlerWhite_display);
        class EventHandlers
        {
            init=QUOTE((_this select 0) setFlagTexture QPATHTOF(data\gruppeAdlerWhite.paa));
        };
    };
};
