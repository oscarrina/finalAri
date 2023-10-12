package com.ari.mapper;

import com.ari.review.model.ReviewDTO;

public interface ReviewMapper {

	public int reviewContent(ReviewDTO dto);
	public int getBerthidx(int reseridx);
	public int reviewDel(ReviewDTO dto);
}
