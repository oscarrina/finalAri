package com.ari.reser.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ari.reser.model.ReserDTO;

@Service
public interface ReserService {

	static final int reserCancel = 0;
	static final int reserSign = 1;
	
	public List<ReserDTO> reserSelect(int cp,int listSize,String userId);
	public int reserTotalCnt(String userId);
	public int reserCancel(int reserIdx);
	public ReserDTO reserForm(int berthIdx,int idx);
	public int reserInsert(ReserDTO dto);
	public int reserVisitInsert(List<ReserDTO> list);
}
