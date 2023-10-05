package com.ari.festival.service;

import java.util.List;
import java.util.Map;

import com.ari.festival.model.FestivalDTO;

public interface FestivalService {

	public int festAdd(FestivalDTO dto)throws Exception;
	public int totalCnt()throws Exception;
	public int totalCntArea(int area)throws Exception;
	public List<FestivalDTO> festList(int cp, int ls)throws Exception;
	public List<FestivalDTO> festListArea(int area,int cp, int ls)throws Exception;
}
