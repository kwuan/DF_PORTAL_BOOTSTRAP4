<script language="JavaScript">
	$('.location-picker').locationpicker({
	    location: {
	        latitude: 13.741064,
	        longitude: 100.56186400000001
	    },
	    radius: 300,
	    inputBinding: {
	        latitudeInput: $('#latitude'),
	        longitudeInput: $('#longitude'),
	        radiusInput: $('#radius'),
	        locationNameInput: $('#location-address')
	    },
	    enableAutocomplete: true,
	    enableAutocompleteBlur: false,
	    autocompleteOptions: null,
	    addressFormat: 'postal_code',
	    enableReverseGeocode: true,
	    draggable: true,
	    onchanged: function(currentLocation, radius, isMarkerDropped) {},
	    onlocationnotfound: function(locationName) {},
	    oninitialized: function (component) {},
	    // must be undefined to use the default gMaps marker
	    markerIcon: undefined,
	    markerDraggable: true,
	    markerVisible : true
	}); 	
</script>