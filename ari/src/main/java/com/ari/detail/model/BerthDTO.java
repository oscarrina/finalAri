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
	private int berthPlace;
	private int berthTV;
	private int berthDry;
	private int Refri;
	private int berthInternet;
	private String berthImg;
	private String berthStart;
	private String berthEnd;
	
}