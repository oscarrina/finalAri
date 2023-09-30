package com.ari.qna.service;

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

}
