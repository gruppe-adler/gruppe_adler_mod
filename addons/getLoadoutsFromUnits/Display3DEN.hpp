class ctrlMenu;
class Display3DEN {
    class ContextMenu: ctrlMenu {
        class Items {
            class Log {
                items[] += {QUOTE(ADDON)};
            };
            class ADDON {
                text = "Copy Grad-Loadout to Clipboard";
                action = QUOTE([] call FUNC(createConfig));
                conditionShow = "selectedObject";
                value = 0;
            };
        };
    };
};
