package com.ari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CeoController {
	
	@RequestMapping("/ceo")
	public String ceo() {
		return "ceo/ceoIndex";
	}
	
	@RequestMapping("/ceoLogout")
	public ModelAndView ceoLogout(HttpSession session) {
		
		session.invalidate();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "로그아웃 되었습니다");
		mav.addObject("url","/");
		mav.setViewName("member/memberMsg");
		return mav;
	}

}
