package com.ari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ari.areaImport.service.AreaImportService;

@Controller
public class AreaImportController {
	@Autowired
	private AreaImportService service;
	
	
	@RequestMapping("areaImport")
	public String areaImportGo() {
		return "areaImport/areaImport";
	}
}