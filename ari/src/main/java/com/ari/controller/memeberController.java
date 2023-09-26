package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class memeberController {
	@RequestMapping("/memberJoinChoice")
	public String memberJoinChoice() {
		return "memberJoin/memberJoinChoice";
	}

}
