class GRAD_animalTransport {
    class Vehicles {
        class B_G_Van_01_transport_F {
            unloadPoint[] = {0, -4, -0.6};
            unloadActionPoint[] = {0, -3.5, -0.4};
            class Sheep_random_F {
                // dimensions[] = {0.45, 1.3}; // width & length
                class Positions {
                    class FrontOuterLeft {
                        offset[] = {-0.7, -1.4, -0.6};
                        // vectorDirAndUp[] = {};
                        // mempoint = "";
                        cargoIndices[] = {2, 4};
                    };
                    class FrontInnerLeft {
                        offset[] = {-0.25, -1.6, -0.6};
                        cargoIndices[] = {2, 4};
                    };
                    class FrontInnerRight {
                        offset[] = {0.2, -1.4, -0.6};
                        cargoIndices[] = {3, 5};
                    };
                    class FrontOuterRight {
                        offset[] = { 0.65, -1.6, -0.6};
                        cargoIndices[] = {3, 5};
                    };
                    class BackOuterRight {
                        offset[] = { 0.7, -3.0, -0.6};
                        cargoIndices[] = {7, 9,11};
                    };
                    class BackInnerRight {
                        offset[] = { 0.25, -2.8, -0.6};
                        cargoIndices[] = {7, 9,11};
                    };
                    class BackInnerLeft {
                        offset[] = { -0.2, -3.0, -0.6};
                        cargoIndices[] = {6, 8, 10};
                    };
                    class BackOuterLeft {
                        offset[] = { -0.65, -2.8, -0.6};
                        cargoIndices[] = {6, 8, 10};
                    };
                };
            };
        };
    };
};
