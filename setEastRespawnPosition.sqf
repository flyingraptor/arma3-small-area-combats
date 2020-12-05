_markerPlayAreaPos = getMarkerPos "markerPlayArea";
playAreaRadiousNum = parseNumber playAreaRadious;

_westEnemyAreasArray = [];
{
	if ((alive _x) && (side _x == west)) then 
	{
		_westEnemyPosition = getPos _x;
		_westEnemyArea = [_westEnemyPosition, playAreaRadiousNum/2]; //Position, Distance to spawn from the enemy in meters
		_westEnemyAreasArray pushBack _westEnemyArea;
	};
} forEach playableUnits;

_randomPos = [[[_markerPlayAreaPos, playAreaRadiousNum]], ["water"]] call BIS_fnc_randomPos;
_spawnPos = [_markerPlayAreaPos, 0, playAreaRadiousNum, 0, 0, 0.7, 0, _westEnemyAreasArray, _randomPos] call BIS_fnc_findSafePos;

"respawn_east" setMarkerPos _spawnPos;