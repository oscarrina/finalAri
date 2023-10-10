package com.ari.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class placeRegController {
	@RequestMapping("/placeRegForm")
	public String placeRegForm() {
		return "place/placeReg";
	}

	@RequestMapping("/getCategroyForm")
	public ModelAndView getCategroyForm(@RequestParam(value = "divId", required=false)String id) throws IOException  {
		ModelAndView mav = new ModelAndView();
		switch (id) { 
			case "1": mav.setViewName("place/attForm"); break;
			case "2": mav.setViewName("place/foodForm");break;
			case "3": mav.setViewName("place/berthForm"); break;
		}
		return mav;
	}
   
	public static String readJspFile(String filePath) throws IOException {
        StringBuilder content = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new FileReader(filePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                content.append(line).append("\n");
            }
        }
        return content.toString();
    }
}
