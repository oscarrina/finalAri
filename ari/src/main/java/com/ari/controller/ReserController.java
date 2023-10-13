package com.ari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.BerthDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.reser.service.ReserService;

@Controller
@RequestMapping("/")
public class ReserController {

	@Autowired
	private ReserService service;
	
	@GetMapping("reserForm")
	public ModelAndView reserForm(@RequestParam("idx") int idx,
			@RequestParam("berthIdx") int berthIdx,ReserDTO dto,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String userid = (String) session.getAttribute("sid");
		if(userid == null || userid.equals("")) {
			mav.addObject("msg", "로그인 후 이용바랍니다.");
			mav.addObject("url", "/memberLogin");
			mav.setViewName("msg");
			return mav;
		}
		dto.setReserVisitStart(startDate);
		dto.setReserVisitEnd(endDate);
		dto = service.reserForm(idx,berthIdx);
		mav.addObject("dto", dto);
		mav.addObject("userid", userid);
		mav.setViewName("reser/reserForm");
		return mav;
	}
}
