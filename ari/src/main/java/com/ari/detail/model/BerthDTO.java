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
	private int Idx;
	private String berthName;
	private int berthCount;
	private int berthSize;
	private int berthMax;
	private int berthPrice;
	private String berthTv;
	private String berthDry;
	private String berthRefri;
	private String berthInternet;
	private String berthImg;
}