// Header stuff

// Obligatory private
private ["_marker"];

// Where do we want it
_pos = _this select 0;
_grp = createGroup EAST;

/////////// MAGIC ///////////

// Deploy composition.
comp = comp_camps + comp_officers;
[_pos,comp call BIS_fnc_selectRandom] call SL_fnc_loadCompositions;

// Place some objects that need fucking up
_tgt = _grp createUnit [faction_officers call BIS_fnc_selectRandom, _pos, [], 0, "NONE"];

/////////// MAGIC ///////////

// Create Marker of the search area
// SL_fnc_createMarker
_marker = [_pos] call SL_fnc_createMarker;

// Create Task and spam to clients

sleep 10;


_description = "Kill a dude";
_title = "Assassinate Officer";
_marker_name = "Assassinate";
_tsk = [[_description,_title,_marker_name _marker],"SL_fnc_createTask",true,false] call BIS_fnc_MP;

/*
_tsk = [["killadude","ass","ass","respawn"],"SL_fnc_createTask",true,false] call BIS_fnc_MP

_tsk = format["task%1",random 9999];
_object = _marker;
_title_short = "ass";
[true,_tsk,[_description,_title,_title_short],_object,"CREATED",0] call BIS_fnc_taskCreate;
[_tsk] call BIS_fnc_taskSetCurrent;


task1 = player createsimpletask ["Build Checkpoint"];
task1 setSimpleTaskDescription ["Build a checkpoint on the road to the oil fields", "Build checkpoint", "Build checkpoint"];
[task1, "Created"] call WIS_fnc_taskstate;
[task1, "Assigned"] call WIS_fnc_taskstate;
player setCurrentTask task1;
task1 setSimpleTaskDestination (getmarkerpos "marker_4");
*/

// Wait until shits stolen, dead or destroyed
waitUntil {!alive _tgt};

// Add some sleep to keep the players in suspension.
sleep (random 10);

// Mark the task as done
[[_tsk,"SUCCEEDED",true],"BIS_fnc_taskSetState",true,false] call BIS_fnc_MP;

// Destroy marker
deleteMarker _marker;
