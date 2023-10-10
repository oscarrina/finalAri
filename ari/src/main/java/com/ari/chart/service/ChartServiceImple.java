package com.ari.chart.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.chart.model.ChartDTO;
import com.ari.mapper.ChartMapper;

@Service
public class ChartServiceImple implements ChartService {
	
	@Autowired
	private ChartMapper mapper;
	
	@Override
	public List<ChartDTO> chartList(String start, String end) throws Exception {
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ChartDTO> lists=mapper.chartList(map);
		return lists;
	}
}
