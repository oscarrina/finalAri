package com.ari.review.service;

import org.springframework.stereotype.Service;

import com.ari.review.model.ReviewDTO;

public interface ReviewService {

	public int reviewContent(ReviewDTO dto)throws Exception;
	public int getBerthidx(int reseridx)throws Exception;
	public int reviewDel(ReviewDTO dto)throws Exception;
}
