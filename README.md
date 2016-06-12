# AutoHealth.sqf

Automatically make a unit bleed or heal over time depending on their health.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script with this syntax:

<pre><code>null = [UnitToApplyTo, [BleedLowerBound, BleedUpperBound, BleedSeconds], [HealLowerBound, HealUpperBound, HealSeconds]] execVM "AutoHealth.sqf";</code>
    <code>UnitToApplyTo</code>:     The variable of the unit you wish to have bleed/heal.                                                   Example: <code>player</code> Result: Applied to player unit.
    <code>BleedLowerBound</code>:   The lowest float amount of health at which the unit will bleed.                                         Example: <code>0</code>      Result: Bleeds until 0% health.
    <code>BleedUpperBound</code>:   The highest float amount of health the unit will bleed from.                                            Example: <code>0.25</code>   Result: Begins bleeding at 25% health.
    <code>BleedSeconds</code>:      The maximum number of seconds for which the unit will bleed until hitting <code>BleedLowerBound</code>. Example: <code>60</code>     Result: Bleeds for up to 60 seconds (1 minute).
    <code>HealLowerBound</code>:    The lowest float amount of health at which the unit will heal.                                          Example: <code>0.75</code>   Result: Begins bleeding at 75% health.
    <code>HealUpperBound</code>:    The highest float amount of health the unit will heal to.                                               Example: <code>1</code>      Result: Bleeds until 100% health.
    <code>HealSeconds</code>:       The maximum number of seconds for which the unit will heal until hitting <code>HealUpperBound</code>.   Example: <code>180</code>    Result: Heals for up to 180 seconds (3 minutes).</pre>

## Example Settings

"Quarters" Setting: Player bleeds between 0%-25% health and heals between 75%-100% health over 3 minutes:

<code>null = [player, [0, 0.25, (60 * 3)], [0.75, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"Thirds" Setting: Player bleeds between 0%-33% health and heals between 66%-100% health over 3 minutes:

<code>null = [player, [0, 0.33, (60 * 3)], [0.66, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"All-or-Nothing" Setting: Player bleeds between 0%-75% health and heals between 75%-100% health over 3 minutes:

<code>null = [player, [0, 0.75, (60 * 3)], [0.75, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"Arcade" Setting: Player doesn't bleed but heals between 0%-100% health over 3 minutes:

<code>null = [player, [0, 0, (60 * 3)], [0, 1, (60 * 3)]] execVM "AutoHealth.sqf";</code>

"Realistic" Setting: Player bleeds between 0%-100% health but doesn't heal over 3 minutes:

<code>null = [player, [0, 1, (60 * 3)], [0, 0, (60 * 3)]] execVM "AutoHealth.sqf";</code>

## Tips

If you don't want a unit to be able to bleed or heal, set both its lower and upper bounds to the same number.

A clean way to set the number of seconds bleeding or healing in minutes is to use <code>(60 * NumberOfMinutes)</code>.

If you want the player to notice the bleeding effect or you want injuries and bleeding to be a very serious issue for the player, set BleedSeconds to a very small number like 60, which is a minute.

If you don't want the player to notice the healing effect or you don't want to make the healing effect so fast that the player rapidly recovers from everything like it's Call of Duty, set HealSeconds to a very large number like 300 or (60 * 5), which is 5 minutes.

Remember that non-medic (Combat Lifesaver) units with First Aid Kits (FAKs) heal units to 75% health while medics with MedKits heal units to 100% health.

If you're a more advanced scripter, you could re-implement this using <code>addMPEventHandler</code> to automatically run as soon as the unit is hit, instead of constantly polling the unit's health (which is less efficient).

---

# DisablePlayableAI.sqf

Fully disables an AI unit.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script with this syntax:

<pre><code>null = [UnitToApplyTo] execVM "DisablePlayableAI.sqf";</code>
    <code>UnitToApplyTo</code>: The AI unit you want to disable.</pre>

## Tips

Best used on playable units so you can manually pose them for screenshots or videos without them automatically resetting their stances.

---

# EnableJump.sqf

Enables the player to jump over objects by pressing their Vault and Sprint buttons at the same time.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script client-side for every client who should be able to jump:

<code>null = execVM "EnableJump.sqf";</code>

If you don't know where "client-side" is, just slap it somewhere in your init.sqf, but not within an <code>if (isServer) then {};</code> block.

## Features

Adds "Custom Controls" to your briefing and displays what keys to press to jump.

Supports custom key bindings/mappings.

---

# RandomizeSetting.sqf

Randomizes the time and weather of the mission.

Synchronizes changes across the network across all clients.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script server-side with this syntax:

<code>null = execVM "RandomizeSetting.sqf";</code>

If you don't know where "server-side" is, just slap it in your init.sqf in an <code>if (isServer) then {};</code> block.

## Tips

Equip the player with Night-Vision Goggles (NVGs) or at least flashlights and flares because the script can randomize your mission to occur at night with 100% overcast which turns everything pitch-black and unplayable.

---

# SetAISkill.sqf

Sets AI unit's sub-skills.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script with this syntax:

<pre><code>null = [UnitToApplyTo, [SituationalAwarenessSkillLevel, WeaponSkillLevel, TeamworkSkillLevel]] execVM "SetAISkill.sqf";</code>
    <code>UnitToApplyTo</code>:                     The unit whose skill you want to set.                                                                                   Example: Unit1  Result: Sets Unit1's skills.
    <code>SituationalAwarenessSkillLevel</code>:    The float skill level of how far and fast the unit can spot enemies.                                                    Example: 0.50   Result: 50% situational awareness skills.
    <code>WeaponSkillLevel</code>:                  The float skill level of how fast and accurately the unit can shoot, how much its hands shake, and how fast it reloads. Example: 0.25   Result: 25% weapon skills.
    <code>TeamWorkSkillLevel</code>:                The float skill level of how fast and accurately the unit communicates enemy positions, and how often the unit flees.   Example: 0.33   Result: 33% teamwork skills.</pre>

## Tips

Skill levels are not 100% concrete because they are also somehow calculated using the server's difficulty settings as some sort of coefficient.

---

# ToggleGodMode.sqf

Enables/disables god mode for a unit.

God mode makes the unit invincible, makes them friendly to all AI, removes their recoil, and disables their fatigue/stamina.

## How to Use It

1) Make sure this file is in the mission folder of the mission you intend to use it in:

<pre>C:\Users\YourUserName\Documents\Arma 3 - Other Profiles\YourProfileName\missions\YourMissionName</pre>

2) Call the script with this syntax:

<pre><code>null = [UnitToApplyTo] execVM "ToggleGodMode.sqf";</code>
    <code>UnitToApplyTo</code>: The unit you wish to toggle the god mode of.    Example: player Result: Toggles the god mode of the (client-side) player.</pre>

## Tips

Be careful using this script as it essentially makes the unit unstoppable (with great power comes great opportunity to abuse this script and fuck everyone on the server like the cheating motherfucker you are... that's not how that saying goes, is it?).

This works really well for a "drill instructor" player whose only purpose is to observe and instruct other players but not to get into firefights with enemy AI.
