package com.ari.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ari.chart.model.ChartDTO;
import com.ari.chart.service.ChartService;

@Controller
public class ChartController {
	
	
	
	@Autowired
	private ChartService service;
	
	@RequestMapping("/chart")
	public String chartForm() {
		return "admin/chart/areaChart";
	}
	
	@RequestMapping("/getplanjson")
	public ModelAndView plandata() {
		ModelAndView mav=new ModelAndView();
		List<ChartDTO> lists=null;
		try {
			lists=service.chartList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<Integer, String> areamap=new HashMap<Integer, String>();
		areamap.put(1, "서울");
		areamap.put(2, "인천");
		areamap.put(3, "대전");
		areamap.put(4, "대구");
		areamap.put(5, "광주");
		areamap.put(6, "부산");
		areamap.put(7, "울산");
		areamap.put(8, "세종특별자치시");
		areamap.put(31, "경기도");
		areamap.put(32, "강원특별자치도");
		areamap.put(33, "충청북도");
		areamap.put(34, "충청남도");
		areamap.put(35, "경상북도");
		areamap.put(36, "경상남도");
		areamap.put(37, "전라북도");
		areamap.put(38, "전라남도");
		areamap.put(39, "제주도");
		StringBuffer sb=new StringBuffer();
		sb.append("{\"cols\":[");
		sb.append("{\"id\":\"\",\"label\":\"지역명\",\"patter\":\"\",\"type\":\"string\"},");
		sb.append("{\"id\":\"\",\"label\":\"일정 수\",\"patter\":\"\",\"type\":\"number\"}");
		sb.append("],");
		sb.append("\"rows\":[");
		for(int i=0;i<lists.size();i++) {
			int listpoint=lists.get(i).getPlanpoint();
			sb.append("{\"c\":[{\"v\":\"");
			sb.append(areamap.get(listpoint));
			sb.append("\"},{\"v\":");
			sb.append(lists.get(i).getPlancount());
			if(i==lists.size()-1) {
				sb.append("}]}");
			}else {
				sb.append("}]},");
			}
		}
		sb.append("]");
		sb.append("}");
		mav.addObject("jsondata", sb);
		mav.setViewName("admin/chart/getPlanJSON");
		return mav;
	}

}
