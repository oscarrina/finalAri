package com.ari.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.cos.model.CosDTO;
import com.ari.cos.service.CosService;

@Controller
public class CosController {

	@Autowired
	private CosService service;
	
	@RequestMapping("/cosList")
	public ModelAndView cosList() {
		List<CosDTO> lists=null;
		
		try {
			lists=service.cosList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists", lists);
		mav.setViewName("cos/cosList");
		return mav;
	}
	
	@RequestMapping("/cosContent")
	public ModelAndView cosContent(@RequestParam("idx")int idx) {
		ModelAndView mav=new ModelAndView();
		CosDTO dto=null;
		try {
			dto=service.cosContent(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.addObject("dto",dto);
		mav.setViewName("cos/cosContent");
		return mav;
	}

}
