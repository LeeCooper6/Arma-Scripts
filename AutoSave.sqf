// Define argument.
_delayTime = (_this select 0) * 60;

// Run server-side only (where saving actually occurs).
if (isServer) then {
    // Save routinely every few minutes defined by delay time.
    while {true} do {
        sleep _delayTime;
        saveGame;
    };
};

// Note: In order to save, the game temporarily pauses on the server and all clients to save the state of everything without producing bizarre time-warping artifacts (no, I'm not exaggerating, it would literally warp in-game spacetime). On the server (if it is a player), the screen will display a filter with text saying something to the effect of "Saving game... please wait." However, on other clients, the game simply stops and displays no text, so most players perceive this to be an unwanted moment of severe "lag" and will tell you so when it is actually an intentional pause in order to save the game. Still, it provides a poor user experience, so it's best to minimize the amount of unnecessary saving in order to minimize the number of pauses which will be perceived as "lag spikes."
