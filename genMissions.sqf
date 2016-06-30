private ["_pos_start"];

objCenter = "Land_HelipadEmpty_F" createVehicle mapCenter;

nodes = [];
tasks = [];

// Load compositions
#include "compositions\officers.sqf"
#include "compositions\camps.sqf"
#include "compositions\compounds.sqf"

// Search for a random pos.
_pos_start = call SL_fnc_findstart;

objStart = "Land_HelipadEmpty_F" createVehicle _pos_start;

// Move units + gear
"respawn" setMarkerPos _pos_start;

{
    _x setPos ([getMarkerPos "respawn", 5, random 360] call BIS_fnc_relPos);
    _x setDir ( ( _x getDir _pos_start) );
} forEach (allPlayers);

car1 setPos ([getMarkerPos "respawn", 10, random 360] call BIS_fnc_relPos);
car1 setDir ( ( car1 getDir _pos_start) );


// Find locations for missions.
[_pos_start] call SL_fnc_randLoc;


// Create actual missions.
_counter = 0;
{

  diag_log format["Cycle %1",_counter];

  if (_counter != 0) then {
    // Check if there is a location nearby and find a fitting scenario.
    _obj_pos = _x;
    _loc = nearestLocations [_obj_pos, ["NameVillage","NameCity","NameCityCapital","Hill"], 300];


    // Select random scenario
    _missions = ["camp_officer","camp_clear","camp_ammo"];


    diag_log format["Locs: %1",_loc];
    diag_log format["Loc count: %1",count _loc];

    if ( count _loc != 0 ) then {

      _loc = _loc select 0;

      _near = type _loc;

      diag_log format["Location Type: %1",_near];

      if (_near == "Hill") then {
        _missions = _missions + ["compound_aa","compound_at"];
        _obj_pos = locationPosition _loc;
      } else {
        _missions = _missions + ["compound_aa","compound_at"];
        // _obj_pos = locationPosition _loc;
      };

      nodes set [_counter,_obj_pos];
      diag_log _obj_pos;

    } else {
      // If there are no objects nearby.. spawn in the heavy stuff.
      if (count (_obj_pos isFlatEmpty [1, -1, 0.5, 20, 0, false, objNull]) > 0) then {
        diag_log format["Safe Spaces: %1",count (_obj_pos isFlatEmpty [1, -1, 0.5, 20, 0, false, objNull])];
        _missions = ["compound_aa","compound_at"];
      };
    };


    // Run scenario script
    diag_log format["Available Missions: %1",_missions];
    _mission = _missions call BIS_fnc_selectRandom;

    diag_log format["Missions selected: %1",_mission];

    if (_mission == "camp_officer") then { [_obj_pos] execVM "objectives\taskCampOfficer.sqf"; };
    if (_mission == "camp_clear") then { [_obj_pos] execVM "objectives\taskCampClear.sqf"; };
    if (_mission == "camp_ammo") then { [_obj_pos] execVM "objectives\taskCampCache.sqf"; };
    if (_mission == "compound_aa") then { [_obj_pos] execVM "objectives\taskCompoundAA.sqf"; };
    if (_mission == "compound_at") then { [_obj_pos] execVM "objectives\taskCompoundAT.sqf"; };


    // Create trigger to spawn patrols (UPSMON) to save FPS.
    _trg = createTrigger ["EmptyDetector",_obj_pos];
    _trg setTriggerArea [1000, 1000, 0, false];
    _trg setTriggerActivation ["WEST", "PRESENT", false];
    _trg setTriggerStatements ["this", format["[%1] call SL_fnc_spawnPatrol",_obj_pos], ""];

  };

  // Next!
  _counter = _counter + 1;

  // Delay the lag.
  sleep 5;

} foreach nodes;

if ("param_debug" call BIS_fnc_getParamValue == 1) then {
  { _marker = [(format["marker%1",random 999999]),_x,"ICON",[1,1],"TYPE:","mil_dot","COLOR:","ColorGreen" ] call CBA_fnc_createMarker; } forEach nodes;
};

// Fire off patrols...
if ("param_patrols" call BIS_fnc_getParamValue >= 1 ) then {
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
  _size_x = ((_largest_x - _smallest_x)/2)+200;
  _size_y = ((_largest_y - _smallest_y)/2)+200;
  _marker = ["markername", _marker_pos, "Rectangle", [_size_x, _size_y]] call CBA_fnc_createMarker;


  _players = count allPlayers;
  _divider =  _players/("param_enemy_scaling" call BIS_fnc_getParamValue);
  _size = ((_size_x*2)/1000) * ((_size_y*2)/1000);
  _groups = ceil( _divider ) * ceil (_size);

  diag_log format["Patrol Area stats: Players:%1; Divider:%2; Size:%3; Groups:%4",_players,_divider,_size,_groups];

  for "_i" from 1 to _groups do {
    _grp = [faction_side, random [4,6,8], _marker_pos, faction_units] call SL_fnc_createGroup;
    nul = [leader _grp, _marker,"STAG COLUMN", "SAFE", "LIMITED","NOFOLLOW","RANDOM"] execVM "scripts\UPSMON.sqf";
  };

  if ("param_patrols" call BIS_fnc_getParamValue >= 2 ) then {
    diag_log "Spawning Car";
    _groups = _size / 2.5;
    _groups = floor _groups * ceil _divider;

    for "_i" from 1 to _groups do {
      _tmp_pos = [_marker_pos,random 30,random 360] call BIS_fnc_relPos;
      _veh = [_tmp_pos,random 360, (faction_car call BIS_fnc_selectRandom), faction_side] call BIS_fnc_spawnVehicle;
      nul = [leader (_veh select 2), _marker, "SAFE", "LIMITED","NOFOLLOW","NOSMOKE","ONROAD"] execVM "scripts\UPSMON.sqf";
      sleep 10;
    };
  };

  if ("param_patrols" call BIS_fnc_getParamValue == 3 ) then {
    diag_log "Spawning IFV";
    _groups = _size / 5;
    _groups = floor _groups * ceil _divider;

    for "_i" from 1 to _groups do {
      _tmp_pos = [_marker_pos,random 30,random 360] call BIS_fnc_relPos;
      _veh = [_tmp_pos,random 360, (faction_ifv call BIS_fnc_selectRandom), faction_side] call BIS_fnc_spawnVehicle;
      nul = [leader (_veh select 2), _marker, "SAFE", "LIMITED","NOFOLLOW","NOSMOKE","ONROAD"] execVM "scripts\UPSMON.sqf";
      sleep 10;
    };
  };

};

execVM "trackRespawn.sqf";

if ("param_debug" call BIS_fnc_getParamValue == 1) then {
  { _x setMarkerAlpha 1 } foreach allMapMarkers;
};

//waitUntil {call SL_fnc_checkTriggers == 1};
//["end1","BIS_fnc_endMission",true,false,true] call BIS_fnc_MP;
