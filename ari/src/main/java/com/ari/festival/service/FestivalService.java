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
	public List<FestivalDTO> festListAreaTitleDesc(int area, int cp, int ls)throws Exception;
	public FestivalDTO festContent(int festidx)throws Exception;
	public String getFestImg(int festidx)throws Exception;
	public int festDel(int festidx)throws Exception;
	public int festUpd(FestivalDTO dto)throws Exception;
}
