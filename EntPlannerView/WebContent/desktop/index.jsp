<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Entplanner</title>

<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-replace.js"></script>
<script type="text/javascript" src="js/Myriad_Pro_600.font.js"></script>

<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<link rel="stylesheet" type="text/css" href="css/wbox.css" />
<script type="text/javascript" src="js/wbox.js"></script>

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>

<link href="css/jquery-ui-timepicker-addon.css" rel="stylesheet"
	type="text/css" />
<script src="js/jquery-ui-timepicker-addon.js"></script>

<script type="text/javascript" src="js/html5.js"></script>

<script type="text/javascript" src="js/index.js"></script>

<script type="text/javascript" src="js/DistanceWidget.js"></script>

<style>
.form1_div {
	width: 100%;
	overflow: hidden;
	height: 32px
}
</style>
</head>
<body id="page1">
	<div class="extra">
		<div class="main">
			<!-- header -->
			<header>
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
				<article style="width: 267px; float: left">

					<div class="tabs_cont">
						<form id="form_1" name="form_1" action="processDisplay.csp" method="post"
							style="background-color: #ecf4fc; border: solid 1px #2f79db; border-radius: 6px; padding: 8px;">
							<div class="bg">

								<div class="form1_div">

									<input type="text" class="input" id="address" name="address">
									<strong>Current Add</strong>

								</div>
								<div class="form1_div">

									<input type="text" class="input" id="time" name="time"><strong>StartTime</strong>

								</div>

								<div class="form1_div">

									<input type="text" class="input" id="endTime" name="endTime"><strong>EndTime</strong>

								</div>

								<div class="form1_div">

									<input type="text" class="input" id="money" name="money"><strong>Money</strong>

								</div>


								<div class="form1_div">

									<strong>Trival Mode</strong> <select id="travelMode"
										name="travelMode">
										<option value="DRIVING" selected="selected">Driving</option>
										<option value="WALKING">Walking</option>
										<option value="BICYCLING">Bicyling</option>
									</select>

								</div>

								<div class="form1_div">

									<input type="text" class="input" id="area" name="area"
										readonly="readonly" /><strong>Area</strong>
									<!-- 
									<input id="areaMap" type="button" onclick=""
										value="Choose Area" style="float:right;margin-right: 10%;" />
									 -->
								</div>

								<div class="form1_div check_box">

									<input type="checkbox" id="movieCheck"><a href="#">Movie</a>
									<input type="checkbox" id="resCheck"><a href="#">Restaurant</a>
									<input type="checkbox" id="shopCheck"><a href="#">Shopping</a>
								</div>

								<div class="form1_div">

									<strong>Preference</strong> <select id="preference"
										name="preference">
										<option value="connect_first" selected="selected">Default</option>
										<option value="cost_first">Money First</option>
										<option value="time_first">Time Cost First</option>
									</select>

								</div>


								<div class="form1_div">
									<a href="#" class="button" onclick="submitButton();">Submit
										Query</a>

								</div>

							</div>
							<input type="hidden" id="sv" name="sv" value="false" />
							<input type="hidden" id="mv" name="mv" value="false" /> <input
								type="hidden" id="dv" name="dv" value="false" /> <input
								type="hidden" id="maxTime" name="maxTime" value="0" /> <input
								type="hidden" id="areaId" name="areaId" value="0" /> <input
								type="hidden" id="areaType" name="areaType" value="area" /> <input
								type="hidden" id="timeOrigin" name="timeOrigin" /> <input
								type="hidden" id="distance" name="distance" /> <input
								type="hidden" id="timeService" name="timeService" /> <input
								type="hidden" id="originLocation" name="originLocation" /> <input
								type="hidden" id="stationLocation" name="stationLocation" /> <input
								type="hidden" id="stationAddress" name="stationAddress" /> <input
								type="hidden" id="originDistance" name="originDistance" /> <input
								type="hidden" id="postcode" name="postcode" />


						</form>
					</div>

				</article>
				<article class="col1 pad_left1">
					<div class="text">
						<img src="images/text1.jpg" alt="">
						<h2>The Best Offers</h2>
						<p>Sed ut perspiciatis unde omnis iste natus error sit
							voluptatem accusantium doloremque laudantium, totam rem aperiam,
							eaque ipsa quae ab illo inventore.</p>
						<a href="#" class="button">Read More</a>
					</div>
				</article>
				<div class="img">
					<img src="images/img.jpg" alt="">
				</div>
			</header>
			<!-- / header -->
			<!-- content -->
			<section id="content">
				<article class="col1">
					<h3>Hot Travel</h3>
					<div class="pad">
						<div class="wrapper under">
							<figure class="left marg_right1">
								<img src="images/page1_img1.jpg" alt="">
							</figure>
							<p class="pad_bot2">
								<strong>Italy<br>Holidays
								</strong>
							</p>
							<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
								adipiscing.</p>
							<a href="#" class="marker_1"></a>
						</div>
						<div class="wrapper under">
							<figure class="left marg_right1">
								<img src="images/page1_img2.jpg" alt="">
							</figure>
							<p class="pad_bot2">
								<strong>Philippines<br>Travel
								</strong>
							</p>
							<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
								adipiscing.</p>
							<a href="#" class="marker_1"></a>
						</div>
						<div class="wrapper">
							<figure class="left marg_right1">
								<img src="images/page1_img3.jpg" alt="">
							</figure>
							<p class="pad_bot2">
								<strong>Cruise<br>Holidays
								</strong>
							</p>
							<p class="pad_bot2">Lorem ipsum dolor sit amet, consect etuer
								adipiscing.</p>
							<a href="#" class="marker_1"></a>
						</div>
					</div>
				</article>
				<article class="col2 pad_left1">
					<h2>Popular Places</h2>
					<div class="wrapper under">
						<figure class="left marg_right1">
							<img src="images/page1_img4.jpg" alt="">
						</figure>
						<p class="pad_bot2">
							<strong>Hotel du Havre</strong>
						</p>
						<p class="pad_bot2">Sed ut perspiciatis unde omnis iste natus
							error sit voluptatem accusantium doloremque laudantium, totam rem
							aperiam, eaque ipsa quae ab illo inventore veritatis et quasi
							architecto beatae vitae dicta sunt explicabo.</p>
						<p class="pad_bot2">
							<strong>Nemo enim ipsam voluptatem</strong> quia voluptas sit
							aspernatur aut odit aut fugit, sed quia consequuntur magni
							dolores eos qui ratione voluptatem sequi nesciunt. Neque porro
							quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur.
						</p>
						<a href="#" class="marker_2"></a>
					</div>
					<div class="wrapper">
						<figure class="left marg_right1">
							<img src="images/page1_img5.jpg" alt="">
						</figure>
						<p class="pad_bot2">
							<strong>Hotel Vacance</strong>
						</p>
						<p class="pad_bot2">At vero eos et accusamus et iusto odio
							dignissimos ducimus qui blanditiis praesentium voluptatum
							deleniti atque corrupti quos dolores et quas molestias excepturi
							sint occaecati cupiditate non provident, similique sunt in culpa.</p>
						<p class="pad_bot2">Et harum quidem rerum facilis est et
							expedita distinctio. Nam libero tempore, cum soluta nobis est
							eligendi optio cumque nihil impedit quo minus id quod maxime
							placeat facere possimus, omnis voluptas assumenda.</p>
						<a href="#" class="marker_2"></a>
					</div>
				</article>
			</section>
			<!-- / content -->
		</div>
		<div class="block"></div>
	</div>
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
	<script type="text/javascript">
		$('#time').datetimepicker();
		$('#endTime').datetimepicker();
	</script>

	<script type="text/javascript">
		var map;

		var markers = [];
		var dws = [];
		var searchMarkers = [];
		var radius = "2.5km";

		var placeLocation;
		var mapAddress;
		function mapinitialize() {

			var haightAshbury = new google.maps.LatLng(orignLat, orignlng);
			var mapOptions = {
				zoom : 12,
				center : haightAshbury,
				mapTypeId : google.maps.MapTypeId.ROADMAP
			};
			map = new google.maps.Map(document.getElementById('myMap'),
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

		// Add a marker to the map and push to the array.
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
										mapAddress = results[0].formatted_address;
										document.getElementById("selectButton").value = mapAddress;
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
										document.getElementById("selectButton").value = mapAddress;
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

			if (markers.length <= 0 && searchMarkers.length <= 0) {
				alert("no place be selected!!!");
			} else {
				//var value = placeLocation + "&" + mapAddress;
				//alert(value);
				wbox.close();
				$("#area").val(mapAddress);
				$("#areaId").val("0");
				$("#stationLocation").val(placeLocation);
				$("#stationAddress").val(mapAddress);
				$("#distance").val(radius);

			}
		}

		function displayInfo(widget) {
			var distance = Math.round(widget.get('distance') * 100) / 100;
			var info = document.getElementById('info');
			info.innerHTML = 'Radius: ' + distance + "km";
			radius = distance + "km";
		}

		var mapCallback = function() {
			mapinitialize();
		};

		var wbox = $("#area")
				.wBox(
						{
							opacity : 0.5,
							title : '<span style="font-size:14px">Area Choose</span>',
							html : "<input type='button' id='selectButton' onclick='mapSubmit();' value='select'/>  <input id='target' type='text' style='width:100%' placeholder='Search Box'><div id='info'></div><div id='myMap' style='width:500px;height:400px;'></div>",
							callBack : mapCallback
						});

		$("#movieCheck").bind('click', function() {

			
			if($("#movieCheck").get(0).checked){
				$("#mv").val("true");
			   
			}

		});

		$("#resCheck").bind('click', function()  {

			
			if($("#resCheck").get(0).checked){
				$("#dv").val("true");
			    
			}
		});
		
         $("#shopCheck").bind('click', function()  {

			
			if($("#shopCheck").get(0).checked){
				$("#sv").val("true");
			    
			}
		});
	</script>

</body>
</html>