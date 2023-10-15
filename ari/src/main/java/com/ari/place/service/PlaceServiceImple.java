package com.ari.place.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.detail.model.AttDTO;

import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;
import com.ari.mapper.PlaceRegMapper;
@Service
public class PlaceServiceImple implements PlaceService {
	@Autowired
	private PlaceRegMapper mapper;
	
	@Override
	public int attInsert(AttDTO dto) {
		int result = mapper.attInsert(dto);
		return result;
	}
	@Override
	public int berthInfoInsert(BerthInfoDTO dto) {
		int result = mapper.berthInfoInsert(dto);
		return result;
	}
	@Override
	public int foodInsert(FoodDTO dto) {
		int result = mapper.foodInsert(dto);
		return result;
	}
	@Override
	public List<AttDTO> attSelect(String userId) {
		List<AttDTO> arr = mapper.attSelect(userId);
		return arr;
	}
	@Override
	public List<BerthInfoDTO> berthInfoSelect(String userId) {
		List<BerthInfoDTO> arr = mapper.berthInfoSelect(userId);
		return arr;
	}
	@Override
	public List<FoodDTO> foodSelect(String userId) {
		List<FoodDTO> arr = mapper.foodSelect(userId);
		return arr;
	}

}
