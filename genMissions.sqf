private ["_pos_start"];

// Load compositions
#include "compositions.sqf";

// Search for a random pos.
_pos_start = call SL_fnc_findstart;


// Move units + gear
"respawn" setMarkerPos _pos_start;
{
    _x setPos ([getMarkerPos "respawn", 5, random 360] call BIS_fnc_relPos);
    _x setDir ( ( _x getDir _pos_start)-180 );
} forEach (call BIS_fnc_listPlayers);

// TODO: Give the poor vehicle a nice loadout
car1 setPos ([getMarkerPos "respawn", 10, random 360] call BIS_fnc_relPos);
car1 setDir ( ( car1 getDir _pos_start)-180 );


// We are done.. inform clients.
sl_wr_init = "done";
publicVariable sl_wr_init;

// Find locations for missions.
[_pos_start] call SL_fnc_randLoc;


{
  _marker = [(format["marker%1",random 999999]),_x,"ICON",[1,1],"TYPE:","mil_dot","COLOR:","ColorGreen" ] call CBA_fnc_createMarker;
} forEach nodes;


// Create actual missions.
_counter = 0;
{

  if (_counter != 0) then {
    // Check if there is a location nearby and find a fitting scenario.
    // Select random scenario
    // Run scenario script
    // Create trigger to spawn patrols (UPSMON) to save FPS.
  };

  // Next!
  _counter = _counter + 1;

  // Delay the lag.
  sleep 1;

} foreach nodes;
