_markerWest = "respawn_west";
createMarker [_markerWest, [14261.3,16285.4,0]]; //Base Coordinates
_markerWest setMarkerSize [5,5];

_markerEast = "respawn_east";
createMarker [_markerEast, [11585.2,11948.6,0]]; //Base Coordinates
_markerEast setMarkerSize [5,5];

playAreaRadious = "";	
publicVariable "playAreaRadious";

gameStarted = false;
publicVariable "gameStarted";	

secondsRemaing = 0;	

timeRemaining = "";
publicVariable "timeRemaining";	

winKills = 0;
publicVariable "winKills";	

westScoreCount = 0;
publicVariable "westScoreCount";	

eastScoreCount = 0;
publicVariable "eastScoreCount";

globCampingTimerEnabled = "0";
publicVariable "globCampingTimerEnabled";

globCampSettingSeconds = "";
publicVariable "globCampSettingSeconds";

globCampSettingMeters = "";
publicVariable "globCampSettingMeters";

globCampSettingMeters = "";
publicVariable "globCampSettingMeters";

loadedAreas = [];

campDeath = "";
"campDeath" addPublicVariableEventHandler { 
	campDeath = _this select 1; 
	
	if(campDeath == "westCampDeath") then {
		east addScoreSide 1;
	};

	if(campDeath == "eastCampDeath") then {
		west addScoreSide 1;
	};
};