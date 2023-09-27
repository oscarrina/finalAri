package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class QnaController {

	@RequestMapping("/writeQForm")
	public ModelAndView writeQForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/writeQForm");
		return mav;
	}
	
	@RequestMapping("/writeQ")
	public ModelAndView writeQ() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("qna/writeQForm");
		return mav;
	}
}
