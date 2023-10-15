package com.ari.controller;

import java.sql.Date;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.like.model.LikeDTO;
import com.ari.mypage.service.MypageService;
import com.ari.reser.model.ReserDTO;

@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	@GetMapping("/myPage")
	public String myPage(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
				if(userId == null || userId.equals("")) {
					return "member/memberLogin";
				}
		return "mypage/myPlan";
	}
	
	@GetMapping("/myReser")
	public ModelAndView myReser(@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> param = new HashMap<String, String>();
		int listSize=5;
		int pageSize=5;
		
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
		
		param.put("listSize", String.valueOf(listSize));
		param.put("cp", String.valueOf(cp));
		param.put("userId", userId);
		
		Map<String, Object> list = service.myReser(param);
		String url = "/myReser";
		String pageStr = com.ari.page.PageModule.makePage(url, (int)list.get("totalCnt"), listSize, pageSize, cp);
		mav.addObject("list", list.get("list"));
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mypage/myReser");
		return mav;
	}
	
	@GetMapping("/myReviewWrite")
	public ModelAndView myReviewWrite(@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> param = new HashMap<String, Object>();
		int listSize=5;
		int pageSize=5;
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
		LocalDate now_l = LocalDate.now();
		Date now = java.sql.Date.valueOf(now_l);
		
		param.put("listSize", String.valueOf(listSize));
		param.put("cp", String.valueOf(cp));
		param.put("userId", userId);
		
		Map<String, Object> list = service.reserReview(param);
		String url = "/myReviewWrite";
		String pageStr = com.ari.page.PageModule.makePage(url, (int)list.get("totalCnt"), listSize, pageSize, cp);
		mav.addObject("list", list.get("list"));
		mav.addObject("pageStr", pageStr);
		mav.addObject("now", now);
		mav.setViewName("mypage/myReviewWrite");
		return mav;
	}
	
	@GetMapping("/myReview")
	public ModelAndView myReview(@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpServletRequest req){
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> param = new HashMap<String, String>();
		int listSize=5;
		int pageSize=5;
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
		
		param.put("listSize", String.valueOf(listSize));
		param.put("cp", String.valueOf(cp));
		param.put("userId", userId);
		
		Map<String, Object> list = service.myPageReview(param);
		String url = "/myReview";
		String pageStr = com.ari.page.PageModule.makePage(url, (int)list.get("totalCnt"), listSize, pageSize, cp);
		mav.addObject("list", list.get("list"));
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mypage/myReview");
		return mav;
	}
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "mypage/myInfo";
	}
	
	@GetMapping("/myLike")
	public ModelAndView myLike(@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpServletRequest req,LikeDTO dto) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> param = new HashMap<String, String>();
		int listSize=6;
		int pageSize=5;
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
		
		param.put("listSize", String.valueOf(listSize));
		param.put("cp", String.valueOf(cp));
		param.put("userId", userId);
		
		Map<String, Object> list = service.myPageLike(param);
		String url = "/myLike";
		String pageStr = com.ari.page.PageModule.makePage(url, (int)list.get("totalCnt"), listSize, pageSize, cp);
		mav.addObject("list", list.get("list"));
		mav.addObject("pageStr", pageStr);
		mav.setViewName("mypage/myLike");
		return mav;
	}
	
	@GetMapping("/myLikeLink")
	public String myLikeLink(@RequestParam("idx")int idx,@RequestParam("likeType")int type) {
		String url = "";
		if(type == 1) {
			url = "redirect:cosContent?idx="+idx;
		}else {
			url = "redirect:shareDetail?idx="+idx;
		}
		return url;
		
	}
	
	@RequestMapping("/reviewContent")
	public ModelAndView reviewContent() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("mypage/reviewContent");
		return mav;
	}
}
