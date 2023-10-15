package com.ari.qna.service;

import com.ari.qna.model.*;

import java.util.*;

public interface QnaService {

	public int qnaWrite(QnaDTO dto) throws Exception;
	
	public int ceoQnaWrite(QnaDTO dto) throws Exception;
	
	public List<QnaDTO> QnaList(String sid) throws Exception;
	
	public QnaDTO QnaDetail(int qnaIdx) throws Exception;
	
	public int totalCnt() throws Exception;
	
	public ReplyDTO replyList(int qnaIdx) throws Exception;
	
	public List<QnaDTO> adminQnaList() throws Exception;
	
	public int adminReply(ReplyDTO dto) throws Exception;
	
	public int qnaOk(int qnaIdx) throws Exception;
}
