<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/planDetail.js"></script>

<title>PLAN DETAIL</title>
</head>
<body>
	<input type="hidden" value='${items}' id="contentDetail"></input>

	<h2 id="title"
		style="font-size: 30px; font-weight: 600; color: #3081c8; line-height: 50px; padding: 2px 0 33px 0">${itemsLabel}</h2>
	<div id="planDetail"></div>
</body>
</html>