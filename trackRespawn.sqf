while {alive car1} do {
	"respawn" setMarkerPos ([getPos car1,10,((getDir car1)-180)] call BIS_fnc_relPos);
	sleep 1;
};
