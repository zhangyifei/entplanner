<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Ent Planner</title>
	<link rel="stylesheet" href="jqmobile/jquery.mobile-1.4.0.css">
	
	<script src="js/jquery-1.9.1.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	
	<script src="jqmobile/jquery.mobile-1.4.0.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	
	<link href="css/jquery-ui-timepicker-addon.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-ui-timepicker-addon.js"></script>
    
    <link rel="stylesheet" href="css/mobiscroll.css" type="text/css" media="all" />
    <script src="js/mobiscroll.js"></script>
    
    
    <script type="text/javascript" src="js/DistanceWidget.js"></script>
	
	
	<link rel="stylesheet" type="text/css" href="css/jRating.jquery.css" media="screen" />

    <script type="text/javascript" src="js/jRating.jquery.js"></script>
    
    <script src="js/index.js"></script>	
    
    <script src="js/displayPlans.js"></script>	
	
<style>
		#map-page, #map-canvas { width: 100%; height: 100%; padding: 0; }
</style>

</head>

<body>

<!-- Start of first page: #index -->
<div data-role="page" id="index">

	<div data-role="header">
		<h1>Ent Planner</h1>
	</div>
	
	<div data-role="navbar">
    <ul>
        <li><a href="#" class="ui-btn-active">Home</a></li>
        <li><a href="#">About Us</a></li>
        <li><a href="#">Contacts</a></li>
    </ul>
     </div><!-- /navbar -->

	<!-- /header -->

	<div role="main" class="ui-content" >
	<form id="form_1" name="form_1" action="processDisplay.csp" method="post">
	 
	    <div class="ui-field-contain">
               <label for="address">Current Location:</label>
               <input type="text" name="address" id="address" placeholder="Current Location" value="">             
       </div>
        <div class="ui-field-contain">
	           <label for="area">Target Area:</label>
               <input type="text" name="area" id="area" placeholder="Please Click" readonly="readonly" value=""> 
               
      </div>
      
	   <div class="ui-field-contain">
	           <label for="time">Start Time:</label>
               <input type="text" name="time" id="time" placeholder="Start Time" value="">
	   </div>
	   <div class="ui-field-contain">
	           <label for="endTime">End Time:</label>
               <input type="text" name="endTime" id="endTime" placeholder="End Time" value="">
	   </div>
	   <div class="ui-field-contain">
	           <label for="money">Money:</label>
               <input type="text" name="money" id="money" placeholder="100" value=""> 
                         
	   </div>
	   
	   <div class="ui-field-contain">
          <label for="travelMode">Travel Mode:</label>
          <select id="travelMode" name="travelMode">
				<option value="DRIVING" selected="selected">Driving</option>
				<option value="WALKING">Walking</option>
				<option value="BICYCLING">Bicyling</option>
		 </select>
       </div>
   
      
      <div class="ui-field-contain">
      <label >Activities:</label>
      <fieldset data-role="controlgroup" data-type="horizontal">
        <input type="checkbox" name="movieCheck" id="movieCheck">
        <label for="movieCheck">Movie</label>
        <input type="checkbox" name="resCheck" id="resCheck">
        <label for="resCheck">Restaurant</label>
        <input type="checkbox" name="shopCheck" id="shopCheck">
        <label for="shopCheck">Shopping</label>
     </fieldset>
      </div>
      
      <div class="ui-field-contain">
          <label for="preference">Preference:</label>
          <select id="preference" name="preference">
				<option value="connect_first" selected="selected">Default</option>
			    <option value="cost_first">Money First</option>
				<option value="time_first">Time Cost First</option>
		 </select>
       </div>
       
      <div class="ui-input-btn ui-btn ui-corner-all ui-shadow">
        Build Plans
        <input type="button" data-enhanced="true" value="Input value" onclick="submitButton();">
    </div>
    
     <input type="hidden" id="sv" name="sv" value="false" />
	 <input type="hidden" id="mv" name="mv" value="false" /> 
	 <input type="hidden" id="dv" name="dv" value="false" /> 
	 <input type="hidden" id="maxTime" name="maxTime" value="0" /> 
	 <input type="hidden" id="areaId" name="areaId" value="0" /> 
	 <input type="hidden" id="areaType" name="areaType" value="area" /> 
	 <input type="hidden" id="timeOrigin" name="timeOrigin" /> 
	 <input type="hidden" id="distance" name="distance" /> 
	 <input type="hidden" id="timeService" name="timeService" /> 
	 <input type="hidden" id="originLocation" name="originLocation" /> 
	 <input type="hidden" id="stationLocation" name="stationLocation" /> 
	 <input type="hidden" id="stationAddress" name="stationAddress" /> 
	 <input type="hidden" id="originDistance" name="originDistance" /> 
	 <input type="hidden" id="postcode" name="postcode" />
								
	</form>
	 
	</div><!-- /content -->

	<div data-role="footer" data-theme="a">
		<h4>Copyright 2014</h4>
	</div><!-- /footer -->
</div><!-- /page one -->


<!-- Start of second page: #map-page -->
<div data-role="page" id="map-page">
	<div data-role="header" data-theme="a">
	<h1>Area Choose</h1>
	</div>
    <input type='button' id='selectButton' onclick='mapSubmit();' value='select'/>  
    <input id='target' type='text' style='width:100%' placeholder='Search Box'/>
    <div id='info'></div>
	<div role="main" class="ui-content" id="map-canvas">
		<!-- map loads here... -->
	</div>
	<div data-role="footer">
		<h4>Copyright 2014</h4>
	</div><!-- /footer -->
</div>


</body>
</html>
