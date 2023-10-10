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
	public List<ChartDTO> chartList() throws Exception {
		List<ChartDTO> lists=mapper.chartList();
		System.out.println(lists.get(0).getPlancount());
		return lists;
	}
}
