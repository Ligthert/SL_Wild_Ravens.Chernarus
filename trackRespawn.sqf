while {alive car1} do {
	waitUntil {velocity car1 == 0} do {
		"respawn" setMarkerPos getPos car1;
	};
	sleep 1;
};
