<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Display</title>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="all">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="all">
<link rel="stylesheet" href="css/style.css" type="text/css" media="all">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />

<script type="text/javascript" src="js/jquery-1.9.1.js"></script>
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
<script type="text/javascript" src="js/displayPlans.js"></script>
<link rel="stylesheet" type="text/css" href="css/jRating.jquery.css" media="screen" />

<script type="text/javascript" src="js/jRating.jquery.js"></script>




</head>
<body>
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

				<div class="text">
					<img src="images/text1.jpg" alt="">
					<h2>The Best Offers</h2>
					<p>Sed ut perspiciatis unde omnis iste natus error sit
						voluptatem accusantium doloremque laudantium, totam rem aperiam,
						eaque ipsa quae ab illo inventore veritatis et quasi architecto
						beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia
						voluptas.</p>
					<a href="#" class="button">Read More</a>
				</div>
				<div class="img">
					<img src="images/img2.jpg" alt="">
				</div>
			</header>
			<!-- / header -->

			<!-- content -->
			<section id="content">
				<article style="{width:100%}">
					<h3>Plans</h3>
					<div class="pad">
						<c:if test="${items_size == 0 }">

							<h4 >No acceptable plans, please try again.</h4>

						</c:if>

						<c:forEach var='item' items='${items}' varStatus="status">
							<c:choose>
								<c:when test="${status.last}">
									<div class="wrapper">
								</c:when>

								<c:otherwise>
									<div class="wrapper under">
								</c:otherwise>
							</c:choose>

				   <table>
					<tr>
					<td>
					<article style="width:267px">
						<figure class="left marg_right1">
								<img src="images/plan.jpg" alt="">
							</figure>
							<p class="pad_bot2">
								<strong>Italy<br>Holidays
								</strong>
							</p>
							<p class="pad_bot2">${item.name}</p>
                       <!-- 
                       <a href="#" class="marker_1"
								onclick="displayPlan('${item.id}','${item.id}_Detail')"></a>
                        -->
						  <div id='${item.id}_Rating'></div>	
						 <div><label>Estimated Time:</label><br/>${item.displayDuration}</div>
						<script>
						//alert('${item.rating}');
						$("#${item.id}_Rating").attr("data-average", "${item.rating}");
						$("#${item.id}_Rating").jRating({
							isDisabled : true,
							rateMax : 5
						});
						
						</script>
						
					</article>
					</td>
					<td>
						<article style="width:604px" id='${item.id}_Detail'>
						
					</article>
					</td>
					</tr>
					</table>
					
					     <input type="hidden" id='${item.id}' value='${item.json}'>
					     
					     <script>
					         displayPlan('${item.id}','${item.id}_Detail');
					     </script>
					     
					</div>

				</c:forEach>
		</div>
		</article>
		
           <c:if test="${items_size != 0 }">

		   <article style="{width:100%}">
           <span>&nbsp;&nbsp; More Plans...</span><a href="#" class="marker_1" onclick=""></a>
           </article>

		   </c:if>
           
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
</body>
</html>