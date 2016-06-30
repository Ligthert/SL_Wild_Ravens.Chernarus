// Header stuff

// Obligatory private
private ["_marker"];

// Where do we want it
_pos = _this select 0;

_grp = createGroup faction_side;

/////////// MAGIC ///////////

// Deploy composition.
[_pos,comp_compounds call BIS_fnc_selectRandom] call SL_fnc_loadCompositions;

_grp = [faction_side, 10, _pos, faction_units] call SL_fnc_createGroup;
[_grp,_pos,20,1,true] call CBA_fnc_taskDefend;

// _cache = (faction_ammo call BIS_fnc_selectRandom) createVehicle _pos;

_grp1 = createGroup faction_side;
_assets = [];

for "_x" from 1 to 3 do {
  //_pos_asset = (_pos findEmptyPosition [0, 15]) call BIS_fnc_selectRandom;
  _pos_asset = [_pos,random 15, random 360] call BIS_fnc_relPos;
  _veh = (faction_aa call BIS_fnc_selectRandom) createVehicle _pos_asset;
  _veh setDir (random 360);
  (faction_units call BIS_fnc_selectRandom) createUnit [ _pos, _grp1, "this moveInGunner _veh"];
  _assets set [count _assets,_veh];
};

/////////// MAGIC ///////////

// Create Marker of the search area
// SL_fnc_createMarker
_marker = [_pos] call SL_fnc_createMarker;

// Create Task and spam to clients
_tsk = format["task%1",random 9999];
_description = "Destroy AA in a compound";
_title = "Destroy AA";
_marker_name = "Destroy AA";
[[_tsk,_description,_title,_marker_name,_marker],"SL_fnc_createTask",true,false] call BIS_fnc_MP;

// Wait until shits stolen, dead or destroyed
waitUntil {[_assets,0.5] call SL_fnc_healthObjects == 1};

// Add some sleep to keep the players in suspension.
sleep (random 10);

// Mark the task as done
[[_tsk,"SUCCEEDED",true],"BIS_fnc_taskSetState",true,false] call BIS_fnc_MP;

// Cram tasks in the task array
tasks set [count tasks,_tsk];

// Destroy marker
deleteMarker _marker;
