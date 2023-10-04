package com.ari.notice.service;

import java.util.*;


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
	public int checkTopA() throws Exception {
		int count=mapper.checkTopA();
		return count;
	}
	@Override
	public int totalCntU(int cate) throws Exception {
		int count=mapper.totalCntU(cate);
		return count;
	}
	@Override
	public int totalCntA() throws Exception {
		int count=mapper.totalCntA();
		return count;
	}
	@Override
	public List<NoticeDTO> getAllTop() throws Exception {
		List<NoticeDTO> lists=mapper.getAllTop();
		return lists;
	}
	@Override
	public List<NoticeDTO> noticeAllList(int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<NoticeDTO> lists=mapper.noticeAllList(map);
		return lists;
	}
	@Override
	public List<NoticeDTO> getUserTop(int type) throws Exception {
		List<NoticeDTO> lists=mapper.getUserTop(type);
		return lists;
	}
	@Override
	public List<NoticeDTO> noticeUserList(int type, int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		List<NoticeDTO> lists=mapper.noticeUserList(map);
		return lists;
	}
	@Override
	public List<NoticeDTO> getUserList(int type, int cp, int ls) throws Exception {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		Map map=new HashMap();
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		List<NoticeDTO> lists=mapper.getUserList(map);
		return lists;
	}
	@Override
	public NoticeDTO getNoticeContent(int noticeidx) throws Exception {
		NoticeDTO dto=mapper.getNoticeContent(noticeidx);
		return dto;
	}
	@Override
	public int noticeDel(int idx) throws Exception {
		int result=mapper.noticeDel(idx);
		return result;
	}
	@Override
	public int noticeUpd(NoticeDTO dto) throws Exception {
		int result=mapper.noticeUpd(dto);
		return result;
	}

}
