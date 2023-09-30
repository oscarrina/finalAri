package com.ari.mapper;

import com.ari.notice.model.NoticeDTO;

public interface NoticeMapper {

	public int noticeAdd(NoticeDTO dto);
	public int checkTopU(int cate);
	public int checkTopA();
}
