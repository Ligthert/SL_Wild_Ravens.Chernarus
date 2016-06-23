// Get the task
_tsk          = _this select 0;
_description  = _this select 1;
_title        = _this select 2;
_marker 		  = _this select 3;
_object			  = _this select 4;

[true,_tsk,[_description,_title,_marker],_object,"CREATED",0] call BIS_fnc_taskCreate;

_tsk;
