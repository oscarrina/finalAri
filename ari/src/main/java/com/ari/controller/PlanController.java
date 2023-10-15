package com.ari.controller;

import java.sql.Date;
import java.util.Iterator;
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
import com.ari.plan.model.PlannerTableDTO;
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
			@RequestParam(value = "type")List<String> types,
			@RequestParam(value = "planDayInput")List<String> planDayInputs,
			@RequestParam(value = "idx")List<String> idxs,
			@RequestParam(value = "area")int area,
			@RequestParam(value = "dateRange")int dateRange,
			@RequestParam(value = "start")String start,
			@RequestParam(value = "end")String end,
			HttpSession session,
			PlanTableDTO dto,
			PlannerTableDTO pdto
			) {
		ModelAndView mav = new ModelAndView();
		int j=0;
		String userID = (String)session.getAttribute("sid");
		dto.setUserID(userID);
		dto.setPlanPoint(area);
		dto.setPlanStart(start);
		dto.setPlanEnd(end);
		dto.setPlanBigImg(area+".jpg");
		
		service.planInsert(dto);
		int lastPlnaDay = Integer.parseInt(planDayInputs.get(planDayInputs.size()-1));
		System.out.println(lastPlnaDay);
		
		Iterator<String> iterator = planDayInputs.iterator();
		for (int i = 0; i < lastPlnaDay+1; i++) {
		    int x = 0;
		    while (iterator.hasNext()) {
		        String element = iterator.next();
		        if (element.equals(Integer.toString(i))) {
		            dto = service.planList(dto);
		            pdto.setPlannerDay(i);
		            pdto.setPlannerGroup(dto.getPlanGroup());
		            pdto.setUserID(userID);
		            pdto.setPlannerImg(infoImgs.get(j));
		            pdto.setIdx(Integer.parseInt(idxs.get(j)));
		            pdto.setPlannerName(infoNameInputs.get(j));
		            pdto.setPlannerType(Integer.parseInt(types.get(j)));
		            pdto.setPlannerStep(x);
		            service.plannerInsert(pdto);
		            j++;
		            x++;
		        }
		    }
		    iterator = planDayInputs.iterator();
		}
		mav.addObject("msg", "일정을 만들었습니다!");
		mav.addObject("url", "/myPage");
		mav.setViewName("/msg");
		return mav;
	}
	@PostMapping("/planDel")
	public ModelAndView planDel(@RequestParam("planGroup")int planGroup) {
		ModelAndView mav = new ModelAndView();
		int planResult = service.planDelete(planGroup);
		int plannerResult = service.plannerDelete(planGroup);
		if(planResult == 1 && plannerResult > 0) {
			mav.addObject("msg", "성공");
		}else {
			mav.addObject("msg", "실패");
		}
		mav.setViewName("member/idCheck_ok");
		return mav;
	}
}
