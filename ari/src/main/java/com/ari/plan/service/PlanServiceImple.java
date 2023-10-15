package com.ari.plan.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.mapper.PlanMapper;
import com.ari.plan.model.PlanTableDTO;
import com.ari.plan.model.PlannerTableDTO;
@Service
public class PlanServiceImple implements PlanService {
	@Autowired
	private PlanMapper mapper; 
	
	@Override
	public List<AttDTO> getAttList(int area, int sigungu) throws Exception {
		List<AttDTO> List= mapper.getAttList(area, sigungu);
		return List;
	}
	@Override
	public List<FoodDTO> getFoodList(int area, int sigungu) throws Exception {
		List<FoodDTO> List= mapper.getFoodList(area, sigungu);
		return List;
	}
	@Override
	public List<BerthInfoDTO> getBerthInfoList(int area, int sigungu) throws Exception {
		List<BerthInfoDTO> List= mapper.getBerthInfoList(area, sigungu);
		return List;
	}
	@Override
	public int planInsert(PlanTableDTO dto) {
		int result = mapper.planInsert(dto);
		return result;
	}
	@Override
	public PlanTableDTO planList(PlanTableDTO dto) {
		dto = mapper.planList(dto);
		return dto;
	}
	@Override
	public int plannerInsert(PlannerTableDTO dto) {
		int result = mapper.plannerInsert(dto);
		return result;
	}
	@Override
	public int planDelete(int planGroup) {
		int result = mapper.planDelete(planGroup);
		return result;
	}
	@Override
	public int plannerDelete(int plannerGroup) {
		int result = mapper.plannerDelete(plannerGroup);
		return result;
	}

}
