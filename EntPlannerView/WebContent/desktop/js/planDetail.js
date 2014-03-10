var plan = null;
var itemValue = null;
var itemList = null;
var directionSeq = null;
	$(document).ready(function() {

		plan = JSON.parse(document.getElementById("contentDetail").value);
		//alert("callBack3");
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
		//alert("callBack1");
		var service = new google.maps.DistanceMatrixService();
		//alert("callBack2");
		service.getDistanceMatrix({
			origins : origins,
			destinations : destinations,
			travelMode : travelMode,
			unitSystem : google.maps.UnitSystem.METRIC,
			avoidHighways : false,
			avoidTolls : false
		}, Detailcallback);
	});
	
	
	function Detailcallback(response, status) {
		if (status != google.maps.DistanceMatrixStatus.OK) {
			alert('Error was: ' + status);
		} else {
           // alert("callBack");
			for ( var i = 0; i < directionSeq.length; i++) {
				var index = directionSeq[i];
				var item = itemList[index];
	            //alert(response.rows[i].elements[i].duration.value);
				item.duration = Math.ceil((response.rows[i].elements[i].duration.value) / 60);

			}
			createContent();
		}

	}

	
	function createContent(){
		
		var main = $("#planDetail");
		itemValue = new Array(itemList.length);
		// /////////////////////////////////////////////

		var index = 0;
		for ( var i = 0; i < itemList.length; i++) {
			
			var item = $("<div></div>");
			
			if(i== itemList.length-1){
				item.addClass("wrapper");
			}else{
				item.addClass("wrapper under");
			}
			
			var itemFigure = $("<figure></figure>",{class:"left marg_right1"});
			
			var imgUrl = itemList[index].url;
			
			if(itemList[index].serviceType =="direction"){
				imgUrl = "images/direction.png";
			}
			
			if(imgUrl == null||imgUrl == undefined){
				imgUrl = "images/business_medium_square.png";
			}
			
			var figImg = $("<img></img>",{src:imgUrl});
			itemFigure.append(figImg);
			
			var p1 = $("<p></p>",{class:"pad_bot2"});
			var s1 = $("<strong>No. " + (i + 1)+"</strong>");
			p1.append(s1);
			
			var p2 = $("<p><strong>Activity Type:</strong>"+itemList[index].serviceType+"</p>",{class:"pad_bot2"});
			
			var p3=null;
			if(itemList[index].duration >1){
				p3 = $("<p><strong>Duration:</strong>"+itemList[index].duration+"mins</p>",{class:"pad_bot2"});
			}else{
				p3 = $("<p><strong>Duration:</strong>"+itemList[index].duration+"min</p>",{class:"pad_bot2"});
			}
			
			var p4 = $("<p><strong>Cost:</strong>"+itemList[index].cost+"</p>",{class:"pad_bot2"});

	
			var p5 = $("<p><a href='#' class='marker_2' onclick='seeDetail("+index+")'></a></p>");
			
			item.append(itemFigure);
			item.append(p1);
			item.append(p2);
			item.append(p3);
			item.append(p4);
			item.append(p5);
			
			main.append(item);
			
			var itemString = JSON.stringify(itemList[index]);
			itemValue[index] = itemString;

			index = index + 1;
		}

		
		
		
	}

	function seeDetail(index) {
		//alert(index);


		// alert(itemValue[src.id]);
		var item = itemValue[index];

		
		var activity = JSON.parse(item);

		switch (activity.serviceType) {

		case "direction":
			postSubmit("directionDetail.csp", activity);
			break;
		case "movie":
			postSubmit("movieDetail.csp", activity);
			break;
		case "restaurant":
			postSubmit("restaurantDetail.csp", activity);
			break;
		case "shopping":
			postSubmit("shoppingDetail.csp", activity);
			break;

		}

	}

	function postSubmit(url, activity) {

		//alert(url);
		//alert(activity);
		
		var myform = document.createElement("form");
		var method = "POST";

		myform.setAttribute("method", method);
		myform.setAttribute("action", url);

		var input1 = document.createElement('input');
		input1.type = 'hidden';
		input1.name = "type";
		input1.value = activity.serviceType;
		
		var input2 = document.createElement('input');
		input2.type = 'hidden';
		input2.name = "id";
		input2.value = activity.serviceId;
		
		myform.appendChild(input1);
		myform.appendChild(input2);
		
		document.body.appendChild(myform);
		myform.submit();
		document.body.removeChild(myform);
	}