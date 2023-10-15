package com.ari.mapper;

import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;

public interface ReviewMapper {

	public int reviewContent(ReviewDTO dto);
	public int getBerthidx(int reserIdx);
	public int reviewDel(ReviewDTO dto);
	public int reserReviewUpdate(ReserDTO dto);
	public int reserReviewDel(ReserDTO dto);
}
