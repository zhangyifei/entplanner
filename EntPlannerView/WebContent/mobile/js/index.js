var orignLat = null;
var orignlng = null;

$(document).ready(function() {
	
	getLocation();
	
	
	$('#time').scroller({
	      preset: 'datetime',
	      theme: 'android',
	      display: 'modal',
	      mode: 'scroller'
	    }); 
	
	$('#endTime').scroller({
	      preset: 'datetime',
	      theme: 'android',
	      display: 'modal',
	      mode: 'scroller'
	    }); 
	

	$("#movieCheck").bind('click', function() {

	
		
		if($("#movieCheck").get(0).checked){
			//alert("true");
			$("#mv").val("true");
		   
		}else{
			
			$("#mv").val("false");
			
		}

	});

	$("#resCheck").bind('click', function()  {

		
		if($("#resCheck").get(0).checked){
			//alert("true");

			$("#dv").val("true");
		    
		}else{
			
			$("#dv").val("false");
			
		}
	});
	
     $("#shopCheck").bind('click', function()  {

		
		if($("#shopCheck").get(0).checked){
			//alert("true");

			$("#sv").val("true");
		    
		}else{
			
			$("#sv").val("false");
			
		}
	});
     
     $("#area").bind('click', function()  {

    	// alert("true");
    	 window.location.href="#map-page";
    	// $("#map-page").load("#map-page");
    	 window.location.reload();
    	//mapinitialize();
 	});

});


//initialize map

var map;

var markers = [];
var dws = [];
var searchMarkers = [];
var radius = "2.5km";

var placeLocation;
var mapAddress;

//function mapinitialize() {
//	
//	var haightAshbury = new google.maps.LatLng(orignLat,orignlng);
//	var mapOptions = {
//		zoom : 12,
//		center : haightAshbury,
//		mapTypeId : google.maps.MapTypeId.ROADMAP
//	};
//	map = new google.maps.Map(document.getElementById('map-canvas'),
//			mapOptions);
//
//	google.maps.event.addListener(map, 'click', function(event) {
//		addMarker(event.latLng);
//	});
//
//	var input = document.getElementById('target');
//	var searchBox = new google.maps.places.SearchBox(input);
//
//	google.maps.event
//			.addListener(
//					searchBox,
//					'places_changed',
//					function() {
//						var places = searchBox.getPlaces();
//
//						for ( var i = 0, marker; marker = searchMarkers[i]; i++) {
//							marker.setMap(null);
//						}
//
//						searchMarkers = [];
//						var bounds = new google.maps.LatLngBounds();
//						for ( var i = 0, place; place = places[i]; i++) {
//							var image = {
//								url : place.icon,
//								size : new google.maps.Size(71, 71),
//								origin : new google.maps.Point(0, 0),
//								anchor : new google.maps.Point(17, 34),
//								scaledSize : new google.maps.Size(25,
//										25)
//							};
//
//							var marker = new google.maps.Marker({
//								map : map,
//								icon : image,
//								title : place.name,
//								position : place.geometry.location
//							});
//
//							google.maps.event.addListener(marker,
//									'click', function() {
//										deleteOverlays();
//										putAddressOnButton(marker
//												.getPosition());
//
//									});
//
//							searchMarkers.push(marker);
//
//							bounds.extend(place.geometry.location);
//						}
//
//						map.fitBounds(bounds);
//					});
//
//	google.maps.event.addListener(map, 'bounds_changed', function() {
//		var bounds = map.getBounds();
//		searchBox.setBounds(bounds);
//	});
//
//}





$(document).on("pageinit","#map-page",function() {mapinitialize();});

function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(handlePosition, handleError);
	} else {
		alert("No browser support for geolaction!");
	}

}

function handleError(err) {

}

function handlePosition(position) {
	var lat = position.coords.latitude;
	var lng = position.coords.longitude;

	orignLat = lat;
	orignlng = lng;

	// code for IE7+, Firefox, Chrome, Opera, Safari

	 var geocoder = new google.maps.Geocoder();
	 var latlng = new google.maps.LatLng(lat,lng);
	 
	 geocoder.geocode({'latLng': latlng}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      if (results[0]) {
		       // alert(results[0].formatted_address);
		        $("#address").val(results[0].formatted_address);
		      } else {
		        alert('No results found');
		      }
		    } else {
		      alert('Geocoder failed due to: ' + status);
		    }
		  });
	 
}



function mapinitialize() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(handlePositionMap, handleErrorMap);
	} else {
		alert("No browser support for geolaction!");
	}

}

function handleErrorMap(err) {

}

function handlePositionMap(position) {
	var lat = position.coords.latitude;
	var lng = position.coords.longitude;

	orignLat = lat;
	orignlng = lng;

	// code for IE7+, Firefox, Chrome, Opera, Safari

	 var geocoder = new google.maps.Geocoder();
	 var latlng = new google.maps.LatLng(lat,lng);
	 
	 geocoder.geocode({'latLng': latlng}, function(results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		      if (results[0]) {
		       // alert(results[0].formatted_address);
		        $("#address").val(results[0].formatted_address);
		      } else {
		        alert('No results found');
		      }
		    } else {
		      alert('Geocoder failed due to: ' + status);
		    }
		  });
	 
	 
    //initialize map
	var haightAshbury = new google.maps.LatLng(orignLat,orignlng);
	var mapOptions = {
		zoom : 12,
		center : haightAshbury,
		mapTypeId : google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);

	google.maps.event.addListener(map, 'click', function(event) {
		addMarker(event.latLng);
	});

	var input = document.getElementById('target');
	var searchBox = new google.maps.places.SearchBox(input);

	google.maps.event
			.addListener(
					searchBox,
					'places_changed',
					function() {
						var places = searchBox.getPlaces();

						for ( var i = 0, marker; marker = searchMarkers[i]; i++) {
							marker.setMap(null);
						}

						searchMarkers = [];
						var bounds = new google.maps.LatLngBounds();
						for ( var i = 0, place; place = places[i]; i++) {
							var image = {
								url : place.icon,
								size : new google.maps.Size(71, 71),
								origin : new google.maps.Point(0, 0),
								anchor : new google.maps.Point(17, 34),
								scaledSize : new google.maps.Size(25,
										25)
							};

							var marker = new google.maps.Marker({
								map : map,
								icon : image,
								title : place.name,
								position : place.geometry.location
							});

							google.maps.event.addListener(marker,
									'click', function() {
										deleteOverlays();
										putAddressOnButton(marker
												.getPosition());

									});

							searchMarkers.push(marker);

							bounds.extend(place.geometry.location);
						}

						map.fitBounds(bounds);
					});

	google.maps.event.addListener(map, 'bounds_changed', function() {
		var bounds = map.getBounds();
		searchBox.setBounds(bounds);
	});

	 
}


//Add a marker to the map and push to the array.
function addMarker(location) {
	deleteOverlays();
	radius = "2.5km";

	var marker = new google.maps.Marker({
		position : location,
		map : map,
		animation : google.maps.Animation.DROP
	});
	markers.push(marker);

	var distanceWidget = new DistanceWidget(map, location);
	google.maps.event.addListener(distanceWidget, 'distance_changed',
			function() {
				displayInfo(distanceWidget);
			});

	google.maps.event.addListener(distanceWidget, 'position_changed',
			function() {
				displayInfo(distanceWidget);
			});

	dws.push(distanceWidget);

	var info = document.getElementById('info');
	info.innerHTML = 'Radius: ' + radius;

	//var url = "http://maps.google.com/maps/api/geocode/json?latlng="
	//		+ location.toUrlValue(6) + "&sensor=false";
	// code for IE7+, Firefox, Chrome, Opera, Safari

	var llt = location.toUrlValue(6).split(",");
	var lat = parseFloat(llt[0]);
	var lng = parseFloat(llt[1]);

	
	var latlng = new google.maps.LatLng(lat, lng);

	var geocoder = new google.maps.Geocoder();

 
	geocoder
			.geocode(
					{
						'latLng' : latlng
					},
					function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
					
							if (results[0]) {
								
								placeLocation = location.toUrlValue(6);
								//alert(placeLocation);
								mapAddress = results[0].formatted_address;
								//document.getElementById("selectButton").innnerHTML = mapAddress;
								info.innerHTML = 'Radius: ' + radius + "---"+mapAddress;;
								
								var l = results[0].address_components.length;
								$("#postcode")
										.val(
												results[0].address_components[l - 1].long_name);
							} else {
								alert('No results found');
							}
						} else {
							alert('Geocoder failed due to: ' + status);
						}
					});

}
//put address on the button when user click the place which is get by search
function putAddressOnButton(location) {

	//var url = "http://maps.google.com/maps/api/geocode/json?latlng="
	//		+ location.toUrlValue(6) + "&sensor=false";
	// code for IE7+, Firefox, Chrome, Opera, Safari
	deleteOverlays();
	radius = "2.5km";

	var distanceWidget = new DistanceWidget(map, location);
	google.maps.event.addListener(distanceWidget, 'distance_changed',
			function() {
				displayInfo(distanceWidget);
			});

	google.maps.event.addListener(distanceWidget, 'position_changed',
			function() {
				displayInfo(distanceWidget);
			});

	dws.push(distanceWidget);

	var info = document.getElementById('info');
	info.innerHTML = 'Radius: ' + radius;

	var llt = location.toUrlValue(6).split(",");
	var lat = parseFloat(llt[0]);
	var lng = parseFloat(llt[1]);

	var latlng = new google.maps.LatLng(lat, lng);

	var geocoder = new google.maps.Geocoder();

	geocoder
			.geocode(
					{
						'latLng' : latlng
					},
					function(results, status) {
						if (status == google.maps.GeocoderStatus.OK) {
							if (results[0]) {
								placeLocation = location.toUrlValue(6);
								mapAddress = results[0].formatted_address;
								//document.getElementById("selectButton").innnerHTML = mapAddress;
								info.innerHTML = 'Radius: ' + radius + "---"+mapAddress;;

								var l = results[0].address_components.length;
								$("#postcode")
										.val(
												results[0].address_components[l - 1].long_name);
							} else {
								alert('No results found');
							}
						} else {
							alert('Geocoder failed due to: ' + status);
						}
					});

}
// Sets the map on all markers in the array.
function setAllMap(map) {
	for ( var i = 0; i < markers.length; i++) {
		markers[i].setMap(map);
	}
}

// Removes the overlays from the map, but keeps them in the array.
function clearOverlays() {
	setAllMap(null);

}

// Shows any overlays currently in the array.
function showOverlays() {
	setAllMap(map);
}

// Deletes all markers in the array by removing references to them.
function deleteOverlays() {
	clearOverlays();
	markers = [];
	clearDws();
}

function clearDws() {

	for ( var i = 0; i < dws.length; i++) {
		dws[i].clearMap();
	}
	dws = [];
}

function mapSubmit() {
//
//	if (markers.length <= 0 && searchMarkers.length <= 0) {
//		alert("no place be selected!!!");
//	} else {
//		//var value = placeLocation + "&" + mapAddress;
//		//alert(value);
//		wbox.close();
		$("#area").val(mapAddress);
		$("#areaId").val("0");
		$("#stationLocation").val(placeLocation);
		$("#stationAddress").val(mapAddress);
		$("#distance").val(radius);
//
//	}
	
	 window.location.href="#index";
}

function displayInfo(widget) {
	var distance = Math.round(widget.get('distance') * 100) / 100;
	var info = document.getElementById('info');
	info.innerHTML = 'Radius: ' + distance + "km ---"+mapAddress;
	radius = distance + "km";
}




///////submit event

function submitButton() {

	calculateDistances($("#stationLocation").val());
	// alert("submit");
}

function calculateDistances(logLatPtStr) {
	var select = document.getElementById("travelMode");
	var travelMode = select.options[select.selectedIndex].value;

	var ll1 = logLatPtStr.split(",");
	var orignLat1 = parseFloat(ll1[0]);
	var orignlng1 = parseFloat(ll1[1]);

	var ll2 = calculateLL(2.5, logLatPtStr, 45).split(",");
	var dLat = parseFloat(ll2[0]);
	var dLng = parseFloat(ll2[1]);

	var ll3 = calculateLL(2.5, logLatPtStr, 225).split(",");
	var dLat3 = parseFloat(ll3[0]);
	var dLng3 = parseFloat(ll3[1]);

	var origin = new google.maps.LatLng(orignLat, orignlng);
	var origin1 = new google.maps.LatLng(orignLat1, orignlng1);
	var destinationA = new google.maps.LatLng(dLat, dLng);
	var destinationB = new google.maps.LatLng(dLat3, dLng3);

	
	var service = new google.maps.DistanceMatrixService();
	service.getDistanceMatrix({
		origins : [ origin, origin1 ],
		destinations : [ origin1, destinationA, destinationB ],
		travelMode : travelMode,
		unitSystem : google.maps.UnitSystem.METRIC,
		avoidHighways : false,
		avoidTolls : false
	}, callback);
}

function callback(response, status) {
	if (status != google.maps.DistanceMatrixStatus.OK) {
		alert('Error was: ' + status);
	} else {
		// var origins = response.originAddresses;
		// var destinations = response.destinationAddresses;
		// alert(JSON.stringify(response));

		var originToStation = response.rows[0].elements[0].duration.text;

		$("#originDistance").val(
				response.rows[0].elements[0].distance.value / 1000 + "km"); // use
																			// km
																			// or m
																			// to
																			// decorate

		var stationToD1 = response.rows[1].elements[1].duration.text;

		var stationToD2 = response.rows[1].elements[2].duration.text;

		// alert(originToStation+"---"+stationToD1+"---"+stationToD2);
		setValuesAndSubmit(originToStation, stationToD1, stationToD2);
	}
}

function setValuesAndSubmit(originToStation, stationToD1, stationToD2) {
	$("#originLocation").val(orignLat + "," + orignlng);
	//$("#distance").val("2.5km");


	var oTs = parseInt(originToStation.split("m")[0]);
	var sTd1 = parseInt(stationToD1.split("m")[0]);
	var sTd2 = parseInt(stationToD2.split("m")[0]);

	$("#timeOrigin").val(Math.ceil(oTs + (sTd1 + sTd2) / 2 * 0.7));
	$("#timeService").val(Math.ceil((sTd1 + sTd2) * 0.7));
	
	calculateTime();

	var form = $("#form_1");
	
    var string = JSON.stringify(form.serializeArray())
	
    alert(string);
    
    $.mobile.changePage("processDisplay.csp",
    		  { type: "post",
    	         transition: "slideup",
    		    data: form.serialize()
    		  },
    		   "pop", false, false
    		)
    		
	//form.submit();
	// alert($("#input").serialize());

}

function calculateLL(distance, logLatPtStr, angle) {

	var ll = logLatPtStr.split(",");
	var lat1 = parseFloat(ll[0]);
	var lng1 = parseFloat(ll[1]);

	var lat = lat1 + (distance * Math.cos(angle * Math.PI / 180)) / 111;
	var lng = lng1 + (distance * Math.sin(angle * Math.PI / 180))
			/ (111 * Math.cos(lat1 * Math.PI / 180));

	var logLat = lat + "," + lng;

	return logLat;
}

function calculateTime(){
	
	var start = Date.parse($("#time").val());
	var end = Date.parse($("#endTime").val());
	var duration = (end-start)/1000/60;
	$("#maxTime").val(duration);
	//alert($("#maxTime").val());
	//alert($("#time").val());

	
}