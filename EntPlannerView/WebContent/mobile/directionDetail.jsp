<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Direction Detail</title>
	<link rel="stylesheet" href="jqmobile/jquery.mobile-1.4.0.css">
	
	<script src="js/jquery-1.9.1.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	
	<script src="jqmobile/jquery.mobile-1.4.0.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<style>
		
		#map-page, #map-canvas { width: 100%; height: 100%; padding: 0; }
		
</style>
<style>
#map-canvas {
	width: 97%;
	height: 100%;
	margin: 0px;
	padding: 0px
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	background-color: #fff;
	padding: 5px;
	border: 1px solid #999;
}
</style>
<style>
#directions-panel {
	margin-right: 0;
	height: 100%;
	float: left;
	width: 97%;
	overflow: auto;
}

#map-canvas {
	margin-left: 0;
}

#control {
	background: #fff;
	padding: 5px;
	font-size: 14px;
	font-family: Arial;
	border: 1px solid #ccc;
	box-shadow: 0 2px 2px rgba(33, 33, 33, 0.4);
	display: none;
}

@media print {
	#map-canvas {
		height: 500px;
		margin: 0;
	}
	#directions-panel {
		float: none;
		width: auto;
	}
}


</style>    
<script type="text/javascript">
var directionsDisplay;
var directionsService = new google.maps.DirectionsService();
var startL;
var endL;
var curLat;
var curLng;

function getCurrentLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(handlePosition,
				handleError);
	} else {
		alert("No browser support for geolaction!");
	}

}

function handleError(err) {

}

function handlePosition(position) {
	curLat = position.coords.latitude;
	curLng = position.coords.longitude;

}

function initializeLocation() {
	//	alert(document.getElementById("content").value);
	var item = JSON.parse(document.getElementById("content").value);
	//alert(item.startLocation);
	//alert(item.destination);
	startL = item.startLocation;
	endL = item.destination;

	//alert(startL);
	//alert(endL);

}
function initialize() {

	getCurrentLocation();
	initializeLocation();
	directionsDisplay = new google.maps.DirectionsRenderer();
	var mapOptions = {
		zoom : 7,
		mapTypeId : google.maps.MapTypeId.ROADMAP,
		center : new google.maps.LatLng(curLat, curLng)
	};
	var map = new google.maps.Map(document.getElementById('map-canvas'),
			mapOptions);
	directionsDisplay.setMap(map);
	directionsDisplay.setPanel(document.getElementById('directions-panel'));

	var control = document.getElementById('control');
	control.style.display = 'block';
	map.controls[google.maps.ControlPosition.TOP_CENTER].push(control);
	calcRoute();

}

function calcRoute() {
	var selectedMode = document.getElementById('mode').value;
	//var start = "chicago, il";
	//var end = "st louis, mo";
	var request = {
		origin : startL,
		destination : endL,
		travelMode : google.maps.TravelMode[selectedMode]
	};
	directionsService.route(request, function(response, status) {
		if (status == google.maps.DirectionsStatus.OK) {
			directionsDisplay.setDirections(response);
		}
	});
}

google.maps.event.addDomListener(window, 'load', initialize);

document.addEventListener('deviceready',function(){

   
},true);


</script>


</head>

<body>


<!-- Start of second page: #map-page -->
<div data-role="page" id="map-page" data-iscroll="enable">
	<div data-role="header" data-theme="a">
	<h1>Direction Detail</h1>
	</div>
		<input type="hidden" value='${item}' id="content"></input>
	
		<div id="control">
			<b>Mode of Travel: </b> <select id="mode" onchange="calcRoute();">
				<option value="DRIVING">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicycling</option>
				<option value="TRANSIT">Transit</option>
			</select>
		</div>
		
    
		<div id="map-canvas"></div>
		<div id="directions-panel"></div>
	
</div>


</body>
</html>
