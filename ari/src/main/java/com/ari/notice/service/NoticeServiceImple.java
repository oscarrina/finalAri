package com.ari.notice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.NoticeMapper;
import com.ari.notice.model.NoticeDTO;

@Service
public class NoticeServiceImple implements NoticeService {
	
	@Autowired
	private NoticeMapper mapper;
	
	@Override
	public int noticeAdd(NoticeDTO dto) throws Exception {
		int result=mapper.noticeAdd(dto);
		return result;
	}

}
