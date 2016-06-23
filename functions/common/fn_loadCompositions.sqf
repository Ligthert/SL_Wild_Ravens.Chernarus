private ["_list","_pos","_pos_x","_pos_y","_pos_z","_arr","_obj","_dir"];

// _pos = [getPos player,20,getDir player ] call BIS_fnc_relPos;
// _list = _this;
_pos = _this select 0;
_list = _this select 1;

{
	_pos_x = (_pos select 0) + ((_x select 1) select 0);
	_pos_y = (_pos select 1) + ((_x select 1) select 1);
	_pos_z = (_x select 1) select 2;

	_arr = [_pos_x,_pos_y,_pos_z];

	_obj = createVehicle [(_x select 0),_arr,[],0,"CAN_COLLIDE"];

	_obj setDir (_x select 2);
	_obj setVectorUp surfaceNormal position _obj;

} foreach _list;
