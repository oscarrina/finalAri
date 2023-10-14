package com.ari.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.like.model.LikeDTO;
import com.ari.like.service.LikeService;

@Controller
public class LikeController {

	@Autowired
	private LikeService service;

	@GetMapping("/cos")
	public String cos() {
		return "cos";
	}

	@GetMapping("/planShare")
	public String planShare() {
		return "planShare";
	}

	@GetMapping("/cosTest")
	public ModelAndView cosTest(LikeDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String userId = (String) session.getAttribute("sid");
		if (userId == null || userId.equals("")) {
			mav.setViewName("member/memberLogin");
			return mav;
		}
		dto.setUserId(userId);
		String likeYN = service.likeSelect(dto);
		if (likeYN == null || likeYN.equals("N")) {
			mav.addObject("likeYN", "N");
			mav.addObject("idx", 1);
			mav.addObject("likeType", 1);
		} else if (likeYN.equals("Y")) {
			mav.addObject("likeYN", "Y");
			mav.addObject("idx", 1);
			mav.addObject("likeType", 1);
		}
		mav.setViewName("cos1");

		return mav;
	}

	
}
