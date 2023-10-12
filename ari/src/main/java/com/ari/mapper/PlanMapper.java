package com.ari.mapper;

import java.util.List;
import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlanMapper {
	public List<AttDTO> getAttList(int area,int sigungu);
	public List<FoodDTO> getFoodList(int area,int sigungu);
	public List<BerthInfoDTO> getBerthInfoList(int area,int sigungu);
}
