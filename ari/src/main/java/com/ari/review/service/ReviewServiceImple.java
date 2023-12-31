package com.ari.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.ReviewMapper;
import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;

@Service
public class ReviewServiceImple implements ReviewService {

	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public int reviewContent(ReviewDTO dto) throws Exception {
		int result=mapper.reviewContent(dto);
		return result;
	}
	@Override
	public int getBerthidx(int reserIdx) throws Exception {
		int result=mapper.getBerthidx(reserIdx);
		return result;
	}
	@Override
	public int reviewDel(ReviewDTO dto) throws Exception {
		int result=mapper.reviewDel(dto);
		return result;
	}
	@Override
	public int reserReviewDel(ReserDTO dto) throws Exception {
		int result=mapper.reserReviewDel(dto);
		return result;
	}
	@Override
	public int reserReviewUpdate(ReserDTO dto) throws Exception {
		int result=mapper.reserReviewUpdate(dto);
		return result;
	}
}
