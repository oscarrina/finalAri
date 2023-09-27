package com.ari.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class QnaController {

	@RequestMapping("/writeQForm")
	public String writeQForm() {
		return "qna/writeQ";
	}
}
