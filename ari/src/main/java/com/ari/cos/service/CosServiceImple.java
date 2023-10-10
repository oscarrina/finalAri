package com.ari.cos.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.cos.model.CosDTO;
import com.ari.mapper.CosMapper;

@Service
public class CosServiceImple implements CosService {
	
	@Autowired
	private CosMapper mapper;

	@Override
	public List<CosDTO> cosList() throws Exception {
		List<CosDTO> lists=mapper.CosList();
		return lists;
	}
	
	@Override
	public CosDTO cosContent(int idx) throws Exception {
		CosDTO dto=mapper.cosContent(idx);
		return dto;
	}
}
