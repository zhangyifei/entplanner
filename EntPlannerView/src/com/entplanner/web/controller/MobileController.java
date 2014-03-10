package com.entplanner.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Constants;
import com.entity.Input;
import com.entity.Preference;
import com.entplanner.entity.Plan;
import com.entplanner.entity.PlanComparatorDefault;
import com.google.gson.Gson;
import com.utils.CusHttpClient;

@Controller
public class MobileController {
	@RequestMapping("mobile/index.csp")
	public ModelAndView handleIndex(HttpServletRequest request,
			HttpServletResponse response)

	throws ServletException, IOException {

		
		ModelAndView modelAndView = null;
         System.out.println("mobile index");
		modelAndView = new ModelAndView("mobile/index");

		return modelAndView;

	}
	
	
	@RequestMapping("mobile/processDisplay.csp")
	public ModelAndView newHandleProcess(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("form_1") Input input)

	throws ServletException, IOException {

		System.out.println(input.getStationLocation());
		System.out.println(input.getTime());
		String time = input.getTime();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy h:mm a",Locale.CANADA);
		Date date = null;
		Calendar calendar1 = Calendar.getInstance();
		Calendar calendar2 = Calendar.getInstance();

		try {
			date = dateFormat.parse(time);
			calendar2.setTime(date);
			calendar1.set(Calendar.HOUR_OF_DAY,
					calendar2.get(Calendar.HOUR_OF_DAY));
			calendar1.set(Calendar.MINUTE, calendar2.get(Calendar.MINUTE));

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		input.setTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
				.format(calendar1.getTime()));

		System.out.println(input.getTime());

		System.out.println(input.getMv());
		System.out.println(input.getDv());
		System.out.println(input.getSv());

		input.setUserPreference(getPreferenceFromString(input.getPreference()));
		// System.out.println(input);
		Gson gson = new Gson();
		String inputString = gson.toJson(input);
		
		System.out.println(inputString);

		// System.out.println(CusHttpClient.getResult(input));
	
		String result = CusHttpClient.getResult(input);


		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<Plan>>() {
		}.getType();
		
		List<Plan> plans = gson.fromJson(result, type);
		
		Collections.sort(plans, new PlanComparatorDefault());
		
		for (int i=0;i<plans.size();i++) {
			
			String json = gson.toJson(plans.get(i));
			plans.get(i).setJson(json);
			plans.get(i).setRating(String.valueOf(5-0.3*i));
			plans.get(i).setDisplayDuration(convertDisplayDuration(plans.get(i).getDuration()));
			
		}
		
		System.out.println(plans.size());
		
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("mobile/displayPlans");
		
		modelAndView.addObject("items", plans);
		
		modelAndView.addObject("items_size", plans.size());
		

		return modelAndView;

	}
	
	
	@RequestMapping("mobile/planDetail.csp")
	public ModelAndView handlePlanDetail(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("plan") String plan,@ModelAttribute("planName") String planName)

	throws ServletException, IOException {

		
		System.out.println("plan   "+plan);
		System.out.println("plan name   "+planName);

		Gson gson = new Gson();

		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<Plan>() {
		}.getType();
		
		Plan planObj = gson.fromJson(plan, type);
		
		System.out.println(planObj.getTravelMode());
		
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("mobile/planDetail");

		modelAndView.addObject("plan", planObj);
		modelAndView.addObject("items", plan);
		modelAndView.addObject("itemsLabel", planName);
		
		return modelAndView;

	}
	
	
	@RequestMapping("mobile/directionDetail.csp")
	public ModelAndView directionDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value="type", required=false)  String type,
			@RequestParam(value="id", required=false) String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("mobile/directionDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("mobile/restaurantDetail.csp")
	public ModelAndView restaurantDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value="type", required=false)  String type,
			@RequestParam(value="id", required=false) String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("mobile/restaurantDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("mobile/shoppingDetail.csp")
	public ModelAndView shoppingDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value="type", required=false)  String type,
			@RequestParam(value="id", required=false) String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("mobile/shoppingDetail");
		System.out.println(reString);
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("mobile/movieDetail.csp")
	public ModelAndView movieDetail(HttpServletRequest request,
			HttpServletResponse response, @RequestParam(value="type", required=false)  String type,
			@RequestParam(value="id", required=false) String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("mobile/movieDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	
	@RequestMapping(value = "mobile/getServiceDetail.csp", method = RequestMethod.POST)

	public ModelAndView getStations(HttpServletRequest request,HttpServletResponse response, @RequestParam(value = "type", required = true) String type,@RequestParam(value = "id", required = true) String id)

	throws ServletException, IOException {


		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		System.out.println(reString);
		response.setContentType("text/plain;charset=UTF-8"); 
		response.getWriter().write(reString);
		
		return null;
	}
	
	
	private Preference getPreferenceFromString(String p) {
		Preference preference = new Preference(false, false, false);
		if (Constants.CONNECT_FIRST.equals(p)) {
			preference = new Preference(false, false, true);
		} else if (Constants.COST_FIRST.equals(p)) {
			preference = new Preference(false, true, false);
		} else if (Constants.TIME_FIRST.equals(p)) {
			preference = new Preference(true, false, false);
		}
		return preference;
	}

	private String convertDisplayDuration(Integer m){
		Integer hour = m/60;
		Integer minute = m%60;
		StringBuffer stringBuffer = new StringBuffer();
		if (hour>0) {
			stringBuffer.append(hour).append(" ");
			if (hour > 1) {
				stringBuffer.append("hours ");
			}else {
				stringBuffer.append("hour ");
			}
			
		}
		
		if (minute > 0) {
			stringBuffer.append(minute).append(" ");
			if (minute > 1) {
				stringBuffer.append("minutes");
			}else {
				stringBuffer.append("minute");
			}
		}
		
		return stringBuffer.toString();
	}
}
