[(random 24) - 12] call BIS_fnc_setDate; // Randomizes time within 12 hours before or after the current time.
[random 1] call BIS_fnc_setOvercast; // Randomizes the weather.

// Note: Because this uses BIS_fncs, changes are synchronized across the network across all clients, unlike using setDate and setOvercast which only run client-side.
