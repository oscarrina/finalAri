package com.ari.like.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.like.model.LikeDTO;
import com.ari.mapper.LikeMapper;

@Service
public class LikeServiceImple implements LikeService {

	@Autowired
	private LikeMapper mapper;
	
	@Override
	public String likeSelect(LikeDTO dto) {
		String likeYN = mapper.likeSelect(dto);
		return likeYN;
	}
	@Override
	public int like(LikeDTO dto) {
		int result = mapper.like(dto);
		return result;
	}
	@Override
	public int likeNo(LikeDTO dto) {
		int result = mapper.likeNo(dto);
		return result;
	}

}
