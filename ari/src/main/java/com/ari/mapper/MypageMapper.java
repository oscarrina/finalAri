package com.ari.mapper;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestParam;

import com.ari.like.model.LikeDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;

public interface MypageMapper {

	public List<ReserDTO> myReser(Map map);
	public List<ReserDTO> reviewWrite(Map map);
	public int reviewWriteTotalCnt(Map map);
	public List<ReviewDTO> myPageReview(Map map);
	public int reviewTotalCnt(String userId);
	public List<LikeDTO> myPageLike(Map map);
	public int likeTotalCnt(String userId);
}
