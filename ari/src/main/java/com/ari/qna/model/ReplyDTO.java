package com.ari.qna.model;

import java.sql.Date;

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

public class ReplyDTO {

	private int replyIdx;
	private String adminId;
	private int qnaIdx;
	private String replyTitle;
	private String replyContent;
	private Date replyDate;
}
