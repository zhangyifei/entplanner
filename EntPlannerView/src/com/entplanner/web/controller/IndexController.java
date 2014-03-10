package com.entplanner.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {

	@RequestMapping("/index.csp")
	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response)

	throws ServletException, IOException {
		String Agent = request.getHeader("User-Agent");
	
		ModelAndView modelAndView=null;
		
		if (Agent.indexOf("Windows")>=0) {
			response.sendRedirect("desktop/index.csp");
        }else {
        	response.sendRedirect("mobile/index.csp");

		}
		
		
		
		return modelAndView;
		
	}

}
