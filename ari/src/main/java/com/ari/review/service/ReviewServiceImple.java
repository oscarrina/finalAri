package com.ari.review.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.ReviewMapper;
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
	public int getBerthidx(int reseridx) throws Exception {
		int result=mapper.getBerthidx(reseridx);
		return result;
	}
	@Override
	public int reviewDel(ReviewDTO dto) throws Exception {
		int result=mapper.reviewDel(dto);
		return result;
	}

}
