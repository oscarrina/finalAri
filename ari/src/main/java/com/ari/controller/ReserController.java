package com.ari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.BerthDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.reser.model.TestDTO;
import com.ari.reser.service.ReserService;

@Controller
@RequestMapping("/")
public class ReserController {

	@Autowired
	private ReserService service;
	
	@GetMapping("reserForm")
	public ModelAndView reserForm(@RequestParam("berthIdx") int berthIdx,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			TestDTO dto) {
		ModelAndView mav = new ModelAndView();
		dto.setReserVisitStart(startDate);
		dto.setReserVisitEnd(endDate);
		System.out.println(dto.getReserVisitStart());
		dto = service.reserForm(berthIdx);
		System.out.println(dto.getBerthInfoName());
		mav.addObject("dto", dto);
		mav.setViewName("reser/reserForm");
		return mav;
	}
}
