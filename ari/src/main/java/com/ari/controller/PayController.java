package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PayController {

	@GetMapping("/pay/success")
	public String paySuccess() {
		return "/";
	}
}
