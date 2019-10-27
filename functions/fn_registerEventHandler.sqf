
["GRAD_animalTransport_loadAnimal", {
    scriptName "GRAD_animalTransport_loadAnimal";
    _this call GRAD_animalTransport_fnc_loadAnimal;
}] call CBA_fnc_addEventHandler;


["GRAD_animalTransport_unloadAnimals", {
    scriptName "GRAD_animalTransport_unloadAnimals";
    _this call GRAD_animalTransport_fnc_unloadAnimals;
}] call CBA_fnc_addEventHandler;


["GRAD_animalTransport_unloadSingleAnimal", {
    scriptName "GRAD_animalTransport_unloadSingleAnimal";
    _this call GRAD_animalTransport_fnc_unloadSingleAnimal;
}] call CBA_fnc_addEventHandler;
