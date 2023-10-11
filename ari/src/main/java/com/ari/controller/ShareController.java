package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ShareController {

	@RequestMapping("/shareList")
	public String shareList() {
		
		return "share/shareList";
	}
	
	@RequestMapping("/planToShare")
	public ModelAndView planList() {
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("share/planToShare");
		return mav;
	}
	
	@RequestMapping("/share")
	public ModelAndView share(@RequestParam("planIdx") int planIdx) {
		
		ModelAndView mav=new ModelAndView();

		mav.setViewName("share/share");
		return mav;
	}
}