class CfgAmmo {
    class FlareBase;
    class F_40mm_White: FlareBase {
        intensity = 1500000;
    };
    class F_40mm_Yellow: F_40mm_White {};
    class F_40mm_Red: F_40mm_White {};
    class F_40mm_Green: F_40mm_White {};

    class FlareCore;
    class Flare_82mm_AMOS_White: FlareCore {
        intensity = 4000000;
    };

    class SmokeShell;
    class G_40mm_Smoke: SmokeShell
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.4;
    };
    
    class rhs_40mm_smoke_white: SmokeShell
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.4;
    };

    class SmokeShellRed;
    class rhs_40mm_smoke_red: SmokeShellRed
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.4;
    };

    class SmokeShellGreen;
    class rhs_40mm_smoke_green: SmokeShellGreen
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.4;
    };

    class SmokeShellYellow;
    class rhs_40mm_smoke_yellow: SmokeShellYellow
    {
        simulation = "shotSmoke";
        deflectionSlowDown = 0.4;
    };
};
