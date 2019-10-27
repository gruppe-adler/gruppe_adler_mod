#ifndef MODULES_DIRECTORY
    #define MODULES_DIRECTORY node_modules
#endif

class GRAD_animalTransport {
    class General {
        file = MODULES_DIRECTORY\grad-animalTransport\functions;
        class findSuitableSpace {};
        class findSuitableVehicle {};
        class loadAnimal {};
        class lockCargoIndex {};
        class registerEventHandler {
            postInit = 1;
        };
        class registerInteract {
            postInit = 1;
        };
        class unloadAnimals {};
        class unloadSingleAnimal {};
        class unloadSingleAnimalDetach {};
    };
};
