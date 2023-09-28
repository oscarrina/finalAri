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

public class QnaDTO {

	private int qnaIdx;
	private int userIdx;
	private int qnaType;
	private int qnaCategory;
	private int qnaOk;
	private String qnaTitle;
	private String qnaContent;
	private Date qnaDate;
}
