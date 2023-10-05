package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LikeController {

	@GetMapping("/cos")
	public String cos() {
		return "cos";
	}
	@GetMapping("/planShare")
	public String planShare() {
		return "planShare";
	}
}
