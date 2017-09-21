#include "..\defines.hpp"

class RscTitles {
    class ga_rebreatherOnLand_RscDefault {
        idd = -1;
        fadein = 0;
        fadeout = 0;
        duration = 0;
    };

	class ga_rebreatherOnLand_RscMask
	{
		idd = -1;
		movingEnable = 0;
		duration = 99999;
		fadein = 0.1;
		fadeout = 0.1;
		name = "OXYGEN MASK";
		controls[] = {"ga_rebreatherOnLand_Mask"};

			class ga_rebreatherOnLand_Mask {
	    		idc = -1;
	    		type = 0;
	    		style = 48;
	    		text = "\x\grad\addons\rebreatherOnLand\titles\mask.paa";
	    		colorBackground[] = {1,1,1,1};
	    		colorText[] = {1,1,1,1};
	    		font = "EtelkaMonospaceProBold";
	    		sizeEx = 0.05;
	    		x = safezoneX;
	    		y = safezoneY;
	    		w = safezoneW;
	    		h = safezoneH;
			};
	};

    class ga_rebreatherOnLand_RscFogIn
    {
        idd = -1;
        movingEnable = 0;
        duration = 99999;
        fadein = FOGFADE;
        fadeout = 0;
        name = "FOG FADE IN";
        controls[] = {"ga_rebreatherOnLand_Fog"};

        class ga_rebreatherOnLand_Fog
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\fog.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.6};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };

    class ga_rebreatherOnLand_RscFogOut
    {
        idd = -1;
        movingEnable = 0;
        duration = 0;
        fadein = 0;
        fadeout = FOGFADE;
        name = "FOG FADE OUT";
        controls[] = {"ga_rebreatherOnLand_Fog"};

        class ga_rebreatherOnLand_Fog
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\fog.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.6};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };

    class ga_rebreatherOnLand_RscIceIn
    {
        idd = -1;
        movingEnable = 0;
        duration = 99999;
        fadein = ICEFADE;
        fadeout = 0;
        name = "ICE FADE IN";
        controls[] = {"ga_rebreatherOnLand_Ice"};

        class ga_rebreatherOnLand_Ice
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\ice.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.6};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };

        class ga_rebreatherOnLand_Fog
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\fog.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.2};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };

    class ga_rebreatherOnLand_RscIceOut
    {
        idd = -1;
        movingEnable = 0;
        duration = 0;
        fadein = 0;
        fadeout = ICEFADE;
        name = "ICE FADE OUT";
        controls[] = {"ga_rebreatherOnLand_Ice"};

        class ga_rebreatherOnLand_Ice
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\ice.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.6};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };

        class ga_rebreatherOnLand_Fog
        {
            Idc=-1;
            type=0;
            style = 48;
            text = "\x\grad\addons\rebreatherOnLand\titles\fog.paa";
            colorBackground[] = {1,1,1,1};
            colorText[] = {1,1,1,0.2};
            font = "PuristaMedium";
            sizeEx = 0.05;
            x = safezoneX;
            y = safezoneY;
            w = safezoneW;
            h = safezoneH;
        };
    };
};
