class Display3DEN {
  class ctrlDefault;
  class ctrlDefaultText: ctrlDefault {};
  class ctrlMenu: ctrlDefaultText {};
  class ContextMenu: ctrlMenu {
    class Items {
      class Log {
        items[] = {"LogPosition", "LogClasses", "GRAD_getLoadoutsFromUnits"};
      };
      class GRAD_getLoadoutsFromUnits {
        text = "Copy Grad-Loadout to Clipboard";
        action = QUOTE([] call FUNC(createConfig));
        conditionShow = "selectedObject";
        value = 0;
      };
    };
  };
};
