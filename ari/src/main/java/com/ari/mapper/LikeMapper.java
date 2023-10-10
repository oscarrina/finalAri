package com.ari.mapper;

import com.ari.like.model.LikeDTO;

public interface LikeMapper {

	public int like(LikeDTO dto);
	public String likeSelect(LikeDTO dto);
}
