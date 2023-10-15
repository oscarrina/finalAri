package com.ari.mapper;

import java.util.List;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlaceRegMapper {
	public int attInsert(AttDTO dto);
	public int foodInsert(FoodDTO dto);
	public int berthInfoInsert(BerthInfoDTO dto);
	public List<AttDTO> attSelect(String userId);
	public List<FoodDTO> foodSelect(String userId);
	public List<BerthInfoDTO> berthInfoSelect(String userId);
}
