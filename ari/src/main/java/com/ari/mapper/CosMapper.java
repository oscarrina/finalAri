package com.ari.mapper;

import java.util.List;

import com.ari.cos.model.CosDTO;

public interface CosMapper {

	public List<CosDTO> CosList();
	public CosDTO cosContent(int idx);
}
