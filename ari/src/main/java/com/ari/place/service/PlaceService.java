package com.ari.place.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ari.detail.model.AttDTO;
import com.ari.detail.model.BerthInfoDTO;
import com.ari.detail.model.FoodDTO;

public interface PlaceService {
	public int attInsert(AttDTO dto);
	public int foodInsert(FoodDTO dto);
	public int berthInfoInsert(BerthInfoDTO dto);
	public List<AttDTO> attSelect(String userID);
	public List<FoodDTO> foodSelect(String userID);
	public List<BerthInfoDTO> berthInfoSelect(String userID);
	public AttDTO attDelSelect(int idx);
	public FoodDTO foodDelSelect(int idx);
	public BerthInfoDTO berthInfoDelSelect(int idx);
}
