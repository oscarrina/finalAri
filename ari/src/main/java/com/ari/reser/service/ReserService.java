package com.ari.reser.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ari.reser.model.ReserDTO;
import com.ari.reser.model.TestDTO;

@Service
public interface ReserService {

	static final int reserCancel = 0;
	static final int reserSign = 1;
	
	public List<ReserDTO> reserSelect(int cp,int listSize,String userId);
	public int reserTotalCnt(String userId);
	public int reserCancel(int reserIdx);
	public TestDTO reserForm(int berthIdx);
}
