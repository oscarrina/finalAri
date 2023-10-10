package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.reser.model.ReserDTO;

public interface MypageMapper {

	public List<ReserDTO> myReser(Map map);
	public List<ReserDTO> reviewWrite(Map map);
	public int reviewTotalCnt(String userId);
}
