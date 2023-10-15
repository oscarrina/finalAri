package com.ari.mypage.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.ari.like.model.LikeDTO;

@Service
public interface MypageService {

	public Map<String, Object> myReser(Map<String, String> map);
	public Map<String, Object> reserReview(Map<String, Object> map);
	public Map<String, Object> myPageReview(Map<String, String> map);
	public Map<String, Object> myPageLike(Map<String, String> map);
	public String likeSelect(LikeDTO dto);
}
