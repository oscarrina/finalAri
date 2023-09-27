package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memeberController {
	@RequestMapping("/memberJoinChoice")
	public String memberJoinChoice() {
		return "memberJoin/memberJoinChoice";
	}
	
	@RequestMapping("/memberJoin")
	public String memberJoin() {
		return "memberJoin/memberJoin";
	}

	@RequestMapping("/memberLogin")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	@RequestMapping("/idFind")
	public String idFind() {
		return "member/idFind";
	}
	
	@RequestMapping("/pwdFind1")
	public String pwdFind1() {
		return "member/pwdFind1";
	}
	
	@RequestMapping("/pwdFind2")
	public String pwdFind2() {
		return "member/pwdFind2";
	}
	
	@RequestMapping("/pwdFind3")
	public String pwdFind3() {
		return "member/pwdFind3";
	}
}
