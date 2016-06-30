// Header stuff

// Obligatory private
private ["_marker"];

// Where do we want it
_pos = _this select 0;

_grp = createGroup faction_side;

/////////// MAGIC ///////////

// Deploy composition.
[_pos,comp_officers call BIS_fnc_selectRandom] call SL_fnc_loadCompositions;

// Place some objects that need fucking up
_tgt = _grp createUnit [faction_officers call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

/////////// MAGIC ///////////

// Create Marker of the search area
// SL_fnc_createMarker
_marker = [_pos] call SL_fnc_createMarker;

// Create Task and spam to clients
_tsk = format["task%1",random 9999];
_description = "Kill a dude";
_title = "Assassinate Officer";
_marker_name = "Assassinate";
[[_tsk,_description,_title,_marker_name,_marker],"SL_fnc_createTask",true,false] call BIS_fnc_MP;

// Wait until shits stolen, dead or destroyed
waitUntil {!alive _tgt};

// Add some sleep to keep the players in suspension.
sleep (random 10);

// Mark the task as done
[[_tsk,"SUCCEEDED",true],"BIS_fnc_taskSetState",true,false] call BIS_fnc_MP;

// Cram tasks in the task array
tasks set [count tasks,_tsk];

// Destroy marker
deleteMarker _marker;
