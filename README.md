# How to Use Arma Scripts

Using scripts in Arma is a simple three-step process.

1. Download the script.
2. Place the script in your mission folder.
3. Execute the script.

## 1. Download or Copy the Script

You can download my scripts here, or you can make your own script, copy my code, and paste it in your script. Either way works when done correctly, but if you're the non-technical (non-programmer) sort, then downloading it is much more likely to work.

## 2. Place the Script in Your Mission Folder

Place the script you want to use in the mission folder of the mission you want to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

## 3. Execute the Script

Execute the script with code like this:

<code>null = [requiredArguments] execVM "scriptName.sqf";</code>

<code>requiredArguments</code> are parameters and settings you send the script to tell it how to work and what to do. These custom settings allow you to change the way the script behaves so it works better in your mission. However, every script requires different arguments; some require very complex arrays of arguments while others require none at all. All my scripts are thoroughly documented here to explain precisely what you have to write to make each script work the way you want it to.

<code>execVM</code> executes .sqf files, while <code>exec</code> executes .sqs files. You'll only find .sqf files here and so you'll only use <code>execVM</code>, but you'll have to use <code>exec</code> in case you stumble upon any .sqs files elsewhere.

<code>scriptName.sqf</code> is the name of the script you want to execute. If it's in any subfolders, you'll have to write the path including the subfolders' names too.

## Example 1

Let's say you want to enable the player to jump - something you can't do in vanilla Arma. Here's what you'd do:

1. Download EnableJump.sqf.
2. Place EnableJump.sqf in your mission folder.
3. Execute this code anywhere (like any Init box): <code>null = execVM "EnableJump.sqf";</code>

It works! It's that easy.

## Example 2

Now you want to give the player god mode:

1. Download ToggleGodMode.sqf.
2. Place ToggleGodMode.sqf in your mission folder.
3. Execute this code anywhere (like any Init box): <code>null = [player] execVM "ToggleGodMode.sqf";</code>

Now the player is invincible, friendly to all AI, suffers no recoil, has infinite stamina, and never fatigues.

# Documentation

Below is documentation for all my scripts in alphabetical order explaining what each script does, what arguments it requires, and various other information like examples of how to execute it and tips on how to use it.

## AutoHealth.sqf

Automatically makes a unit bleed or heal over time depending on their health.

### Arguments

Execute the script with this syntax:

<code>null = [UnitToApplyTo, [BleedLowerBound, BleedUpperBound, BleedSeconds], [HealLowerBound, HealUpperBound, HealSeconds]] execVM "AutoHealth.sqf";</code>

<code>UnitToApplyTo</code>:     The variable of the unit you wish to have bleed/heal.                                                   Example: <code>player</code> Result: Player automatically bleeds/heals.

<code>BleedLowerBound</code>:   The lowest float amount of health at which the unit will bleed.                                         Example: <code>0</code>         Result: Bleeds until 0% health.

<code>BleedUpperBound</code>:   The highest float amount of health the unit will bleed from.                                            Example: <code>0.25</code>      Result: Begins bleeding when below 25% health.

<code>BleedSeconds</code>:      The maximum number of seconds for which the unit will bleed until hitting <code>BleedLowerBound</code>. Example: <code>60</code>        Result: Bleeds for up to 60 seconds (1 minute).

<code>HealLowerBound</code>:    The lowest float amount of health at which the unit will heal.                                          Example: <code>0.75</code>      Result: Begins healing at 75% health.

<code>HealUpperBound</code>:    The highest float amount of health the unit will heal to.                                               Example: <code>1</code>         Result: Heals until 100% health.

<code>HealSeconds</code>:       The maximum number of seconds for which the unit will heal until hitting <code>HealUpperBound</code>.   Example: <code>(60 * 3)</code>  Result: Heals for up to 180 seconds (3 minutes).

### Example Settings

"Quarters" Setting: Player bleeds between 0%-25% health and heals between 75%-100% health over 3 minutes:

<code>null = [player, [0, 0.25, (60 * 3)], [0.75, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"Thirds" Setting: Player bleeds between 0%-33% health and heals between 66%-100% health over 3 minutes:

<code>null = [player, [0, 0.33, (60 * 3)], [0.66, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"All-or-Nothing" Setting: Player bleeds between 0%-75% health and heals between 75%-100% health over 5 minutes:

<code>null = [player, [0, 0.75, (60 * 5)], [0.75, 1, (60 * 5)]] execVM "AutoHealth.sqf";</code>

"Arcade" Setting: Player doesn't bleed but heals between 0%-100% health over 1 minute:

<code>null = [player, [0, 0, (60 * 1)], [0, 1, (60 * 1)]] execVM "AutoHealth.sqf";</code>

"Realistic" Setting: Player bleeds between 0%-100% health but doesn't heal over 1 minute:

<code>null = [player, [0, 1, (60 * 1)], [0, 0, (60 * 1)]] execVM "AutoHealth.sqf";</code>

### Tips

If you don't want a unit to be able to bleed or heal, set both its lower and upper bounds to the same number.

A clean way to set the number of seconds bleeding or healing in minutes is to use <code>(60 * NumberOfMinutes)</code>.

If you want the player to notice the bleeding effect or you want injuries and bleeding to be a very serious issue for the player, set BleedSeconds to a very small number like 60, which is a minute.

If you don't want the player to notice the healing effect or you don't want to make the healing effect so fast that the player rapidly recovers from everything in a matter of seconds like it's Call of Duty, set HealSeconds to a very large number like 300 or (60 * 5), which is 5 minutes.

Remember that non-medic (Combat Lifesaver) units with First Aid Kits (FAKs) heal units to 75% health while medics with MedKits heal units to 100% health.

If you're a coder, you could re-implement this using <code>addMPEventHandler</code> to automatically run as soon as the unit is hit, instead of constantly polling the unit's health (which is obviously less efficient).

## AutoSave.sqf

Saves routinely every few minutes.

### Arguments

Execute the script with this syntax:

<code>null = [MinutesBetweenSaves] execVM "AutoSave.sqf";</code>

<code>MinutesBetweenSaves</code> The number of minutes to wait between each save.   Example: 10 Result: Saves every 10 minutes.

### Tips

In order to save, the game temporarily pauses on the server and all clients to save the state of everything without producing bizarre time-warping artifacts (no, I'm not exaggerating, it would literally warp in-game spacetime). On the server (if it is a player), the screen will display a filter with text saying something to the effect of "Saving game... please wait." However, on other clients, the game simply stops and displays no text, so most players perceive this to be an unwanted moment of severe "lag" and will tell you so when it is actually an intentional pause in order to save the game. Still, it provides a poor user experience, so it's best to minimize the amount of unnecessary saving in order to minimize the number of pauses which will be perceived as "lag spikes."

## DisablePlayableAI.sqf

Fully disables an AI unit.

### Arguments

Execute the script with this syntax:

<code>null = [UnitToApplyTo] execVM "DisablePlayableAI.sqf";</code>

<code>UnitToApplyTo</code>: The AI unit you want to disable. Has no effect on players.

### Tips

Can be used to disable playable AI units so you can manually pose them for screenshots or videos without them automatically resetting their stances.

## EnableJump.sqf

Enables the player to jump over objects by pressing the Vault and Sprint buttons at the same time.

### Arguments

Execute the script client-side for every client who should be able to jump:

<code>null = execVM "EnableJump.sqf";</code>

If you don't know where "client-side" is, just slap it somewhere in the player's Init box or an init.sqf. Only place it once, or multiple instances of the same script will be unnecessarily running at the same time.

### Features

Adds "Custom Controls" to your briefing and displays what keys to press to jump.

Automatically supports custom key bindings/mappings.

## RandomizeSetting.sqf

Randomizes the time and weather of the mission.

Synchronizes changes across the network across all clients.

### Arguments

Execute the script server-side with this syntax:

<code>null = execVM "RandomizeSetting.sqf";</code>

If you don't know where "server-side" is, just slap it in your init.sqf in an <code>if (isServer) then {};</code> block.

### Tips

Equip the player with Night-Vision Goggles (NVGs) or at least flashlights and flares because the script can randomize your mission to occur at night with 100% overcast which turns everything pitch-black.

## SetAISkill.sqf

Sets AI unit's sub-skill levels.

### Arguments

Execute the script with this syntax:

<code>null = [UnitToApplyTo, [SituationalAwarenessSkillLevel, WeaponSkillLevel, TeamworkSkillLevel]] execVM "SetAISkill.sqf";</code>

<code>UnitToApplyTo</code>:                     The variable of the AI unit whose skill level you want to set.                                                          Example: Unit1  Result: Sets Unit1's skills.

<code>SituationalAwarenessSkillLevel</code>:    The float skill level of how far and fast the unit can spot enemies.                                                    Example: 0.50   Result: 50% situational awareness skills.

<code>WeaponSkillLevel</code>:                  The float skill level of how fast and accurately the unit can shoot, how much its hands shake, and how fast it reloads. Example: 0.25   Result: 25% weapon skills.

<code>TeamWorkSkillLevel</code>:                The float skill level of how fast and accurately the unit communicates enemy positions, and how often the unit flees.   Example: 0.33   Result: 33% teamwork skills.

The highest possible skill level is 1 (100%) while the lowest possible skill level is 0 (0%).

### Tips

Skill levels are not 100% concrete because they are also calculated using the server's difficulty settings as some sort of coefficient to calculate skillFinal.

Unlike what the wiki page says, AI skill levels are no longer interpolated and haven't been for a long time.

## ToggleGodMode.sqf

Enables/disables god mode for a unit.

God mode makes the unit invincible, makes them friendly to all AI, removes their recoil, and disables their fatigue/stamina.

### Arguments

Execute the script with this syntax:

<code>null = [UnitToApplyTo] execVM "ToggleGodMode.sqf";</code>

<code>UnitToApplyTo</code>: The unit you wish to toggle the god mode of.    Example: player Result: Toggles the god mode of the (client-side) player.

### Tips

Be careful using this script as it essentially makes the unit unstoppable (with great power comes great opportunity to abuse this script and fuck everyone on the server like the cheating motherfucker you are... that's not how that saying goes, is it?).

This works really well for a "drill instructor" player whose only purpose is to observe and instruct other players but not get into firefights with enemy AI.

# To Do:

* Update GitHub page. Merge initial sections with this README.md. Change page to be README.md.
* Update, rename, refactor, document, & upload spawnEnemyWaves.sqf & spawnMarkerTracker.sqf.
* Make SpawnAIGroup.sqf, a simpler 1-wave version of spawnEnemyWaves.sqf.
* Re-implement AutoHealth.sqf with <code>addMPEventHandler</code>
* Remove the <code> tags in this readme.
