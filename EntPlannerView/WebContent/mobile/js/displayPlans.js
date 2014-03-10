
function displayPlan(index, did) {

	// alert(index+","+did);
	var plan = JSON.parse($("#" + index).val());
	// alert(plan.id);
	// alert(plan.name);

	var itemValue = null;
	var itemList = null;
	var directionSeq = null;

	// alert(plan.movieService.theater);
	// alert(plan.movieService.movieName);
	// alert(plan.movieService.startTimePoint);
	// alert("callBack3");
	itemList = plan.activityList;
	directionSeq = new Array();
	var count = 0;
	for ( var i = 0; i < itemList.length; i++) {
		if (itemList[i].serviceType == "direction") {
			directionSeq[count] = i;
			count++;
		}
	}

	var travelMode = plan.travelMode;
	var origins = new Array();
	var destinations = new Array();
	for ( var i = 0; i < directionSeq.length; i++) {
		origins[i] = itemList[directionSeq[i]].startLocation;
		destinations[i] = itemList[directionSeq[i]].destination;
	}
	// alert("callBack1");
	var service = new google.maps.DistanceMatrixService();
	// alert("callBack2");
	service
			.getDistanceMatrix(
					{
						origins : origins,
						destinations : destinations,
						travelMode : travelMode,
						unitSystem : google.maps.UnitSystem.METRIC,
						avoidHighways : false,
						avoidTolls : false
					},
					function(response, status) {
						if (status != google.maps.DistanceMatrixStatus.OK) {
							alert('Error was: ' + status);
						} else {
							// alert("callBack");
							for ( var i = 0; i < directionSeq.length; i++) {
								var index = directionSeq[i];
								var item = itemList[index];
								// alert(response.rows[i].elements[i].duration.value);
								item.duration = Math
										.ceil((response.rows[i].elements[i].duration.value) / 60);

							}

							// /////////////////////////////create content
							var main = $("#" + did);
							itemValue = new Array(itemList.length);
							// /////////////////////////////////////////////
							// var table =$("<table></table>");
							// var sb = new StringBuffer();
							var index = 0;
							for ( var i = 0; i < itemList.length; i++) {

								// var tr = $("<tr></tr>",{class:"pad_bot2"});

								// var td1 = $("<td></td>");
								// var td2 = $("<td></td>");

								var item = $("<li></li>");

								// var item =
								// $("<li></li>",{class:"ui-first-child"});
								// item.addClass("ui-last-child");

								var p1 = $("<a href='#' alt='See Detail' title='See Detail' onclick='seeDetail(\""
										+ itemList[index].serviceType
										+ "\","
										+ itemList[index].serviceId + ")'></a>");
								var s1 = null;

								if (itemList[index].serviceType == "direction") {

									s1 = $("<strong>" + plan.travelMode + ":"
											+ itemList[index].duration
											+ "minutes</strong>");
								}

								if (itemList[index].serviceType == "restaurant") {

									s1 = $("<strong>"
											+ itemList[index].serviceType + ":"
											+ plan.restaurantService.name
											+ "</strong>");
								}

								if (itemList[index].serviceType == "movie") {

									s1 = $("<strong>"
											+ itemList[index].serviceType + ":"
											+ plan.movieService.movieName + "("
											+ plan.movieService.theater + ","
											+ plan.movieService.startTimePoint
											+ ")</strong>");
								}

								if (itemList[index].serviceType == "shopping") {

									s1 = $("<strong>"
											+ itemList[index].serviceType + ":"
											+ plan.shoppingService.name
											+ "</strong>");
								}

								p1.append(s1);

								item.append(p1);

								main.append(item);

								var itemString = JSON
										.stringify(itemList[index]);
								itemValue[index] = itemString;

								index = index + 1;
							}

							// var content = sb.toString();

							// $("#"+did).html(content);

							$("#" + did).listview("refresh");

							// main.append(table);

						}
					});
}

function seeDetail(type, id) {
	// alert(index);

	// alert(type);

	switch (type) {

	case "direction":
		postSubmit("directionDetail.csp", type, id);
		break;
	case "movie":
		postSubmit("movieDetail.csp", type, id);
		break;
	case "restaurant":
		postSubmit("restaurantDetail.csp", type, id);
		break;
	case "shopping":
		postSubmit("shoppingDetail.csp", type, id);
		break;

	}

}

function postSubmit(url, type, id) {

	// alert(url);
	// alert(activity);
	openPostWindow(url, type, id);
//	var myform = document.createElement("form");
//	var method = "POST";
//
//	myform.setAttribute("method", method);
//	myform.setAttribute("action", url);
//
//	var input1 = document.createElement('input');
//	input1.type = 'hidden';
//	input1.name = "type";
//	input1.value = type;
//
//	var input2 = document.createElement('input');
//	input2.type = 'hidden';
//	input2.name = "id";
//	input2.value = id;
//
//	myform.appendChild(input1);
//	myform.appendChild(input2);
//
//	document.body.appendChild(myform);
//
//	myform.submit();
//	document.body.removeChild(myform);
}

function openPostWindow(url, type, id) {
//	var tempForm = document.createElement("form");
//	tempForm.id = "tempForm1";
//	tempForm.method = "get";
//	tempForm.action = url+"?id="+id+"&type="+type;
//	tempForm.target = type;
//	
//	
//	var hideInput1 = document.createElement("input");
//	hideInput1.type = "hidden";
//	hideInput1.id = "id"
//	hideInput1.value = id;
//
//	var hideInput2 = document.createElement("input");
//	hideInput2.type = "hidden";
//	hideInput2.id = "type"
//	hideInput2.value = type;
//
//	tempForm.appendChild(hideInput1);
//	tempForm.appendChild(hideInput2);
    
	alert(url+"?id="+id+"&type="+type);
//	
//	tempForm.addEventListener("submit", function() {
//		openWindow(type,url+"?id="+id+"&type="+type);
//	},false);
//	
//	document.body.appendChild(tempForm);
//	
//	var ev = document.createEvent('HTMLEvents');  
//    ev.initEvent('submit', false, true);  
//    tempForm.dispatchEvent(ev); 
//    
//    
//	tempForm.submit();
//	document.body.removeChild(tempForm);
	
	openWindow(type,url+"?id="+id+"&type="+type);
	
}


function openWindow(name,url) {
	window
			.open(
					url,
					name,
					'height=400, width=400, top=0, left=0, toolbar=yes, menubar=yes, scrollbars=yes, resizable=yes,location=yes, status=yes');
}
