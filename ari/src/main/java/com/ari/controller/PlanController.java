package com.ari.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.plan.model.PlanTableDTO;
import com.ari.plan.service.PlanService;

@Controller
public class PlanController {
	@Autowired
	private PlanService service;
	
	@RequestMapping("/planDatePicker")
	public ModelAndView planDatePicker(@RequestParam(value = "area")int area, 
			@RequestParam(value = "sigungu", defaultValue = "1")int sigungu,
			HttpSession session) {
		ModelAndView mav =new ModelAndView();
		if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
			mav.addObject("msg", "로그인이 필요한 서비스입니다..");
			mav.addObject("url", "/memberLogin");
			mav.setViewName("member/memberMsg");
			return mav;
		}
		mav.addObject("area", area);
		mav.setViewName("/plan/planDatePicker");
		return mav;
	}
	@GetMapping("/planMap")
	public ModelAndView planMap(
			@RequestParam(value = "dateRange",required = false)int dateRange, 
			@RequestParam(value = "area")int area, 
			@RequestParam(value = "start")Date start, 
			@RequestParam(value = "end")Date end, 
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
		mav.addObject("start", start);
		mav.addObject("end", end);
		
		mav.setViewName("plan/planMap");
		return mav;
	}
	@GetMapping("reloadSigungu")
	public ModelAndView reloadPlanMap(
			@RequestParam(value = "dateRange",required = false)int dateRange, 
			@RequestParam(value = "area")int area, 
			@RequestParam(value = "sigungu", defaultValue = "1")int sigungu
			) throws Exception {
		ModelAndView mav = new ModelAndView();

		List<AttDTO> Attlist = service.getAttList(area, sigungu);
		
		mav.addObject("list", Attlist);
		
		mav.setViewName("plan/placeSelectList");
		return mav;
	}
	@GetMapping("listSet")
	public ModelAndView categoryType(@RequestParam(value = "dateRange",required = false)int dateRange, 
			@RequestParam(value = "area")int area,
			@RequestParam(value = "sigungu")int sigungu,
			@RequestParam(value = "type")String type) throws Exception {
		ModelAndView mav = new ModelAndView();
		switch(type) {
		case "att": List<AttDTO> Attlist = service.getAttList(area, sigungu);mav.addObject("list", Attlist); break;
		case "food": List<FoodDTO> Foodlist = service.getFoodList(area, sigungu);mav.addObject("list", Foodlist); break;
		case "berth": List<BerthInfoDTO> berthInfolist = service.getBerthInfoList(area, sigungu);mav.addObject("list", berthInfolist); break;
		}
		mav.setViewName("plan/placeSelectList");
		return mav;
	}
	@GetMapping("replaceMap")
	public ModelAndView replaceMap(
			@RequestParam(value = "addr")String addr) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("addr", addr);
		mav.setViewName("plan/mapDiv");
		return mav;
	}
	@PostMapping("createPlan")
	public ModelAndView createPlan(@RequestParam(value = "infoNameInput")List<String> infoNameInputs,
			@RequestParam(value = "infoImg")List<String> infoImgs,
			@RequestParam(value = "type")List<Integer> types,
			@RequestParam(value = "planDayInput")List<String> planDayInputs,
			@RequestParam(value = "area")int area,
			@RequestParam(value = "dateRange")int dateRange,
			@RequestParam(value = "start")String start,
			@RequestParam(value = "end")String end,
			HttpSession session,
			PlanTableDTO dto
			) {
		ModelAndView mav = new ModelAndView();
		String userID = (String)session.getAttribute("sid");
		dto.setUserID(userID);
		dto.setPlanPoint(area);
		dto.setPlanStart(start);
		dto.setPlanEnd(end);
		dto.setPlanBigImg(area+".jpg");
		
		int result = service.planInsert(dto);
		System.out.println(result);
		mav.setViewName("plan/placeSelectList");
		return mav;
		
		
	}
}
