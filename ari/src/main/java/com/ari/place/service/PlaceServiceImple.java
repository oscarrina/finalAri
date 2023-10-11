package com.ari.place.service;

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

}
