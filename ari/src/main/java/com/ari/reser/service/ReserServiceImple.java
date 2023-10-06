package com.ari.reser.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.ReserMapper;
import com.ari.reser.model.ReserDTO;

@Service
public class ReserServiceImple implements ReserService {

	@Autowired
	private ReserMapper mapper;
	
	@Override
	public List<ReserDTO> reserSelect(int cp,int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<ReserDTO> list = mapper.reserSelect(map);
		return list;
	}
	@Override
	public int reserTotalCnt() {
		int result = mapper.reserTotalCnt();
		return result;
	}
}
