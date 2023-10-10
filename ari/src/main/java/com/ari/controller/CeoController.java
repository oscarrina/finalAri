package com.ari.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
		int totalCnt=service.reserTotalCnt(null);
		int listSize=5;
		int pageSize=5;
		LocalDate now = LocalDate.now();
		String userId = (String)session.getAttribute("sid");
		
		if(userId == null || userId.equals("")) {
			mav.setViewName("member/memberLogin");
			return mav;
		}else {
			List<ReserDTO> list = service.reserSelect(cp, listSize,userId);
			String url = "/reserManager";
			String pageStr = com.ari.page.PageModuleNotice.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
			if(list == null) {pageStr = "";}
			mav.addObject("pageStr", pageStr);
			mav.addObject("list", list);
			mav.addObject("now", now);
			mav.setViewName("ceo/reserManager");
		}
		return mav;
	}
	@GetMapping("/reserCancel")
	@ResponseBody
	public String reserCancel(@RequestParam("param")int reserIdx) {
		int result = service.reserCancel(reserIdx);
		String rtn = "";
		if(result == 1) {
			rtn = "성공";
		}else{
			rtn = "실패";
		}
		return rtn;
	}

}
