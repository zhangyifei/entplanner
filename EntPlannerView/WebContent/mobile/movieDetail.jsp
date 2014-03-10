<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Movie Detail</title>
	<link rel="stylesheet" href="jqmobile/jquery.mobile-1.4.0.css">
	
	<script src="js/jquery-1.9.1.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	
	<script src="jqmobile/jquery.mobile-1.4.0.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

    
    <script type="text/javascript" src="js/jquery.tagcloud.js"></script>

	<link rel="stylesheet" type="text/css" href="css/jRating.jquery.css" media="screen" />

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

<style>
		.movie-list thead th,
		.movie-list tbody tr:last-child {
			border-bottom: 1px solid #d6d6d6; /* non-RGBA fallback */
			border-bottom: 1px solid rgba(0,0,0,.1);
		}
		.movie-list tbody th,
		.movie-list tbody td {
			border-bottom: 1px solid #e6e6e6; /* non-RGBA fallback  */
			border-bottom: 1px solid rgba(0,0,0,.05);
		}
		.movie-list tbody tr:last-child th,
		.movie-list tbody tr:last-child td {
			border-bottom: 0;
		}
		.movie-list tbody tr:nth-child(odd) td,
		.movie-list tbody tr:nth-child(odd) th {
			background-color: #eeeeee; /* non-RGBA fallback  */
			background-color: rgba(0,0,0,.04);
		}
		
		#map-page, #map-canvas { width: 100%; height: 100%; padding: 0; }
</style>
    
<script type="text/javascript">
var movieLocation;
var marker;
var map;


var sv = new google.maps.StreetViewService();

var panorama;

function initialize() {

  panorama = new google.maps.StreetViewPanorama(document.getElementById('pano'));

  // Set up the map
  var mapOptions = {
    center: movieLocation,
    zoom: 16,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    streetViewControl: false
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);

  // getPanoramaByLocation will return the nearest pano when the
  // given radius is 50 meters or less.
  
  sv.getPanoramaByLocation(movieLocation, 50, processSVData);

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

						  var item = JSON.parse(document.getElementById("content").value);
							
							document.getElementById("theater").innerHTML = item.theater;
							document.getElementById("address").innerHTML = item.startLocationAddress;
							document.getElementById("movieName").innerHTML = item.movieName;
							
							document.getElementById("startTime").innerHTML = item.startTimePoint;
							

				       
							
						var resString = item.startLocation;
				        
				        
						movieLocation = new google.maps.LatLng(resString.split(",")[0], resString.split(",")[1]);


					//	google.maps.event.addDomListener(window, 'load',
					//			initialize);

					});
	
	function mapIni(){
		
		window.location.href="#map-page";
		window.location.reload();
		
	}
	
	$( document ).on( "pageinit", "#map-page", function() {
		initialize();
	});
</script>


</head>

<body>

<!-- Start of first page: #index -->
<div data-role="page" id="index">

	<div data-role="header">
		<h1>Ent Planner</h1>
	</div>
	
	<div data-role="navbar">
    <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#" class="ui-btn-active">Movie Detail</a></li>
        <li><a href="#" onclick="mapIni();">Street View</a></li>
    </ul>
     </div><!-- /navbar -->

	<!-- /header -->

	<div role="main" class="ui-content" >
	<input type="hidden" value='${item}' id="content"></input>
	
        
         <table data-role="table" id="movie-table-custom" data-mode="reflow" class="movie-list ui-responsive">
              <thead>
                <tr>
                  <th></th>
                  <th></th>
                </tr>
              </thead>
              <tbody>
                		<tr>
						<td>
							<h4>Theater</h4>
						</td>
						<td><span style="font-size: 14px;" id="theater"></span></td>
					</tr>
					<tr>
						<td>
							<h4>Address</h4>
						</td>
						<td><span style="font-size: 14px;" id="address"></span></td>
					</tr>
					<tr>
						<td>
							<h4>Movie Name</h4>
						</td>
						<td><span style="font-size: 14px;" id="movieName"></span></td>
					</tr>
					
					<tr>
						<td>
							<h4>Start Time</h4>
						</td>
						<td><span style="font-size: 14px;" id="startTime"></span></td>
					</tr>
            
              </tbody>
            </table>
	 
	</div><!-- /content -->

	<div data-role="footer" data-theme="a">
		<h4>Copyright 2014</h4>
	</div><!-- /footer -->
</div><!-- /page one -->

<!-- Start of second page: #map-page -->
<div data-role="page" id="map-page">
	<div data-role="header" data-theme="a">
	<h1>Theater Street View</h1>
	</div>
	<p><a href="#one" data-rel="back" class="ui-btn ui-shadow ui-corner-all ui-btn-inline ui-icon-back ui-btn-icon-left">Back to Movie Page</a></p>
   
	    <div role="main" class="ui-content" id="map-canvas" style="width: 97%; height: 60%;float:left"></div>
		<div data-role="footer" id="pano" style="width: 97%; height: 60%;float:left"></div>
         
 
</div>


</body>
</html>
