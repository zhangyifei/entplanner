<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.9.1.js"></script>

<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_600.font.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
<script type="text/javascript" src="js/html5.js"></script>


<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<title>Direction Detail</title>




<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=panoramio"></script>
<style>
#map-canvas {
	width: 500px;
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
	float: right;
	width: 400px;
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
</script>
</head>
<body>

	<!-- header -->
	<header style="margin: 0 auto; width: 960px; position: relative">
		<div class="wrapper">
			<h1>
				<a href="index.csp" id="logo">Around the World</a>
			</h1>

		</div>
		<nav>
			<ul id="menu">
				<li style="width: 43%"><a href="index.csp" class="nav1">Home</a></li>
				<li style="width: 34%"><a href="About.html" class="nav2">About
						Us </a></li>
				<li style="width: 23%"><a href="Contacts.html" class="nav3">Contacts</a></li>
			</ul>
		</nav>

		<div class="text">
			<img src="images/text1.jpg" alt="">
			<h2>The Best Offers</h2>
			<p>Sed ut perspiciatis unde omnis iste natus error sit voluptatem
				accusantium doloremque laudantium, totam rem aperiam, eaque ipsa
				quae ab illo inventore veritatis et quasi architecto beatae vitae
				dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas.</p>
			<a href="#" class="button">Read More</a>
		</div>
		<div class="img">
			<img src="images/img2.jpg" alt="">
		</div>
	</header>
	<!-- / header -->


	<input type="hidden" value='${item}' id="content"></input>
	<header
		style="margin: 0 auto; height: 550px; width: 960px; position: relative">
		<div id="control">
			<b>Mode of Travel: </b> <select id="mode" onchange="calcRoute();">
				<option value="DRIVING">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicycling</option>
				<option value="TRANSIT">Transit</option>
			</select>
		</div>

		<div class="block">

			<h2 id="title" style="font-size: 30px; font-weight: 600; color: #3081c8; line-height: 50px; padding: 2px 0 33px 0">Direction Detail</h2>

		</div>
		<!-- content -->

		<div id="directions-panel"></div>
		<!-- / content -->
		<div id="map-canvas"></div>
	</header>

	<div class="block"></div>

	<div class="body1">
		<div class="main">
			<!-- footer -->
			<footer>
				Website template designed by <a
					href="http://www.templatemonster.com/" target="_blank"
					rel="nofollow">www.templatemonster.com</a><br> 3D Models
				provided by <a href="http://www.templates.com/product/3d-models/"
					target="_blank" rel="nofollow">www.templates.com</a>
			</footer>
			<!-- / footer -->
		</div>
	</div>


	<script type="text/javascript">
		Cufon.now();
	</script>
	<!-- / header -->






</body>
</html>