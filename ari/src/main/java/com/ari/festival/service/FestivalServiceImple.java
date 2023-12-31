package com.ari.festival.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.festival.model.FestivalDTO;
import com.ari.mapper.FestivalMapper;
import com.ari.notice.model.NoticeDTO;

@Service
public class FestivalServiceImple implements FestivalService {

	@Autowired
	private FestivalMapper mapper;
	
	@Override
	public int festAdd(FestivalDTO dto) throws Exception {
		int result=mapper.festAdd(dto);
		return result;
	}
	@Override
	public int totalCnt() throws Exception {
		int result=mapper.totalCnt();
		return result;
	}
	@Override
	public int totalCntArea(int area) throws Exception {
		int result=mapper.totalCntArea(area);
		return result;
	}
	@Override
	public List<FestivalDTO> festList(int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<FestivalDTO> lists=mapper.festList(map);
		return lists;
	}
	@Override
	public List<FestivalDTO> festListArea(int area, int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("area", area);
		map.put("start", start);
		map.put("end", end);
		List<FestivalDTO> lists=mapper.festListArea(map);
		return lists;
	}
	@Override
	public List<FestivalDTO> festListAreaTitleDesc(int area, int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("area", area);
		map.put("start", start);
		map.put("end", end);
		List<FestivalDTO> lists=mapper.festListAreaTitleDesc(map);
		return lists;
	}
	@Override
	public FestivalDTO festContent(int festidx) throws Exception {
		FestivalDTO dto=mapper.festContent(festidx);
		return dto;
	}
	@Override
	public String getFestImg(int festidx) throws Exception {
		String result=mapper.getFestImg(festidx);
		return result;
	}
	@Override
	public int festDel(int festidx) throws Exception {
		int result=mapper.festDel(festidx);
		return result;
	}
	@Override
	public int festUpd(FestivalDTO dto) throws Exception {
		int result=mapper.festUpd(dto);
		return result;
	}
	@Override
	public int readCount(int festidx) throws Exception {
		int result=mapper.readCount(festidx);
		return result;
	}
}
