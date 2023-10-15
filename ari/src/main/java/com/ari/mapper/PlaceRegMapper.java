package com.ari.mapper;

import java.util.List;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlaceRegMapper {
	public int attInsert(AttDTO dto);
	public int foodInsert(FoodDTO dto);
	public int berthInfoInsert(BerthInfoDTO dto);
	public List<AttDTO> attSelect(String userID);
	public List<FoodDTO> foodSelect(String userID);
	public List<BerthInfoDTO> berthInfoSelect(String userID);
	public List<AttDTO> attDelSelect(int idx);
	public List<FoodDTO> foodDelSelect(int idx);
	public List<BerthInfoDTO> berthInfoDelSelect(int idx);
}
