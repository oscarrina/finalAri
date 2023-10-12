package com.ari.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.plan.model.PlanTableDTO;
import com.ari.share.model.ShareDTO;
import com.ari.share.service.ShareService;

@Controller
public class ShareController {

	@Autowired
	private ShareService service;
	
	@RequestMapping("/shareList")
	public ModelAndView shareList() {
		
		List<ShareDTO> lists=null;
		try {
			lists=service.shareList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.setViewName("share/shareList");
		return mav;
	}
	
	@RequestMapping("/shareDetail")
	public ModelAndView shareDetail(@RequestParam("idx")int idx) {
		
		List<ShareDTO> list=null;
		try {
			list=service.shareDetail(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("list",list);
		mav.setViewName("share/shareDetail");
		return mav;
		
	}
	
	@RequestMapping("/planToShare")
	public ModelAndView planList(HttpSession session) {
		
		String userId=(String) session.getAttribute("sid");
		ModelAndView mav=new ModelAndView();

		if(userId==null) {
			mav.addObject("msg","로그인하신 후 일정을 공유하실 수 있습니다.");
			mav.addObject("url","memberLogin");
			mav.setViewName("member/memberMsg");
			return mav;
		}
		
		List<PlanTableDTO> plan=null;
		try {
			plan=service.planList(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("plan",plan);
		mav.setViewName("share/planToShare");
		
		return mav;
	}
	
	@RequestMapping("/shareForm")
	public ModelAndView share(@RequestParam("planIdx") int idx) {

		ModelAndView mav=new ModelAndView();
		mav.addObject("planIdx",idx);
		mav.setViewName("share/shareForm");
		return mav;
	}
	
	@RequestMapping("/share")
	public ModelAndView share(ShareDTO dto,@RequestParam("planIdx")int planIdx,HttpSession session) {
		String userId=(String) session.getAttribute("sid");
		dto.setPlanidx(planIdx);
		dto.setUserId(userId);
		ModelAndView mav=new ModelAndView();
		int result=0;
		try {
			result=service.share(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.addObject("msg","일정 공유가 완료되었습니다!");
			mav.addObject("url","share/shareList");
			mav.setViewName("member/memberMsg");
		}else {
			mav.addObject("msg","일정 공유에 실패하였습니다. 나중에 다시 시도해주세요:(");
			mav.addObject("url","share/shareList");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
}