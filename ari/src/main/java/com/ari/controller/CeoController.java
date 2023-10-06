package com.ari.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.member.model.MemberDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.reser.service.ReserService;

@Controller
public class CeoController {
	
	@Autowired
	private ReserService service;
	
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
	
	@GetMapping("/reserManager")
	public ModelAndView reserManager(@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int totalCnt=service.reserTotalCnt();
		int listSize=5;
		int pageSize=5;
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid").equals("")) {
			mav.setViewName("member/memberLogin");
			return mav;
		}else {
			List<ReserDTO> list = service.reserSelect(cp, listSize);
			String url = "/reserManager";
			String pageStr = com.ari.page.PageModuleNotice.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
			if(list == null) {pageStr = "";}
			mav.addObject("pageStr", pageStr);
			mav.addObject("list", list);
			mav.setViewName("ceo/reserManager");
		}
		return mav;
	}
	@GetMapping("/reserCancel")
	public ModelAndView reserCancel(@RequestParam("param")int param) {
		
	}

}
