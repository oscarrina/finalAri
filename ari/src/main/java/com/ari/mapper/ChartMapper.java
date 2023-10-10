package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.chart.model.ChartDTO;

public interface ChartMapper {
	
	public List<ChartDTO> chartList(Map map);

}
