package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MypageController {

	@GetMapping("/myPage")
	public String myPage() {
		return "mypage/myPlan";
	}
	
	@GetMapping("/myReser")
	public String myReser() {
		return "mypage/myReser";
	}
	
	@GetMapping("/myReview")
	public String myReview() {
		return "mypage/myReview";
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
