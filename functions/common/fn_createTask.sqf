// Get the task
// _tsk 			= _this select 0;
_description  = _this select 0;
_title        = _this select 1;
_marker 		  = _this select 2;
_object			  = _this select 3;

// _tsk = format["task%1",random 9999];
// [true,_tsk,[_description,_title,_marker],_object,"CREATED",0] call BIS_fnc_taskCreate;
// [_tsk] call BIS_fnc_taskSetCurrent;

hint format["%1 %2 %3 %4",_description,_title,_marker,_object];

_tsk = player createSimpleTask [_title];
_tsk setSimpleTaskDestination [_description,_title,_marker];
_tsk setTaskState "Created";
_tsk setTaskState "Assigned";
player setCurrentTask _tsk;
_tsk setSimpleTaskDestination (getMarkerPos _object);

_tsk;
