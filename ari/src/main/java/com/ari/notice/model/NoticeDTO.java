package com.ari.notice.model;

import java.sql.*;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class NoticeDTO {
	
	private int noticeidx;
	private String adminid;
	private int noticetype;
	private String noticetitle;
	private String noticecontent;
	private int noticeread;
	private Date noticedate;
	private int noticetop;
	
	public NoticeDTO(String adminid, int noticetype, String noticetitle, String noticecontent, int noticetop) {
		super();
		this.adminid = adminid;
		this.noticetype = noticetype;
		this.noticetitle = noticetitle;
		this.noticecontent = noticecontent;
		this.noticetop = noticetop;
	}
	
	

}
