package com.ari.cos.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.cos.model.CosDTO;
import com.ari.mapper.CosMapper;

@Service
public class CosServiceImple implements CosService {
	
	@Autowired
	private CosMapper mapper;

	@Override
	public List<CosDTO> cosList(int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<CosDTO> lists=mapper.CosList(map);
		return lists;
	}
	
	@Override
	public List<CosDTO> cosListArea(int cosArea, int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("cosArea", cosArea);
		map.put("start", start);
		map.put("end", end);
		List<CosDTO> lists=mapper.CosListArea(map);
		return lists;
	}
	
	@Override
	public int totalCnt() throws Exception {
		int result=mapper.totalCnt();
		return result;
	}
	
	@Override
	public int totalCntArea(int cosArea) throws Exception {
		int result=mapper.totalCntArea(cosArea);
		return result;
	}
	
	@Override
	public CosDTO cosContent(int idx) throws Exception {
		CosDTO dto=mapper.cosContent(idx);
		return dto;
	}
	
}
