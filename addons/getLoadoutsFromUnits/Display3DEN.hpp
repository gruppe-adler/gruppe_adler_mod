class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
          class Log {
            items[] += {"GRAD_getLoadoutsFromUnits"};
          };
          class GRAD_getLoadoutsFromUnits {
            text = "Copy Grad-Loadout to Clipboard";
  					value = 0;
  					action = QUOTE([] call FUNC(createConfig););
          };
        };
    };
};
