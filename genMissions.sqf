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
} forEach (allPlayers);

// TODO: Give the poor vehicle a nice loadout
car1 setPos ([getMarkerPos "respawn", 10, random 360] call BIS_fnc_relPos);
car1 setDir ( ( car1 getDir _pos_start)-180 );


// We are done.. inform clients.
sl_wr_init = "done";
publicVariable "sl_wr_init";

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
    _locs = nearestLocations [getpos player, ["NameVillage","NameCity","NameCityCapital","Hill"], 300];
    _loc = _locs call BIS_fnc_selectRandom;
    // if (!isNull _loc) then { _near = type _loc; };
    _near = "";
    _obj_pos = _x;

    // Select random scenario
    _missions = [];

    if (_near == "") then {
      _missions = ["camp_officer","camp_clear","camp_ammo"];
    } else {

      if (_near == "Hill") then {
        _missions = ["camp_officer","camp_clear","camp_ammo"];
        _ojb_pos = locationPosition _loc;
      };

      if ( [_near,"Name"] call CBA_fnc_find != -1 ) then {
        _missions = ["camp_officer","camp_clear","camp_ammo"];
      };

    };
    // Run scenario script

    // _mission = _missions call BIS_fnc_selectRandom;

    // if (_mission == "camp_officer") then { [_obj_pos] call SL_fnc_taskCampOfficer; };
    // if (_mission == "camp_clear") then { [_obj_pos] call SL_fnc_taskCampClear; };
    // if (_mission == "camp_ammo") then { [_obj_pos] call SL_fnc_taskCampAmmo; };

    // Push this to the background because waitUntil{} and functions
    [_obj_pos] execVM "objectives\taskCampOfficer.sqf";

    // Create trigger to spawn patrols (UPSMON) to save FPS.


  };

  // Next!
  _counter = _counter + 1;

  // Delay the lag.
  sleep 1;

} foreach nodes;
