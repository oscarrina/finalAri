package com.ari.mypage.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.MypageMapper;
import com.ari.mapper.ReserMapper;
import com.ari.reser.model.ReserDTO;

@Service
public class MypageServiceImple implements MypageService {

	@Autowired
	private MypageMapper mypageMapper;
	@Autowired
	private ReserMapper reserMapper;
	
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
	public int reviewTotalCnt(String userId) {
		int result = mypageMapper.reviewTotalCnt(userId);
		return result;
	}
	@Override
	public Map<String, Object> reserReview(Map<String, String> param) {
		int cp = Integer.parseInt(param.get("cp"));
		int listSize = Integer.parseInt(param.get("listSize"));
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		
		param.put("start", String.valueOf(start));
		param.put("end", String.valueOf(end));
		
		List<ReserDTO> list = mypageMapper.reviewWrite(param);
		int totalCnt = reviewTotalCnt(param.get("userId"));
		
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("list", list);
		result.put("totalCnt", totalCnt);
		return result;
	}
}
