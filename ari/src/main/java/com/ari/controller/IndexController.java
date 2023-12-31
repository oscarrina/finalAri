package com.ari.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ari.banner.model.BannerDTO;
import com.ari.banner.service.BannerService;

@Controller
public class IndexController {
	
	@Autowired
	private BannerService service;

	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView mav=new ModelAndView();
		List<BannerDTO> lists=null;
		try {
			lists=service.bannerList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("lists", lists);
		mav.setViewName("index");
		return mav;
	}
}
