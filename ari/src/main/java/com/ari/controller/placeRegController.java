package com.ari.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.place.service.PlaceService;

import io.netty.handler.codec.http.HttpRequest;

@Controller
public class placeRegController {
	@Autowired
	private PlaceService service;
	
	@RequestMapping("/placeRegForm")
	public ModelAndView placeRegForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(session.getAttribute("suserArea")==null || session.getAttribute("suserArea").equals("")) {
			mav.setViewName("member/memberLogin");
			return mav;
		}
		String userId = (String)session.getAttribute("sid");
		mav.addObject("userId",userId);
		mav.setViewName("place/placeReg");
		return mav;
	}

	@RequestMapping("/getCategroyForm")
	public ModelAndView getCategroyForm(@RequestParam(value = "divId", required=false)String id) throws IOException  {
		ModelAndView mav = new ModelAndView();
		switch (id) { 
			case "1": mav.setViewName("place/attForm"); break;
			case "2": mav.setViewName("place/foodForm");break;
			case "3": mav.setViewName("place/berthForm"); break;
		}
		return mav;
	}
   
	@PostMapping("attReg")
	public ModelAndView arrReg(AttDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.attInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
	@PostMapping("foodReg")
	public ModelAndView arrReg(FoodDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.foodInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
	@PostMapping("berthInfoReg")
	public ModelAndView arrReg(BerthInfoDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.berthInfoInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
}
