package com.utils;

import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import com.entplanner.entity.Activity;
import com.entplanner.entity.Plan;

public class MiscUtil {

	public static List<Entry<String, Integer>> fromActsToList(List<Plan> plans) {
		
		List<Entry<String, Integer>> actList = new ArrayList<Entry<String, Integer>>();
		
		for (Plan plan : plans) {
			
			for (Activity activity : plan.getActivityList()) {
				
				Entry<String, Integer> entry = new AbstractMap.SimpleEntry<String, Integer>(activity.getServiceType(), activity.getServiceId());
			    
				actList.add(entry);
			
			}
			
		}
		
		
		return actList;
		
		
	}
}
