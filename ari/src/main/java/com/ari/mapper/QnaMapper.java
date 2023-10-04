package com.ari.mapper;

import com.ari.qna.model.*;
import java.util.*;

public interface QnaMapper {

	public int qnaWrite(QnaDTO dto);

	public int ceoQnaWrite(QnaDTO dto);
	
	public List<QnaDTO> QnaList(String sid);
	
	public List<QnaDTO> QnaDetail(int qnaidx);
	
	public int totalCnt();
}
