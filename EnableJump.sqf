// Add briefing record to inform the player of the controls used to jump.
player createDiarySubject ["Custom Controls", "Custom Controls"];
player createDiaryRecord ["Custom Controls", ["Jump", format ["Jump: %1 + %2", (actionKeysNames "GetOver"), (actionKeysNames "Turbo")]]];

while {alive player} do { // Run while the player is alive...
    waitUntil {inputAction "GetOver" == 1 && inputAction "Turbo" == 1}; // Wait until the player presses their Vault and Sprint keys at the same time, then jump.
    player switchMove "AovrPercMrunSrasWrflDf";
    waitUntil {inputAction "GetOver" != 1 || inputAction "Turbo" != 1}; // Wait until the player stops pressing their Vault and Sprint keys at the same time (otherwise, if the player just holds the buttons down, they will jump infinitely).
};

// Note: This script uses whatever the player's Vault and Sprint keys are mapped to, so it supports custom key mappings.
