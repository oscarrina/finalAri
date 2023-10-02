package com.ari.mapper;

import java.util.List;
import java.util.Map;

import com.ari.notice.model.NoticeDTO;

public interface NoticeMapper {

	public int noticeAdd(NoticeDTO dto);
	public int checkTopU(int cate);
	public int checkTopA();
	public int totalCntU(int cate);
	public int totalCntA();
	public List<NoticeDTO> getAllTop();
	public List<NoticeDTO> noticeAllList(Map map);
	public List<NoticeDTO> getUserTop(int type);
	public List<NoticeDTO> noticeUserList(Map map);
	public List<NoticeDTO> getUserList(Map map);
	public NoticeDTO getNoticeContent(int noticeidx);
	public int noticeDel(int idx);
}
