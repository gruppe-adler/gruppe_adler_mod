class Extended_PreInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_preInitClient));
        Init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_postInitClient));
    };
};