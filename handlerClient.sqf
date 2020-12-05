if(hasInterface) then {

	private ["_player"];
	_player = _this select 0;

	disableSerialization;

	_keepLooping = true;
	currentCampSecs = -1;

	while {_keepLooping && alive _player} do {
		
		sleep 1;

		if(gameStarted) then {

			//Set local triggers
			if(initiliazeTriggers) then {
				//Trigger to notify unit out of the zone
				_playAreaPos = getMarkerPos "markerPlayArea";
				playAreaRadiousNum = parseNumber playAreaRadious;
				trg1 = createTrigger ["EmptyDetector", _playAreaPos, true]; 
				trg1 setTriggerArea [playAreaRadiousNum, playAreaRadiousNum, 0, false]; 
				trg1 setTriggerActivation ["ANY", "NOT PRESENT", true]; 
				trg1 setTriggerTimeout [2,2,2,true];
				trg1 setTriggerStatements 
				[
					"this", 
					"_violator = triggerAttachedVehicle thisTrigger; 
					if(alive _violator) then 
					{
						3 cutRsc ['outOfZoneHud','PLAIN'];
						waitUntil {!(isNull (uiNamespace getVariable 'outOfZoneHud'))};
						_display = uiNamespace getVariable 'outOfZoneHud';
						_setText = _display displayCtrl 1704;
						_setText ctrlSetText 'Get in zone or die';
					};", 
					"
					"
				];
				trg1 triggerAttachVehicle [_player];

				//Trigger to count player camping
				trg2 = createTrigger ["EmptyDetector", _playAreaPos]; 
				trg2 setTriggerArea [playAreaRadiousNum, playAreaRadiousNum, 0, true]; 
				trg2 setTriggerActivation ["ANY", "PRESENT", true]; 
				trg2 setTriggerStatements 
				[ 
					"this", 
					"   
						_player = triggerAttachedVehicle thisTrigger;
						if(alive _player) then 
						{
							[_player] execVM 'timerForCamping.sqf';
						};
					", 
					""
				];
				trg2 triggerAttachVehicle [_player];
				initiliazeTriggers = false;
			};

			if(moveInCombatArea) then {

				if(side _player == west) then {
					_spawnWestPos = getMarkerPos "respawn_west";
					[_player, _spawnWestPos, true] call BIS_fnc_moveToRespawnPosition;
				};
				
				if(side _player == east) then {
					_spawnEastPos = getMarkerPos "respawn_east";
					[_player, _spawnEastPos, true] call BIS_fnc_moveToRespawnPosition;
				};
				moveInCombatArea = false;
			};

			// Show Score Info
			1 cutRsc ["gameHud","PLAIN"];
	        waitUntil {!(isNull (uiNamespace getVariable "gameHud"))};
			_display = uiNamespace getVariable "gameHud";
			_setTimer = _display displayCtrl 1701;		
			if(winType == "SECONDS_COUNT") then {
				_setTimer ctrlSetText timeRemaining;
			} else {
				_setTimer ctrlSetText winKills;
			};
			_setWestScope = _display displayCtrl 1700;
			_setWestScope ctrlSetText str westScoreCount;
			_setEastScope = _display displayCtrl 1702;
			_setEastScope ctrlSetText str eastScoreCount;

			if(currentCampSecs > -1) then {
				//Show Camping info - currentCampSecs-1 for accuracy in visual countdown
				_campTimeRemaining = format["%1", [((currentCampSecs-1)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
				2 cutRsc ["campHud","PLAIN"];
				waitUntil {!(isNull (uiNamespace getVariable "campHud"))};
				_display = uiNamespace getVariable "campHud";
				_setTimeRemaing = _display displayCtrl 1703;	
				
				_campSettingSeconds = parseNumber globCampSettingSeconds;
				if( (currentCampSecs-1) < 20) then {
					_setTimeRemaing ctrlSetBackgroundColor [1,1,0,0.5];
				};

				if( (currentCampSecs-1) < 10) then {
					_setTimeRemaing ctrlSetBackgroundColor [1,0,0,0.5];
				};

				_campingHint = format["Move %1 meters or die in %2", globCampSettingMeters, _campTimeRemaining];
				_setTimeRemaing ctrlSetText _campingHint;
			};
		};
	};

	1 cutFadeOut 0;
	2 cutFadeOut 0;
};