package com.ari.review.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class ReviewDTO {

	private int reviewIdx;
	private String userId;
	private int berthIdx;
	private String reviewContent;
	private Date reviewDate;
	private int reviewScore;
	private String reviewImg;
}
