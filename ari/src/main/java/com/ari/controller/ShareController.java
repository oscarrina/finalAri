package com.ari.controller;

import java.util.HashMap;
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
	public ModelAndView shareDetail(@RequestParam("idx")int idx,@RequestParam("planIdx")int planIdx) {
		
		try {
			service.readNum(idx);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		List<ShareDTO> share=null;
		List<PlanTableDTO> plan=null;
		try {
			share=service.shareDetail(idx);
			plan=service.plan(planIdx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<Integer, String> areamap=new HashMap<Integer, String>();
	      areamap.put(1, "서울");
	      areamap.put(2, "인천");
	      areamap.put(3, "대전");
	      areamap.put(4, "대구");
	      areamap.put(5, "광주");
	      areamap.put(6, "부산");
	      areamap.put(7, "울산");
	      areamap.put(8, "세종특별자치시");
	      areamap.put(31, "경기도");
	      areamap.put(32, "강원특별자치도");
	      areamap.put(33, "충청북도");
	      areamap.put(34, "충청남도");
	      areamap.put(35, "경상북도");
	      areamap.put(36, "경상남도");
	      areamap.put(37, "전라북도");
	      areamap.put(38, "전라남도");
	      areamap.put(39, "제주도");
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("share",share);
		mav.addObject("plan",plan);
		mav.addObject("area",areamap);
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
		
		HashMap<Integer, String> areamap=new HashMap<Integer, String>();
	      areamap.put(1, "서울");
	      areamap.put(2, "인천");
	      areamap.put(3, "대전");
	      areamap.put(4, "대구");
	      areamap.put(5, "광주");
	      areamap.put(6, "부산");
	      areamap.put(7, "울산");
	      areamap.put(8, "세종특별자치시");
	      areamap.put(31, "경기도");
	      areamap.put(32, "강원특별자치도");
	      areamap.put(33, "충청북도");
	      areamap.put(34, "충청남도");
	      areamap.put(35, "경상북도");
	      areamap.put(36, "경상남도");
	      areamap.put(37, "전라북도");
	      areamap.put(38, "전라남도");
	      areamap.put(39, "제주도");
		mav.addObject("plan",plan);
		mav.addObject("area",areamap);
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
			mav.addObject("url","shareList");
			mav.setViewName("member/memberMsg");
		}else {
			mav.addObject("msg","일정 공유에 실패하였습니다. 나중에 다시 시도해주세요:(");
			mav.addObject("url","shareList");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	@RequestMapping("/adminShare")
	public ModelAndView adminShare() {
		List<ShareDTO> lists=null;
		try {
			lists=service.shareList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.setViewName("share/adminShare");
		return mav;
	}
	
	@RequestMapping("/shareDel")
	public ModelAndView shareDel(@RequestParam("idx") int idx) {
		
		int result=0;
		try {
			result=service.shareDel(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		
		if(result>0) {
			mav.addObject("msg","삭제가 완료되었습니다.");
		}else {
			mav.addObject("msg","삭제에 실패했습니다. 잠시후에 다시 시도해주세요.");
		}
		mav.addObject("url","adminShare");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/myShare")
	public ModelAndView myShare(HttpSession session) {
		String userId=(String) session.getAttribute("sid");
		List<ShareDTO> list=null;
		try {
			list=service.myShare(userId);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",list);
		mav.setViewName("mypage/myShare");
		return mav;
	}
	
	@RequestMapping("/myShareDel")
	public ModelAndView myShareDel(@RequestParam("idx") int idx) {
		int result=0;
		try {
			result=service.shareDel(idx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		
		if(result>0) {
			mav.addObject("msg","삭제가 완료되었습니다.");
		}else {
			mav.addObject("msg","삭제에 실패했습니다. 잠시후에 다시 시도해주세요.");
		}
		mav.addObject("url","myShare");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
}