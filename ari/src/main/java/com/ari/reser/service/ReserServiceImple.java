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
	public List<ReserDTO> reserSelect(int cp,int listSize,String userId) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("userid", userId);
		List<ReserDTO> list = mapper.reserSelect(map);
		return list;
	}
	@Override
	public int reserTotalCnt(String userId) {
		int result = mapper.reserTotalCnt(userId);
		return result;
	}
	@Override
	public int reserCancel(int reserIdx) {
		int result = mapper.reserCancel(reserIdx);
		return result;
	}
	@Override
	public int reserVisitDel(int idx) {
		int result = mapper.reserVisitDel(idx);
		return result;
	}
	@Override
	public ReserDTO reserForm(int berthIdx,int idx) {
		Map map = new HashMap();
		map.put("berthIdx", berthIdx);
		map.put("idx", idx);
		ReserDTO dto = mapper.reserForm(map);
		return dto;
	}
	@Override
	public int reserInsert(ReserDTO dto) {
		int result = mapper.reserInsert(dto);
		return result;
	}
	@Override
	public int reserVisitInsert(List<ReserDTO> list) {
		int result = mapper.reserVisitInsert(list);
		return result;
	}
	@Override
	public String berthInfoName(int idx) {
		String berthInfoName = mapper.berthInfoName(idx);
		return berthInfoName;
	}
	@Override
	public ReserDTO ceoCancelSMS(int berthIdx) {
		ReserDTO dto = mapper.ceoCancelSMS(berthIdx);
		return dto;
	}
	@Override
	public int reserPayState(int reserIdx) {
		int result = mapper.reserPayState(reserIdx);
		return result;
	}
}
