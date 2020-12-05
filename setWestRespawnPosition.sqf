_markerPlayAreaPos = getMarkerPos "markerPlayArea";
playAreaRadiousNum = parseNumber playAreaRadious;

_eastEnemyAreasArray = [];
{
	if ((alive _x) && (side _x == east)) then 
	{
		_eastEnemyPosition = getPos _x;
		_eastEnemyArea = [_eastEnemyPosition, playAreaRadiousNum/2]; //Position, Distance to spawn from the enemy in meters
		_eastEnemyAreasArray pushBack _eastEnemyArea;
	};
} forEach playableUnits;

_randomPos = [[[_markerPlayAreaPos, playAreaRadiousNum]], ["water"]] call BIS_fnc_randomPos;
_spawnPos = [_markerPlayAreaPos, 0, playAreaRadiousNum, 0, 0, 0.7, 0, _eastEnemyAreasArray, _randomPos] call BIS_fnc_findSafePos;

"respawn_west" setMarkerPos _spawnPos;