package com.ari.mapper;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlaceRegMapper {
	public int attInsert(AttDTO dto);
	public int foodInsert(FoodDTO dto);
	public int berthInfoInsert(BerthInfoDTO dto);
}
