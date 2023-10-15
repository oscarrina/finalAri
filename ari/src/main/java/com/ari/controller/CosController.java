package com.ari.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.cos.model.CosDTO;
import com.ari.cos.service.CosService;
import com.ari.like.model.LikeDTO;
import com.ari.like.service.LikeService;

@Controller
public class CosController {

	@Autowired
	private CosService service;
	@Autowired
	private LikeService likeService;
	
	@RequestMapping("/cosList")
	public ModelAndView cosList(@RequestParam(value = "cosArea", defaultValue = "0")int cosArea,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		List<CosDTO> lists=null;
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=0;
		int listSize=6;
		int pageSize=5;
		
		try {
			if(cosArea == 0) {
				totalCnt=service.totalCnt();
				lists=service.cosList(cp,listSize);
			}else {
				totalCnt=service.totalCntArea(cosArea);
				lists=service.cosListArea(cosArea,cp,listSize);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="/cosList?cosArea="+cosArea;
		String pageStr=com.ari.page.PageModuleNotice
				.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
		//if(totalCnt==0) {pageStr="";}
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("cosArea", cosArea);
		mav.setViewName("cos/cosList");
		return mav;
	}
	
	@RequestMapping("/cosContent")
	public ModelAndView cosContent(@RequestParam("idx")int idx,
			LikeDTO likeDto, HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		CosDTO dto=null;
		try {
			dto=service.cosContent(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("sid");
		if(userId == null || userId.equals("")) {
			userId = "";
		}
		likeDto.setUserId(userId);
		likeDto.setIdx(idx);
		likeDto.setLikeType(1);
		String likeYN = likeService.likeSelect(likeDto);
		if (likeYN == null || likeYN.equals("N")) {
			mav.addObject("likeYN", "N");
			mav.addObject("userId", userId);
			mav.addObject("likeType", 1);
		} else if (likeYN.equals("Y")) {
			mav.addObject("likeYN", "Y");
			mav.addObject("userId", userId);
			mav.addObject("likeType", 1);
		}
		mav.addObject("dto",dto);
		mav.setViewName("cos/cosContent");
		return mav;
	}
	
	@RequestMapping("/getarea")
	public String getAreacode() {
		return "festival/getAreacodeXML";
	}

}
