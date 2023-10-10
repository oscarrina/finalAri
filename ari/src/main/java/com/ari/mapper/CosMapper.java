package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.cos.model.CosDTO;

public interface CosMapper {

	public List<CosDTO> CosList(Map map);
	public List<CosDTO> CosListArea(Map map);
	public int totalCnt();
	public int totalCntArea(int coaArea);
	public CosDTO cosContent(int idx);
}
