package com.ari.detail.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.detail.model.searchVO;
import com.ari.festival.model.FestivalDTO;
import com.ari.review.model.ReviewDTO;

public interface DetailService {

	public List<FoodDTO> foodListIn(searchVO params) throws Exception;
		
	public List<BerthInfoDTO> berthInfoListIn(searchVO params) throws Exception;
	
	public List<AttDTO> attListIn(searchVO params) throws Exception;
	
	public List<FestivalDTO> festivalListIn(searchVO params) throws Exception;
	
	public List<FoodDTO> foodList(String search) throws Exception;
	
	public List<BerthInfoDTO> berthInfoList(String search) throws Exception;
	
	public List<AttDTO> attList(String search) throws Exception;
	
	public List<FestivalDTO> festivalList(String search) throws Exception;
	
	public List<FoodDTO> foodDetail(int idx) throws Exception;
	
	public List<BerthInfoDTO> berthInfoDetail(int idx) throws Exception;
	
	public List<BerthDTO> berthDetail(BerthDTO dto) throws Exception;
	
	public List<AttDTO> attDetail(int idx) throws Exception;
	
	public List<FestivalDTO> festDetail(int idx) throws Exception;
	
	public List<ReviewDTO> reviewList(int berthIdx)throws Exception;
}
