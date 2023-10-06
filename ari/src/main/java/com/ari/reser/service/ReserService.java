package com.ari.reser.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ari.reser.model.ReserDTO;

@Service
public interface ReserService {

	public List<ReserDTO> reserSelect(int cp,int listSize);
	public int reserTotalCnt();
}
