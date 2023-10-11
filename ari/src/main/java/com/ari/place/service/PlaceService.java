package com.ari.place.service;

import org.springframework.stereotype.Service;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlaceService {
	public int attInsert(AttDTO dto);
	public int foodInsert(FoodDTO dto);
	public int berthInfoInsert(BerthInfoDTO dto);

}
