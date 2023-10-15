package com.ari.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.QnaMapper;
import com.ari.qna.model.QnaDTO;
import com.ari.qna.model.ReplyDTO;

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
		return lists;
	}
	
	@Override
	public QnaDTO QnaDetail(int qnaIdx) throws Exception {
		QnaDTO list=mapper.QnaDetail(qnaIdx);
		return list;
	}
	
	@Override
	public int totalCnt() throws Exception {
		int result=mapper.totalCnt();
		return result;
	}
	
	@Override
	public ReplyDTO replyList(int qnaIdx) throws Exception {
		ReplyDTO list=mapper.replyList(qnaIdx);
		return list;
	}
	
	@Override
	public List<QnaDTO> adminQnaList() throws Exception {
		List<QnaDTO> lists=mapper.adminQnaList();
		return lists;
	}
	
	@Override
	public int adminReply(ReplyDTO dto) throws Exception {
		int result=mapper.adminReply(dto);
		return result;
	}
	@Override
	public int qnaOk(int qnaIdx) throws Exception {
		int result=mapper.qnaOk(qnaIdx);
		return result;
	}
}
