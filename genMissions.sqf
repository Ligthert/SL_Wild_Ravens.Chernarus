private ["_pos_start"];

// Load compositions
#include "compositions\officers.sqf"

// Search for a random pos.
_pos_start = call SL_fnc_findstart;


// Move units + gear
"respawn" setMarkerPos _pos_start;
{
    _x setPos ([getMarkerPos "respawn", 5, random 360] call BIS_fnc_relPos);
    _x setDir ( ( _x getDir _pos_start) );
} forEach (allPlayers);

// TODO: Give the poor vehicle a nice loadout
car1 setPos ([getMarkerPos "respawn", 10, random 360] call BIS_fnc_relPos);
car1 setDir ( ( car1 getDir _pos_start) );


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
    _trg = createTrigger ["EmptyDetector",_obj_pos];
    _trg setTriggerArea [1000, 1000, 0, false];
    _trg setTriggerActivation ["WEST", "PRESENT", false];
    _trg setTriggerStatements ["this", format["[%1] call SL_fnc_spawnPatrol",_obj_pos], ""];

  };

  // Next!
  _counter = _counter + 1;

  // Delay the lag.
  sleep 1;

} foreach nodes;


// Fire off patrols...
if ("param_patrols" call BIS_fnc_getParamValue == 1 ) then {
  _tmp_x = 0;
  _tmp_y = 0;
  _avg_x = 0;
  _avg_y = 0;
  _all_x = 0;
  _all_y = 0;
  _largest_x = 0;
  _smallest_x = 99999;
  _largest_y = 0;
  _smallest_y = 99999;
  _size_x = 0;
  _size_y = 0;

  _counter = 0;
  {
    if (_counter != 0) then {
      _tmp_x = (_x select 0);
      if ( _tmp_x > _largest_x ) then { _largest_x = _tmp_x; };
      if ( _tmp_x < _smallest_x ) then { _smallest_x = _tmp_x; };
      _all_x = _all_x + _tmp_x;
    };
    _counter = _counter + 1;
  } forEach nodes;
  _avg_x = (_all_x/((count nodes)-1));

  _counter = 0;
  {
    if (_counter != 0) then {
      _tmp_y = (_x select 1);
      if ( _tmp_y > _largest_y ) then { _largest_y = _tmp_y; };
      if ( _tmp_y < _smallest_y ) then { _smallest_y = _tmp_y; };
      _all_y = _all_y + _tmp_y;
    };
    _counter = _counter + 1;
  } forEach nodes;
  _avg_y = (_all_y/((count nodes)-1));

  _marker_pos = [_avg_x,_avg_y];
  _size_x = ((_largest_x - _smallest_x)/2)+100;
  _size_y = ((_largest_y - _smallest_y)/2)+100;
  _marker = ["markername", _marker_pos, "Rectangle", [_size_x, _size_y]] call CBA_fnc_createMarker;


  _players = count allPlayers;
  _divider =  _players/("param_enemy_scaling" call BIS_fnc_getParamValue);
  _size = (_size_x/1000) * (_size_y/1000);
  _groups = ceil( _divider ) * ceil (_size);

  for "_i" from 1 to _groups do {
    _grp = [faction_side, random [4,6,8], _marker_pos, faction_units] call SL_fnc_createGroup;
    nul = [leader _grp, _marker,"STAG COLUMN", "SAFE", "LIMITED","NOFOLLOW","RANDOM"] execVM "scripts\UPSMON.sqf";
  };

};
