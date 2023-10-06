package com.ari.detail.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.detail.model.searchVO;
import com.ari.festival.model.FestivalDTO;

public interface DetailService {

	public List<FoodDTO> foodListIn(searchVO params) throws Exception;
		
	public List<BerthInfoDTO> berthInfoListIn(searchVO params) throws Exception;
	
	public List<AttDTO> attListIn(searchVO params) throws Exception;
	
	public List<FestivalDTO> festivalListIn(searchVO params) throws Exception;
	
	public List<FoodDTO> foodList(String search) throws Exception;
	
	public List<BerthInfoDTO> berthInfoList(String search) throws Exception;
	
	public List<AttDTO> attList(String search) throws Exception;
	
	public List<FestivalDTO> festivalList(String search) throws Exception;
}
