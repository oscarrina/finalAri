package com.ari.notice.service;

import java.util.List;
import java.util.Map;

import com.ari.notice.model.NoticeDTO;

public interface NoticeService {
	
	int user=1;
	int ceo=2;
	int admin=3;
	
	public int noticeAdd(NoticeDTO dto)throws Exception;
	public int checkTopU(int cate)throws Exception;
	public int checkTopA()throws Exception;
	public int totalCntU(int cate)throws Exception;
	public int totalCntA()throws Exception;
	public List<NoticeDTO> getAllTop()throws Exception;
	public List<NoticeDTO> noticeAllList(int cp, int ls)throws Exception;
	public List<NoticeDTO> getUserTop(int type)throws Exception;
	public List<NoticeDTO> noticeUserList(int type,int cp, int ls)throws Exception;
	public List<NoticeDTO> getUserList(int type,int cp, int ls)throws Exception;
	public NoticeDTO getNoticeContent(int noticeidx)throws Exception;
	public int noticeDel(int idx)throws Exception;
	public int noticeUpd(NoticeDTO dto)throws Exception;

}
