package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DetailController {

	@RequestMapping("/searchResult")
	public ModelAndView search(@RequestParam("category")String category,@RequestParam("region")int region) {
		
		switch (category) {
		case "음식점":
			
			break;
		case "숙박":
			
			break;
		case "관광명소":
			
			break;
		case "축제":
			
			break;
		default:
			
			break;
		}
		
		
		
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("detail/searchResult");
		return mav;
	}
	
	
}
