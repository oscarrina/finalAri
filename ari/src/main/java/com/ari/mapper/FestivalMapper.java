package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.festival.model.FestivalDTO;

public interface FestivalMapper {

	public int festAdd(FestivalDTO dto);
	public int totalCnt();
	public int totalCntArea(int area);
	public List<FestivalDTO> festList(Map map);
	public List<FestivalDTO> festListArea(Map map);
	public List<FestivalDTO> festListAreaTitleDesc(Map map);
	public FestivalDTO festContent(int festidx);
	public String getFestImg(int festidx);
	public int festDel(int festidx);
	public int festUpd(FestivalDTO dto);
	public int readCount(int festidx);
	
}
