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
	@Override
	public int checkTopU(int cate) throws Exception {
		int count=mapper.checkTopU(cate);
		return count;
	}
	@Override
	public int CheckTopA() throws Exception {
		int count=mapper.checkTopA();
		return count;
	}

}
