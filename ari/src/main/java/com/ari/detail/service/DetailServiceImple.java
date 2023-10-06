package com.ari.detail.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.DetailMapper;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.detail.model.searchVO;
import com.ari.festival.model.FestivalDTO;

@Service
public class DetailServiceImple implements DetailService {

	@Autowired
	private DetailMapper mapper;
	
	@Override
	public List<FoodDTO> foodListIn(searchVO params) throws Exception {
		List<FoodDTO> lists=mapper.foodListIn(params);
		return lists;
	}
	@Override
	public List<BerthInfoDTO> berthInfoListIn(searchVO params) throws Exception {
		List<BerthInfoDTO> lists=mapper.berthInfoListIn(params);
		return lists;
	}
	
	@Override
	public List<AttDTO> attListIn(searchVO params) throws Exception {
		List<AttDTO> lists=mapper.attListIn(params);
		return lists;
	}
	@Override
	public List<FestivalDTO> festivalListIn(searchVO params) throws Exception {
		List<FestivalDTO> lists=mapper.festivalListIn(params);
		return lists;
	}
	@Override
	public List<FoodDTO> foodList(String search) throws Exception {
		List<FoodDTO> lists=mapper.foodList(search);
		return lists;
	}
	@Override
	public List<BerthInfoDTO> berthInfoList(String search) throws Exception {
		List<BerthInfoDTO> lists=mapper.berthInfoList(search);
		return lists;
	}
	@Override
	public List<AttDTO> attList(String search) throws Exception {
		List<AttDTO> lists=mapper.attList(search);
		return lists;
	}
	
	@Override
	public List<FestivalDTO> festivalList(String search) throws Exception {
		List<FestivalDTO> lists=mapper.festivalList(search);
		return lists;
	}
	
	
}
