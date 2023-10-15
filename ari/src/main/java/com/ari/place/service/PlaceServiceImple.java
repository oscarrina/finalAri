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
	public List<AttDTO> attSelect(String userID) {
		List<AttDTO> arr = mapper.attSelect(userID);
		return arr;
	}
	@Override
	public List<BerthInfoDTO> berthInfoSelect(String userID) {
		List<BerthInfoDTO> arr = mapper.berthInfoSelect(userID);
		return arr;
	}
	@Override
	public List<FoodDTO> foodSelect(String userID) {
		List<FoodDTO> arr = mapper.foodSelect(userID);
		return arr;
	}
	@Override
	public List<AttDTO> attDelSelect(int idx){
		List<AttDTO> arr = mapper.attDelSelect(idx);
		return arr;
	}
	@Override
	public List<BerthInfoDTO> berthInfoDelSelect(int idx) {
		List<BerthInfoDTO> arr = mapper.berthInfoDelSelect(idx);
		return arr;
	}@Override
	public List<FoodDTO> foodDelSelect(int idx) {
		List<FoodDTO> arr = mapper.foodDelSelect(idx);
		return arr;
	}

}
