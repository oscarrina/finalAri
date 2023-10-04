package com.ari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FestivalController {
	
	@RequestMapping("/fest")
	public ModelAndView fest(@RequestParam(value = "type", defaultValue = "2")int type,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
			mav.addObject("msg","비정상적인 접근입니다. 고객 센터에 문의해주세요.");
			mav.addObject("url", "admin");
			mav.setViewName("admin/adminMsg");
			return mav;
		}
		mav.addObject("type", type);
		mav.setViewName("festival/festivalList");
		return mav;
	}
	@GetMapping("/festAdd")
	public ModelAndView festAdd() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("festival/festivalAdd");
		return mav;
	}
	
	@RequestMapping("/getArea")
	public String getAreacode() {
		return "festival/getAreacodeXML";
	}
	

}
