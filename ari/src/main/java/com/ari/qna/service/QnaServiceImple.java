package com.ari.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.QnaMapper;
import com.ari.qna.model.QnaDTO;

@Service
public class QnaServiceImple implements QnaService {
	
	@Autowired
	private QnaMapper mapper;

	@Override
	public int qnaWrite(QnaDTO dto) throws Exception {
		int result=mapper.qnaWrite(dto);
		return result;
	}
	

	@Override
	public int ceoQnaWrite(QnaDTO dto) throws Exception {
		int result=mapper.ceoQnaWrite(dto);
		return result;
	}
	
	@Override
	public List<QnaDTO> QnaList(String sid) throws Exception {
		List<QnaDTO> lists=mapper.QnaList(sid);
		System.out.println("what the fuck");
		return lists;
	}
	
	@Override
	public List<QnaDTO> QnaDetail(int qnaIdx) throws Exception {
		List<QnaDTO> lists=mapper.QnaDetail(qnaIdx);
		return lists;
	}
	
	@Override
	public int totalCnt() throws Exception {
		int result=mapper.totalCnt();
		return result;
	}
	
}
