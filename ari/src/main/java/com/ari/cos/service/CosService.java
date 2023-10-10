package com.ari.cos.service;

import java.util.List;

import com.ari.cos.model.CosDTO;

public interface CosService {

	public List<CosDTO> cosList(int cp, int ls)throws Exception;
	public List<CosDTO> cosListArea(int cosArea, int cp, int ls)throws Exception;
	public int totalCnt()throws Exception;
	public int totalCntArea(int cosArea)throws Exception;
	public CosDTO cosContent(int idx) throws Exception;
}
