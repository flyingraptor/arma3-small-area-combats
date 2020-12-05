if(gameStarted == true) then {
	hint "The game is already started. You cannot set another area.";
} else {
	/* Close Dialog once enter the map */
	_baseDialogDisplay= findDisplay 1234;
	_baseDialogDisplay closeDisplay 1;

	/* Get from area list the selected number */
	lastSelectedIndex = lbCurSel 1500;
	playAreaRadious = lbData[1500, lastSelectedIndex];

	/* Convert to number to pass as parameter on Marker Size */
	playAreaRadiousNum = parseNumber playAreaRadious;

	/* Open map and capture on clock event to draw the play area*/
	openMap true;
	if (shownMap) then 
	{
		player onMapSingleClick 
		{
			if(gameStarted == false) then {
				deleteMarker "markerPlayArea";
				/* Get the are position from the implicit variable _pos */
				playAreaPosition = _pos;
				red_zone = createMarker ["markerPlayArea", playAreaPosition]; 
				red_zone setMarkerShape "ELLIPSE";
				"markerPlayArea" setMarkerColor "ColorRed"; 
				"markerPlayArea" setMarkerSize [playAreaRadiousNum, playAreaRadiousNum]; 
				"markerPlayArea" setMarkerBrush "SOLID";
			}
		};
	}
}

