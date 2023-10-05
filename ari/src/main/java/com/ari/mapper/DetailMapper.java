package com.ari.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Param;

import com.ari.detail.model.*;
import com.ari.festival.model.*;

public interface DetailMapper {

	public List<FoodDTO> foodListIn(@Param("area")int area,@Param("search")String search);
	
	public List<BerthInfoDTO> berthInfoListIn(@Param("area")int area,@Param("search")String search);
	
	public List<AttDTO> attListIn(@Param("area")int area,@Param("search")String search);
	
	public List<FestivalDTO> festivalListIn(@Param("area")int area,@Param("search")String search);
	
	public List<FoodDTO> foodList(String search);
	
	public List<BerthInfoDTO> berthInfoList(String search);
	
	public List<AttDTO> attList(String search);
	
	public List<FestivalDTO> festivalList(String search);
	
}
