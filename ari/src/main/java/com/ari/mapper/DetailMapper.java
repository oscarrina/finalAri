package com.ari.mapper;

import java.util.*;
import com.ari.detail.model.*;
import com.ari.festival.model.*;

public interface DetailMapper {

	public List<FoodDTO> foodList(int area);
	
	public List<BerthInfoDTO> berthInfoList(int area);
	
	public List<AttDTO> attList(int area);
	
	public List<FestivalDTO> festivalList(int area);
	
}
