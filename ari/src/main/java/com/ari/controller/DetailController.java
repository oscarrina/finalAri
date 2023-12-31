package com.ari.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.detail.model.searchVO;
import com.ari.festival.model.FestivalDTO;
import com.ari.review.model.ReviewDTO;
import com.ari.detail.service.*;

@Controller
public class DetailController {

	@Autowired
	private DetailService service;
	
	@RequestMapping("/searchResult")
	public ModelAndView search(@RequestParam("category")int category,@RequestParam("region")int area,
			@RequestParam(value="search",required=false)String search) {
		
		List<FoodDTO> food=null;
		List<BerthInfoDTO> berthInfo=null;
		List<AttDTO> att=null;
		List<FestivalDTO> fest=null;
				
		ModelAndView mav=new ModelAndView();
		searchVO params=new searchVO();
		
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
					params.setArea(area);
					params.setSearch(search);
					food=service.foodListIn(params);
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
					params.setArea(area);
					params.setSearch(search);
					berthInfo=service.berthInfoListIn(params);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			System.out.println();
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
					params.setArea(area);
					params.setSearch(search);
					att=service.attListIn(params);
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
					params.setArea(area);
					params.setSearch(search);
					fest=service.festivalListIn(params);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			
			mav.addObject("lists",fest);
			mav.setViewName("detail/festList");
			break;
		default:
			
			break;
		}
		return mav;
		}
	
	@RequestMapping("foodDetail")
	public ModelAndView fooddetail(@RequestParam("foodIdx") int idx) {
		List<FoodDTO> food = null;
		try {
			food = service.foodDetail(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("food",food);
		mav.setViewName("detail/foodDetail");
		return mav;
	}
	@RequestMapping("berthInfoDetail")
	public ModelAndView berthInfodetail(@RequestParam("berthInfoIdx") int idx,
			@RequestParam("startDate") String startDate,@RequestParam("endDate") String endDate,
			BerthDTO dto) throws ParseException {
		List<BerthInfoDTO> berthInfo =null;
		List<BerthDTO> berth=null;
		List<ReviewDTO> review=null;
		dto.setIdx(idx);
		dto.setStartDate(startDate);
		dto.setEndDate(endDate);
		double score = 0;
		
		try {
			berthInfo=service.berthInfoDetail(idx);
			berth=service.berthDetail(dto);
			review=service.reviewList(idx);
			
			for(int i=0;i<review.size();i++) {
				review.get(i).setReviewContent(review.get(i).getReviewContent().replaceAll("\n", "<br>"));
			}
			for(int i=0; i<berthInfo.size(); i++) {
				score = (Math.ceil(berthInfo.get(i).getReviewScore()*100)/100.0);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("berthInfo",berthInfo);
		mav.addObject("berth",berth);
		mav.addObject("dto", dto);
		mav.addObject("score", score);
		mav.addObject("startDate", startDate);
		mav.addObject("endDate", endDate);
		mav.addObject("review", review);
		mav.setViewName("detail/berthInfoDetail");
		System.out.println(review);
		return mav;
		
	}
	
	@RequestMapping("attDetail")
	public ModelAndView attdetail(@RequestParam("attIdx") int idx) {
		List<AttDTO> att =null;
		try {
			att=service.attDetail(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("att",att);
		mav.setViewName("detail/attDetail");
		return mav;
	}
	@RequestMapping("festDetail")
	public ModelAndView festdetail(@RequestParam("festIdx")int idx) {
		
		List<FestivalDTO> fest=null;
		
		try {
			fest=service.festDetail(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("",fest);
		mav.setViewName("detail/festDetail");
		return mav;
	}
	
	
}
