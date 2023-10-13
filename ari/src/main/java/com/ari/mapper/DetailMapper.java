package com.ari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.ari.detail.model.*;
import com.ari.festival.model.*;
import com.ari.review.model.*;

public interface DetailMapper {

	public List<FoodDTO> foodListIn(searchVO params);
	
	public List<BerthInfoDTO> berthInfoListIn(searchVO params);
	
	public List<AttDTO> attListIn(searchVO params);
	
	public List<FestivalDTO> festivalListIn(searchVO params);
	
	public List<FoodDTO> foodList(String search);
	
	public List<BerthInfoDTO> berthInfoList(String search);
	
	public List<AttDTO> attList(String search);
	
	public List<FestivalDTO> festivalList(String search);
	
	public List<FoodDTO> foodDetail(int idx);
	
	public List<BerthInfoDTO> berthInfoDetail(int idx);
	
	public List<BerthDTO> berthDetail(BerthDTO dto);
	
	public List<AttDTO> attDetail(int idx);
	
	public List<FestivalDTO> festDetail(int idx);
	
	public List<ReviewDTO> reviewList(int berthIdx);
}
