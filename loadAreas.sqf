_name = worldName;

if(_name == "Altis") then {
	_areaPosition = [3139.69,21973.4,0];
	_areaRadious = 50;
	_markerName = "markerSAC1100";
	_markerColor = "ColorBlack";
	_markerType = "mil_circle";
	_marker = createMarker [_markerName, _areaPosition]; 
	_marker setMarkerShape "ICON";
	_marker setMarkerColor _markerColor;
	_marker setMarkerText " SAC-1-100";
	_marker setMarkerSize [1,1];
	_marker setMarkerType _markerType;

	_area = [_marker, _areaPosition, _areaRadious, _markerColor, _markerType];
	loadedAreas pushBack _area;
};