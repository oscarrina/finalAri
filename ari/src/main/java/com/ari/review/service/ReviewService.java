package com.ari.review.service;

import org.springframework.stereotype.Service;

import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;

public interface ReviewService {

	public int reviewContent(ReviewDTO dto)throws Exception;
	public int getBerthidx(int reserIdx)throws Exception;
	public int reviewDel(ReviewDTO dto)throws Exception;
	public int reserReviewUpdate(ReserDTO dto)throws Exception;
	public int reserReviewDel(ReserDTO dto)throws Exception;
}
