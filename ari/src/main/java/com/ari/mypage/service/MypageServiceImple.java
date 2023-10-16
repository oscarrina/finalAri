package com.ari.mypage.service;

import java.sql.Date;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.like.model.LikeDTO;
import com.ari.mapper.LikeMapper;
import com.ari.mapper.MypageMapper;
import com.ari.mapper.ReserMapper;
import com.ari.plan.model.PlanTableDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private ReserMapper reserMapper;
	@Autowired
	private LikeMapper likeMapper;
	
	@Override
	public Map<String, Object> myReser(Map<String, String> param) {
		int cp = Integer.parseInt(param.get("cp"));
		int listSize = Integer.parseInt(param.get("listSize"));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		
		List<ReserDTO> list = mypageMapper.myReser(param);
		int totalCnt = reserMapper.reserTotalCnt(param.get("userId"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		
		return result;
	}
	@Override
	public Map<String, Object> reserReview(Map<String, Object> param) {
		int cp = Integer.parseInt(String.valueOf(param.get("cp")));
		int listSize = Integer.parseInt(String.valueOf(param.get("listSize")));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		LocalDate now_l = LocalDate.now();
		Date now = java.sql.Date.valueOf(now_l);
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		param.put("now", now);
		
		String userid = (String)param.get("userId");
		param.put("userid", userid);
		
		List<ReserDTO> list = mypageMapper.reviewWrite(param);
		int totalCnt = mypageMapper.reviewWriteTotalCnt(param);
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		
		return result;
	}
	@Override
	public Map<String, Object> myPageReview(Map<String, String> param) {
		int cp = Integer.parseInt(param.get("cp"));
		int listSize = Integer.parseInt(param.get("listSize"));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<ReviewDTO> list = mypageMapper.myPageReview(param);
		System.out.println(param.get("userId"));
		int totalCnt = mypageMapper.reviewTotalCnt(param.get("userId"));
		if(totalCnt == 0) {totalCnt = 1;}
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		
		return result;
	}
	@Override
	public Map<String, Object> myPageLike(Map<String, String> param) {
		int cp = Integer.parseInt(param.get("cp"));
		int listSize = Integer.parseInt(param.get("listSize"));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<LikeDTO> list = mypageMapper.myPageLike(param);
		int totalCnt = mypageMapper.likeTotalCnt(param.get("userId"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		
		return result;
	}
	@Override
	public String likeSelect(LikeDTO dto) {
		String likeYN = likeMapper.likeSelect(dto);
		return likeYN;
	}
	@Override
	public Map<String, Object> myPlanSelect(Map<String, String> param) {
		int cp = Integer.parseInt(param.get("cp"));
		int listSize = Integer.parseInt(param.get("listSize"));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<PlanTableDTO> list = mypageMapper.myPlanSelect(param);
		int totalCnt = mypageMapper.planTotalCnt(param.get("userID"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		return result;
	}
}
