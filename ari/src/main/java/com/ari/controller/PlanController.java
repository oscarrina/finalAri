package com.ari.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.plan.service.PlanService;

@Controller
public class PlanController {
	@Autowired
	private PlanService service;
	
	@RequestMapping("/planDatePicker")
	public ModelAndView planDatePicker(@RequestParam(value = "area")int area, @RequestParam(value = "sigungu", defaultValue = "1")int sigungu) {
		ModelAndView mav =new ModelAndView();
		mav.addObject("area", area);
		mav.setViewName("/plan/planDatePicker");
		return mav;
	}
	@GetMapping("/planMap")
	public ModelAndView planMap(
			@RequestParam(value = "dateRange",required = false)int dateRange, 
			@RequestParam(value = "area")int area, 
			@RequestParam(value = "sigungu", defaultValue = "1")int sigungu,
			@RequestParam(value = "type", defaultValue = "1")int type) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		switch(type) {
		case 1: List<AttDTO> Attlist = service.getAttList(area, sigungu);mav.addObject("list", Attlist); break;
		case 2: List<FoodDTO> Foodlist = service.getFoodList(area, sigungu);mav.addObject("list", Foodlist); break;
		case 3: List<BerthInfoDTO> berthInfolist = service.getBerthInfoList(area, sigungu);mav.addObject("list", berthInfolist); break;
		}
		mav.addObject("dateRange",dateRange);
		mav.addObject("area", area);
		
		mav.setViewName("plan/planMap");
		return mav;
	}
	@PostMapping("/reloadSigungu")
	public ModelAndView reloadPlanMap(
			@RequestParam(value = "dateRange",required = false)int dateRange, 
			@RequestParam(value = "area")int area, 
			@RequestParam(value = "sigungu", defaultValue = "1")int sigungu,
			@RequestParam(value = "type", defaultValue = "1")int type) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		switch(type) {
		case 1: List<AttDTO> Attlist = service.getAttList(area, sigungu);mav.addObject("list", Attlist); break;
		case 2: List<FoodDTO> Foodlist = service.getFoodList(area, sigungu);mav.addObject("list", Foodlist); break;
		case 3: List<BerthInfoDTO> berthInfolist = service.getBerthInfoList(area, sigungu);mav.addObject("list", berthInfolist); break;
		}
		mav.addObject("dateRange",dateRange);
		mav.addObject("area", area);
		
		mav.setViewName("plan/planMap");
		return mav;
	}
	
}
