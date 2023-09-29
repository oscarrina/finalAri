package com.ari.notice.service;

import com.ari.notice.model.NoticeDTO;

public interface NoticeService {
	
	int user=1;
	int ceo=2;
	int admin=3;
	
	public int noticeAdd(NoticeDTO dto)throws Exception;

}
