package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PlanController {
	@RequestMapping("/planDatePicker")
	public ModelAndView planDatePicker(@RequestParam(value = "area")int area) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("area", area);
		mav.setViewName("/plan/planDatePicker");
		return mav;
	}
	@RequestMapping("/planMap")
	public String planMap() {
		return "plan/planMap";
	}

}
