package com.ari.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.place.service.PlaceService;

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
	public ModelAndView attReg(AttDTO dto,
			@RequestParam("infoImg")MultipartFile infoImg) {
		ModelAndView mav = new ModelAndView();
		copyInto(infoImg);
		dto.setInfoImg(infoImg.getOriginalFilename());
		int result = service.attInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
	@PostMapping("foodReg")
	public ModelAndView foodReg(FoodDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.foodInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
	@PostMapping("berthInfoReg")
	public ModelAndView berthInfoReg(BerthInfoDTO dto) {
		ModelAndView mav = new ModelAndView();
		int result = service.berthInfoInsert(dto);
		String msg = result==1?"등록성공":"등록실패";
		mav.addObject("msg",msg);
		mav.addObject("url","/placeRegForm");
		mav.setViewName("/msg");
		return mav;
	}
	@RequestMapping("placeList")
	public ModelAndView attSelect(HttpSession session,
			@RequestParam(value = "type", defaultValue = "1")int type){
		ModelAndView mav = new ModelAndView();
		String userId = (String)session.getAttribute("sid");
		switch(type) {
		case 1 : List<AttDTO> arr1 = service.attSelect(userId);mav.addObject("list", arr1);break;
		case 2 : List<FoodDTO> arr2 = service.foodSelect(userId);mav.addObject("list", arr2);break;
		case 3 : List<BerthInfoDTO> arr3 = service.berthInfoSelect(userId);mav.addObject("list", arr3);break;
		}
		mav.setViewName("place/myPlaceReg");
		return mav;
	}
	public void copyInto(MultipartFile infoImg) {
		File f=new File("c:/student_java/upload/"+infoImg.getOriginalFilename());
		
		try {
			byte[] bytes=infoImg.getBytes(); //원본을 byte 단위로 다 가져오는 것
			
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
