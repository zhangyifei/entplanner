<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Display Plans</title>

<link rel="stylesheet" href="jqmobile/jquery.mobile-1.4.0.css">
	
	<script src="js/jquery-1.9.1.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&libraries=places"></script>
	
	<script src="jqmobile/jquery.mobile-1.4.0.js"></script>
	
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
	<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    
    
    
    <link rel="stylesheet" href="css/mobiscroll.css" type="text/css" media="all" />
    <script src="js/mobiscroll.js"></script>
    
    
    <link rel="stylesheet" type="text/css" href="css/jRating.jquery.css" media="screen" />

    <script type="text/javascript" src="js/jRating.jquery.js"></script>
    
    <script src="js/displayPlans.js"></script>	
	
</head>
<body>
<!-- Start of first page: #index -->
<div data-role="page" id="index">

	<div data-role="header">
		<h1>Ent Planner</h1>
	</div>
	
	<div data-role="navbar">
    <ul>
        <li><a href="#" >Home</a></li>
        <li><a href="#" class="ui-btn-active">Plans</a></li>
    </ul>
     </div><!-- /navbar -->

	<!-- /header -->

   
     
	<div role="main" class="ui-content" >
	
            <c:if test="${items_size == 0 }">

			 <h4 >No acceptable plans, please try again.</h4>

		    </c:if>
		    
		 
		   <ul data-role="listview" class="ui-listview-outer" data-inset="false">
             
            
             <c:forEach var='item' items='${items}' varStatus="status">
		    
		       <li data-role="collapsible" data-iconpos="right" data-inset="false">
                  <h2>${item.name} 
                   <label id='${item.id}_Rating'></label>
                   <label>Estimated Time: ${item.displayDuration}</label>
                  </h2>
                    <script>
						//alert('${item.rating}');
						$("#${item.id}_Rating").attr("data-average", "${item.rating}");
						$("#${item.id}_Rating").jRating({
							isDisabled : true,
							rateMax : 5
						});
						
				    </script>
                    
				    
				   
				  <ul id='${item.id}_Detail' data-role="listview" data-shadow="false" data-inset="true" data-corners="false">         
				  </ul>
				    
				    <input type="hidden" id='${item.id}' value='${item.json}'>
					     
					 <script>
					         displayPlan('${item.id}','${item.id}_Detail');
					 </script>
              </li>
 
             </c:forEach>
           </ul>
          
				  
	 
	</div><!-- /content -->

	<div data-role="footer" data-theme="a">
		<h4>Copyright 2014</h4>
	</div><!-- /footer -->
</div><!-- /page one -->
</body>
</html>