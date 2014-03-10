package com.entplanner.web.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.entity.Constants;
import com.entity.DisplayItem;
import com.entity.Input;
import com.entity.Preference;
import com.entity.ReplanningInput;
import com.entplanner.entity.Plan;
import com.entplanner.entity.PlanComparatorDefault;
import com.google.gson.Gson;
import com.utils.CusHttpClient;
import com.utils.MiscUtil;

@Controller
public class DesktopController {
	
	
	@RequestMapping("desktop/index.csp")
	public ModelAndView handleIndex(HttpServletRequest request,
			HttpServletResponse response)

	throws ServletException, IOException {

		
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("desktop/index");

		return modelAndView;

	}
	
	@RequestMapping("desktop/process.csp")
	public ModelAndView handleProcess(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("form_1") Input input)

	throws ServletException, IOException {

		System.out.println(input.getStationLocation());
		String time = input.getTime();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
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
		List<DisplayItem> items = new ArrayList<DisplayItem>();
		String result = CusHttpClient.getResult(input);

		java.lang.reflect.Type type = new com.google.gson.reflect.TypeToken<List<Object>>() {
		}.getType();
		List<Object> list = gson.fromJson(result, type);
		int count = 1;
		for (Object object : list) {

			String jsonString = gson.toJson(object);
			String label = "$$ plan " + count;
			String id = "plan_" + count;
			DisplayItem displayItem = new DisplayItem();
			displayItem.setId(id);
			displayItem.setJson(jsonString);
			displayItem.setLabel(label);
			items.add(displayItem);
			count++;
		}
		
		
		
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("desktop/display");
		
		modelAndView.addObject("items", items);
		modelAndView.addObject("items_size", items.size());
		

		return modelAndView;

	}

	
	
	@RequestMapping("desktop/processDisplay.csp")
	public ModelAndView newHandleProcess(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("form_1") Input input)

	throws ServletException, IOException {

		System.out.println(input.getStationLocation());
		String time = input.getTime();
		DateFormat dateFormat = new SimpleDateFormat("MM/dd/yyyy HH:mm");
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
		/* replanning module*/
		HttpSession session = request.getSession();
		
		ReplanningInput replanningInput = new ReplanningInput();
		replanningInput.setId(session.getId());
		replanningInput.setInput(input);
		replanningInput.setActivities(MiscUtil.fromActsToList(plans));
		
		session.setAttribute(replanningInput.getId(), replanningInput);
		
		System.out.println("first  "+replanningInput.getId());
		/*----------------------*/
	
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("desktop/displayPlans");
		
		modelAndView.addObject("items", plans);
		
		modelAndView.addObject("items_size", plans.size());
		

		return modelAndView;

	}
	
	/* replanning module*/
	@RequestMapping("desktop/reProcessDisplay.csp")
	public ModelAndView reHandleProcess(HttpServletRequest request,
			HttpServletResponse response)

	throws ServletException, IOException {

	
		
		HttpSession session = request.getSession();
		
	    System.out.println("second  "+session.getId());
		
	    ReplanningInput replanningInput = (ReplanningInput) session.getAttribute(session.getId());
	    System.out.println(replanningInput.getActivities().size());
	    System.out.println(replanningInput.getInput().toString());
	    
		ModelAndView modelAndView = null;

		modelAndView = new ModelAndView("desktop/index");
		

		return modelAndView;

	}
	
	
	@RequestMapping("desktop/planDetail.csp")
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

		modelAndView = new ModelAndView("desktop/planDetail");

		modelAndView.addObject("plan", planObj);
		modelAndView.addObject("items", plan);
		modelAndView.addObject("itemsLabel", planName);
		
		return modelAndView;

	}
	
	
	@RequestMapping("desktop/directionDetail.csp")
	public ModelAndView directionDetail(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("type") String type,
			@ModelAttribute("id") String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("desktop/directionDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("desktop/restaurantDetail.csp")
	public ModelAndView restaurantDetail(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("type") String type,
			@ModelAttribute("id") String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("desktop/restaurantDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("desktop/shoppingDetail.csp")
	public ModelAndView shoppingDetail(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("type") String type,
			@ModelAttribute("id") String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("desktop/shoppingDetail");
		System.out.println(reString);
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	@RequestMapping("desktop/movieDetail.csp")
	public ModelAndView movieDetail(HttpServletRequest request,
			HttpServletResponse response, @ModelAttribute("type") String type,
			@ModelAttribute("id") String id)

	throws ServletException, IOException {

		System.out.println(type + "," + id);
		String reString = CusHttpClient.httpGetDetail(type, id);
		ModelAndView modelAndView = new ModelAndView("desktop/movieDetail");
		modelAndView.addObject("item", reString);

		return modelAndView;

	}
	
	
	@RequestMapping(value = "/getServiceDetail.csp", method = RequestMethod.POST)

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
