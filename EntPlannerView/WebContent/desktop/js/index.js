var orignLat = null;
var orignlng = null;

$(document).ready(function() {

	getLocation();

});

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
	

	form.submit();
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
