package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlanController {
	@RequestMapping("planMap")
	public String planMap() {
		return "plan/planMap";
	}

}
