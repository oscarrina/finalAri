package com.ari.like.service;

import org.springframework.stereotype.Service;

import com.ari.like.model.LikeDTO;

@Service
public interface LikeService {

	static final int cos = 1;
	static final int plan = 2;
	
	public String likeSelect(LikeDTO dto);
	public int like(LikeDTO dto);
	public int likeNo(LikeDTO dto);
}
