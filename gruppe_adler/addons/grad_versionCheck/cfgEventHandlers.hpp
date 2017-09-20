class Extended_PreInit_EventHandlers {
    class grad_versionCheck {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
    };
};

class Extended_PostInit_EventHandlers {
    class grad_versionCheck {
        serverInit = QUOTE(call COMPILE_FILE(XEH_postInitServer));
        clientInit = QUOTE(if !(isServer) then { call COMPILE_FILE(XEH_postInitClient)});
    };
};
