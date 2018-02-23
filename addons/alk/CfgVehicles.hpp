class CfgVehicles
{
	class Man;
	class CAManBase: Man
	{
		class ACE_Actions
		{
			#include "ACE_Actions.hpp"
		};
	};
	
    class Item_Base_F;
	class GRAD_alkItem: Item_Base_F {
        scope = 2;
        scopeCurator = 2;
        displayName = $STR_GRAD_ALK_ITEM_DISPLAY;
        vehicleClass = "Items";
        class TransportItems {
            MACRO_ADDITEM(GRAD_ALK,1);
        };
    };
};
