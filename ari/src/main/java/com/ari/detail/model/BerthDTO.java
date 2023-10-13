package com.ari.detail.model;

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
public class BerthDTO {
	private int berthIdx;
	private int idx;
	private String berthName;
	private int berthSize;
	private int berthMax;
	private int berthPrice;
	private int berthTv;
	private int berthDry;
	private int berthRefri;
	private int berthInternet;
	private int reserState;
	private String berthImg;
	private String startDate;
	private String endDate;
	
}