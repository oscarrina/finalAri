package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.reser.model.ReserDTO;

public interface ReserMapper {

	public List<ReserDTO> reserSelect(Map map);
	public int reserTotalCnt(String userId);
	public int reserCancel(int reserIdx);
	public ReserDTO reserForm(Map map);
}
