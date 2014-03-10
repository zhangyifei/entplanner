	

function displayPlan(index,did) {
	
	//alert(index+","+did);
	var plan = JSON.parse($("#"+index).val());
	//alert(plan.id);
	//alert(plan.name);
	
	var itemValue = null;
	var itemList = null;
	var directionSeq = null;
	
		
		//alert(plan.movieService.theater);
		//alert(plan.movieService.movieName);
		//alert(plan.movieService.startTimePoint);
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
		}, function(response, status){
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
				
				///////////////////////////////create content
				var main = $("#"+did);
				itemValue = new Array(itemList.length);
				// /////////////////////////////////////////////
		        //var table =$("<table></table>");
				
				var index = 0;
				for ( var i = 0; i < itemList.length; i++) {
					
					//var tr = $("<tr></tr>",{class:"pad_bot2"});
					
					//var td1 = $("<td></td>");
					//var td2 = $("<td></td>");
					
					var item = $("<div></div>");
					
					
					
					var p1 = $("<p></p>",{class:"pad_bot2"});
					var s1 = null;
					
					if(itemList[index].serviceType == "direction"){
						
						s1 = $("<strong>"+plan.travelMode+":"+itemList[index].duration+"minutes</strong>");
					}
					

					if(itemList[index].serviceType == "restaurant"){
						
						s1 = $("<strong>"+itemList[index].serviceType+":"+plan.restaurantService.name+"</strong>");
					}
					
		            if(itemList[index].serviceType == "movie"){
						
						s1 = $("<strong>"+itemList[index].serviceType+":"+plan.movieService.movieName+"("+plan.movieService.theater+","+plan.movieService.startTimePoint+")</strong>");
					}
					
		            if(itemList[index].serviceType == "shopping"){
						
						s1 = $("<strong>"+itemList[index].serviceType+":"+plan.shoppingService.name+"</strong>");
					}
		            
					
//		            var a1 = $("<a href='#' alt='See Detail' title='See Detail'  onclick='seeDetail(\""+itemList[index].serviceType+"\","+itemList[index].serviceId+")'></a>");
//		            a1.append(s1);
		            
					p1.append(s1);
					
					//td1.append(s1);

			
					var s2 = $("<a href='#' alt='See Detail' title='See Detail' class='marker_2' onclick='seeDetail(\""+itemList[index].serviceType+"\","+itemList[index].serviceId+")'></a>");
					var s3 = $("<span>&nbsp</span>");
					
					p1.append(s3);
					p1.append(s2);
					
					//td2.append(s3);
					//td2.append(s2);
					
					item.append(p1);
					
					//tr.append(td1);
					//tr.append(td2);
					
					//table.append(tr);
					//item.append(p5);
					
					main.append(item);
					
					var itemString = JSON.stringify(itemList[index]);
					itemValue[index] = itemString;

					index = index + 1;
				}
				
				//main.append(table);

				
			}
		});
	}
	
	


	function seeDetail(type,id) {
		//alert(index);


	 //alert(type);

		switch (type) {

		case "direction":
			postSubmit("directionDetail.csp",type,id);
			break;
		case "movie":
			postSubmit("movieDetail.csp", type,id);
			break;
		case "restaurant":
			postSubmit("restaurantDetail.csp", type,id);
			break;
		case "shopping":
			postSubmit("shoppingDetail.csp", type,id);
			break;

		}

	}

	function postSubmit(url, type,id) {

		//alert(url);
		//alert(activity);
		
		var myform = document.createElement("form");
		var method = "POST";

		myform.setAttribute("method", method);
		myform.setAttribute("action", url);

		var input1 = document.createElement('input');
		input1.type = 'hidden';
		input1.name = "type";
		input1.value = type;
		
		var input2 = document.createElement('input');
		input2.type = 'hidden';
		input2.name = "id";
		input2.value = id;
		
		myform.appendChild(input1);
		myform.appendChild(input2);
		
		document.body.appendChild(myform);
		myform.submit();
		document.body.removeChild(myform);
	}