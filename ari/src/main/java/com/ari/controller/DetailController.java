package com.ari.controller;

import java.util.List;

import org.apache.ibatis.annotations.Case;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.festival.model.FestivalDTO;

import oracle.net.aso.i;

import com.ari.detail.service.*;

@Controller
public class DetailController {

	@Autowired
	private DetailService service;
	
	@RequestMapping("/searchResult")
	public ModelAndView search(@RequestParam("category")int category,@RequestParam("region")int area,
			@RequestParam("search")String search) {
		
		List<FoodDTO> food=null;
		List<BerthInfoDTO> berthInfo=null;
		List<AttDTO> att=null;
		List<FestivalDTO> fest=null;
		
		ModelAndView mav=new ModelAndView();

		switch (category) {
		case 1:
			if(area==0) {
				try {
					food=service.foodList(search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
					food=service.foodListIn(area, search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			mav.addObject("food",food);
			mav.setViewName("detail/foodList");
			
			break;
		case 2:
			if (area==0) {
				try {
					berthInfo=service.berthInfoList(search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}else {
				try {
					berthInfo=service.berthInfoListIn(area,search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			mav.addObject("berthInfo",berthInfo);
			mav.setViewName("detail/berthInfoList");
			
			break;
		case 3:
			if (area==0) {
				try {
					att=service.attList(search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
					att=service.attListIn(area, search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			mav.addObject("att",att);
			mav.setViewName("detail/attList");
			
			break;
		case 4:
			if(area==0) {
				try {
					fest=service.festivalList(search);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else {
				try {
				fest=service.festivalListIn(area, search);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			mav.addObject("fest",fest);
			mav.setViewName("detail/festList");
			
			break;
		default:
			
			break;
		}
		return mav;
		}
	
	
}
