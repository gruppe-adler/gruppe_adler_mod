#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class GRAD_animalTransport {
    class General {
        file = MODULES_DIRECTORY\grad-animalTransport\functions;
        class findSuitableSeat {};
        class findSuitableVehicle {};
        class getCargoPositionOffset {};
        class loadAnimal {};
        class registerEventHandler {
            postInit = 1;
        };
        class registerInteract {
            postInit = 1;
        };
        class unloadAnimals {};
    };
};
