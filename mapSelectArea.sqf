/* Close Dialog once enter the map */
_baseDialogDisplay= findDisplay 1234;
_baseDialogDisplay closeDisplay 1;

openMap true;

if (shownMap) then 
{
	player onMapSingleClick 
	{
		if(gameStarted == false) then {
			/* Get the are position from the implicit variable _pos */
			_mapClickPos = _pos;
			{
				_marker = _x select 0;
				_areaPosition = _x select 1;
				_areaRadious = _x select 2;
				_markerColor = _x select 3; 
				_markerType = _x select 4;

				_marker setMarkerColor _markerColor;
				_marker setMarkerType _markerType;

				_found = _mapClickPos inArea [_areaPosition, 200, 200, 0, false];

				deleteMarker "markerPlayArea";
				if(_found) then {
					_marker setMarkerColor "ColorRed";
					_marker setMarkerType "mil_objective";
					playArea = createMarker ["markerPlayArea", _areaPosition];
					playArea setMarkerShape "ELLIPSE";
					playArea setMarkerColor "ColorRed"; 
					playArea setMarkerSize [_areaRadious, _areaRadious]; 
					playArea setMarkerBrush "Grid";
					playAreaRadious = _areaRadious;
					publicVariable "playAreaRadious";
					publicVariable "playAreaPosition";

				};

			} forEach loadedAreas;

		}
	};
}