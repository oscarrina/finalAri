package com.ari.plan.service;

import java.util.List;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlanService {
	public List<AttDTO> getAttList(int area,int sigungu) throws Exception; 
	public List<FoodDTO> getFoodList(int area,int sigungu) throws Exception;
	public List<BerthInfoDTO> getBerthInfoList(int area,int sigungu)  throws Exception;
}
