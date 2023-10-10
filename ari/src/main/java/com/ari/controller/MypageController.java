package com.ari.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
	
	@GetMapping("/myReview")
	public Map<String, Object> myReview(HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userId = (String)session.getAttribute("sid");
		HashMap<String, Object> rtn = new HashMap<>();
		return rtn;
	}
	
	@GetMapping("/myInfo")
	public String myInfo() {
		return "mypage/myInfo";
	}
	
	@GetMapping("/myLike")
	public String myLike() {
		return "mypage/myLike";
	}
	
	@GetMapping("/myShare")
	public String myShare() {
		return "mypage/myShare";
	}
	
}
