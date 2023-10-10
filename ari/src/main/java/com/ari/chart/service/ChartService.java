package com.ari.chart.service;

import java.util.HashMap;
import java.util.List;

import com.ari.chart.model.ChartDTO;

public interface ChartService {
	
	public List<ChartDTO> chartList()throws Exception;

}
