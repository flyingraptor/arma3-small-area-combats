if(isServer && hasInterface) then {
	_markerPlayAreaPos = getMarkerPos "markerPlayArea";

	playAreaRadiousNum = 0;
	if(0 == (_markerPlayAreaPos select 0)) then {

		// No area selected yet - Create a default arena.
		playAreaRadiousNum = 50;

		/* Set the area position */
		deleteMarker "markerPlayArea";
		playAreaPosition = [nil, ["water"]] call BIS_fnc_randomPos;
		playArea = createMarker ["markerPlayArea", playAreaPosition]; 
		playArea setMarkerShape "ELLIPSE";
		playArea setMarkerColor "ColorRed"; 
		playArea setMarkerSize [playAreaRadiousNum, playAreaRadiousNum]; 
		playArea setMarkerBrush "Grid";

		/* Populate variables that are used next */
		_markerPlayAreaPos = getMarkerPos "markerPlayArea";
		lastSelectedIndex = 0;
		playAreaRadious = lbData[1500, lastSelectedIndex];
		publicVariable "playAreaRadious";
	}
	else {
		playAreaRadiousNum = parseNumber playAreaRadious;
		publicVariable "playAreaRadious";
	};

	publicVariable "playAreaPosition";

	// Get the time of daytime
	dayTimeOptionsSelected = lbData[1501, lastTimeOfDayIndex];
	dayTimeOptionsSelected = dayTimeOptionsSelected splitString ":";
	_hour = dayTimeOptionsSelected select 0;
	_minute = dayTimeOptionsSelected select 1;
	setDate [2036, 6, 12, parseNumber _hour, parseNumber _minute];

	// Get the camping timer 
	timerOptionsSelected = lbData[1502, lastMoveTimeLimitIndex];
	timerOptionsArray = [];
	if(timerOptionsSelected != "disabled") then {
		timerOptionsArray = timerOptionsSelected splitString ",";
		globCampSettingSeconds = timerOptionsArray select 0;
		publicVariable "globCampSettingSeconds";
	    globCampSettingMeters = timerOptionsArray select 1;
		publicVariable "globCampSettingMeters";
		globCampingTimerEnabled = "1";
		publicVariable "globCampingTimerEnabled";
	};

	// Get the winning condition
	winningOptionsSelected = lbData[1503, ctrlWinConditionsIndex];
	winningOptionsArray = [];
	winningOptionsArray = winningOptionsSelected splitString ",";

	{
		if(!(isPlayer _x)) then
		{
			if (side _x == west) then
			{
				_x addEventHandler ["Killed", {
					execVM "setWestRespawnPosition.sqf";
				}];
			};
			if (side _x == east) then 
			{
				_x addEventHandler ["Killed", {
					execVM "setEastRespawnPosition.sqf"; 
				}];
			};
		};
	} forEach playableUnits;

	_spawnWestPos = [[[_markerPlayAreaPos, playAreaRadiousNum]], ["water"]] call BIS_fnc_randomPos;
	"respawn_west" setMarkerPos _spawnWestPos;

	_spawnEastPos = [[[_markerPlayAreaPos, playAreaRadiousNum]], [["water"],[_spawnWestPos, 40]]] call BIS_fnc_randomPos;
	"respawn_east" setMarkerPos _spawnEastPos;

	{
		if(!(isPlayer _x)) then
		{
			_AIGroup = group _x;
			_wp = _AIGroup addWaypoint [playAreaPosition, 5, 0];
			_wp setWaypointType "SAD";
			[_AIGroup, 0] setWaypointCombatMode "RED";
			_AIGroup setCurrentWaypoint[_AIGroup, 0];
		
			_randomPos = [[[_markerPlayAreaPos, playAreaRadiousNum]], ["water"]] call BIS_fnc_randomPos;
			[_x, _randomPos, true] call BIS_fnc_moveToRespawnPosition;
		};

		//Trigger to kill unit out of the zone
		trg1 = createTrigger ["EmptyDetector", playAreaPosition]; 
		trg1 setTriggerArea [playAreaRadiousNum, playAreaRadiousNum, 0, false]; 
		trg1 setTriggerActivation ["ANY", "NOT PRESENT", true]; 
		trg1 setTriggerTimeout [9,9,9,true];
		trg1 setTriggerStatements 
		[
			"this", 
			"_violator = triggerAttachedVehicle thisTrigger; 
			if(alive _violator) then 
			{
				_name = name _violator;
				_violator setDamage 1;
			};", 
			""
		];
		trg1 triggerAttachVehicle [_x];

	} forEach playableUnits;

	player removeAction 1;

	closeDialog 1;
	[] spawn { execVM 'handlerServer.sqf'; };

	_winType = winningOptionsArray select 1;
	if(_winType == "SECONDS_COUNT") then {
		[] spawn { execVM "timerForGameEnd.sqf"; };
	};
};