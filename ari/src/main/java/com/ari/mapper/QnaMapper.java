package com.ari.mapper;

import com.ari.qna.model.*;

import java.util.*;

public interface QnaMapper {

	public int qnaWrite(QnaDTO dto);

	public int ceoQnaWrite(QnaDTO dto);
	
	public List<QnaDTO> QnaList(String sid);
	
	public QnaDTO QnaDetail(int qnaIdx);
	
	public int totalCnt();
	
	public ReplyDTO replyList(int qnaIdx);
	
	public List<QnaDTO> adminQnaList();
	
	public int adminReply(ReplyDTO dto);
	
	public int qnaOk(int qnaIdx);
}
