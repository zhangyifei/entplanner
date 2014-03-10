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

<script
	src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=panoramio"></script>

<script type="text/javascript" src="js/jquery.tagcloud.js"></script>

<link rel="stylesheet" type="text/css" href="css/jRating.jquery.css"
	media="screen" />

<script type="text/javascript" src="js/jRating.jquery.js"></script>

<style>

#tagcloud a {
	text-decoration: none;
}

#tagcloud a:hover {
	text-decoration: underline;
}

#tagcloud {
	margin: 25px auto;
	font: 75% Arial, "MS Trebuchet", sans-serif;
}
</style>

<script type="text/javascript">
	var restaurant;
	var marker;
	var map;

	
	var sv = new google.maps.StreetViewService();

	var panorama;

	function initialize() {

	  panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'));

	  // Set up the map
	  var mapOptions = {
	    center: restaurant,
	    zoom: 16,
	    mapTypeId: google.maps.MapTypeId.ROADMAP,
	    streetViewControl: false
	  };
	  map = new google.maps.Map(document.getElementById('map-canvas'),
	      mapOptions);

	  // getPanoramaByLocation will return the nearest pano when the
	  // given radius is 50 meters or less.
	  
	  sv.getPanoramaByLocation(restaurant, 50, processSVData);
	
	}

	function processSVData(data, status) {
	  if (status == google.maps.StreetViewStatus.OK) {
	    var marker = new google.maps.Marker({
	      position: data.location.latLng,
	      map: map,
	      title: data.location.description
	    });

	    panorama.setPano(data.location.pano);
	    panorama.setPov({
	      heading: 270,
	      pitch: 0
	    });
	    panorama.setVisible(true);

	    google.maps.event.addListener(marker, 'click', function() {

	      var markerPanoID = data.location.pano;
	      // Set the Pano to use the passed panoID
	      panorama.setPano(markerPanoID);
	      panorama.setPov({
	        heading: 270,
	        pitch: 0
	      });
	      panorama.setVisible(true);
	    });
	  } else {
	    alert('Street View data not found for this location.');
	  }
	}
	
	
	$(document)
			.ready(
					function() {

						
						var item = JSON.parse(document
								.getElementById("content").value);

						document.getElementById("diningName").innerHTML = item.name;
						document.getElementById("address").innerHTML = item.startLocationAddress;
						document.getElementById("phone").innerHTML = item.telephone;

						document.getElementById("website").innerHTML = item.website;

						var types = item.types.split(",");
						var typesHTML = new String();

						for ( var i = 0; i < types.length; i++) {
							typesHTML = typesHTML + '<a href="#" rel="'+i+'">'
									+ types[i] + '</a>';
						}

						$("#types").html(typesHTML);

						$("#rating").attr("data-average", item.rating);
						$("#rating").jRating({
							isDisabled : true,
							rateMax : 5
						});

						$("#types a").tagcloud({
							size : {
								start : parseInt("14"),
								end : parseInt("18"),
								unit : "pt"
							},
							color : {
								start : "#CDE",
								end : "#F52"
							}

						});

						var resString = item.startLocation;

						restaurant = new google.maps.LatLng(resString
								.split(",")[0], resString.split(",")[1]);

						google.maps.event.addDomListener(window, 'load',
								initialize);

					});
</script>

<title>Shopping Detail</title>
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
	<header style="margin: 0 auto; width: 960px; position: relative; height:594px">

		<div style="width: 100%; height: 10%;float:left">

			<h2 id="title"
				style="font-size: 30px; font-weight: 600; color: #3081c8; line-height: 50px; padding: 2px 0 33px 0">Shopping Detail</h2>

		</div>
		<!-- content -->

		
		<div id="map-canvas" style="width: 50%; height: 45%;float:left"></div>
		<div id="pano" style="width: 50%; height: 45%;float:left"></div>
        <div style="width: 100%; height: 8%;float:left"></div>
		<div id="contentPanel">
			<table width="100%" cellpadding="5" cellspacing="8">
				<tr>
					<td>
						<h4>Name</h4>
					</td>
					<td><span style="font-size: 14px;" id="diningName"></span></td>
				</tr>
				<tr>
					<td>
						<h4>Address</h4>
					</td>
					<td><span style="font-size: 14px;" id="address"></span></td>
				</tr>
				<tr>
					<td>
						<h4>Phone</h4>
					</td>
					<td><span style="font-size: 14px;" id="phone"></span></td>
				</tr>
				<tr>
					<td>
						<h4>Rating</h4>
					</td>
					<td><div id="rating" data-id="4"></div></td>
				</tr>
				<tr>
					<td>
						<h4>Website</h4>
					</td>
					<td><span style="font-size: 14px;" id="website"></span></td>
				</tr>

				<tr>
					<td>
						<h4>Types</h4>
					</td>
					<td>

						<div id="types"></div>

					</td>
				</tr>

			</table>

		</div>
	</header>




	

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