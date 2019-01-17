class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
          class Log {
            items[] += {"GRAD_getLoadoutsFromUnits"};
          };
          class GRAD_getLoadoutsFromUnits {
            text = "get Grad Loadout";
  					value = 0;
  					action = QUOTE([] call FUNC(createConfig););
          };
        };
    };
};
