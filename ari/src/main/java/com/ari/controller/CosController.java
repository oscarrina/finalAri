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
		System.out.println(totalCnt);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("cosArea", cosArea);
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
	
	@RequestMapping("/getarea")
	public String getAreacode() {
		return "festival/getAreacodeXML";
	}

}
