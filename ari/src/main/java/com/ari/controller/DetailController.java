package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class DetailController {

	@RequestMapping("/searchResult")
	public String search() {
		return "detail/searchResult";
	}
}
