if(isServer) then {

	_keepLooping = true;

	while {_keepLooping} do {

		sleep 1;

		winType = winningOptionsArray select 1;
		publicVariable "winType";

		westScoreCount = scoreSide west;
		publicVariable "westScoreCount";

		eastScoreCount = scoreSide east;
		publicVariable "eastScoreCount";

		if(winType == "SECONDS_COUNT") then {

			if(secondsRemaing < 0) then {

				timeRemaining = "00:00";
				publicVariable "timeRemaining";

				if(eastScoreCount == westScoreCount) then {
					"end1" call BIS_fnc_endMissionServer;
				} else {
					"SideScore" call BIS_fnc_endMissionServer;
				};
				_keepLooping = false;

			} else { 
				timeRemaining = format["%1", [((secondsRemaing)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
				publicVariable "timeRemaining";
			};

		} else {
			winKills = winningOptionsArray select 0;
			publicVariable "winKills";
		};

		if(winType == "KILL_COUNT") then {
			_winKills = parseNumber (winningOptionsArray select 0);
			if((westScoreCount >= _winKills) || (eastScoreCount >= _winKills)) then {
				"SideScore" call BIS_fnc_endMissionServer;
				_keepLooping = false;
			};
		};

		gameStarted = true;
		publicVariable "gameStarted";
	};
};