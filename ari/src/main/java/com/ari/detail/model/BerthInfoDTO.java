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

public class BerthInfoDTO {

	private int idx;
	private String berthInfoAddr;
	private String berthInfoTel;
	private String berthInfoName;
	private String berthInfoInfo;
	private int berthInfoparking;
	private int berthInfoSeat;
	private int berthInfoScore;
	private int area;
	private int berthInfoSigungu;
	private String berthInfoStart;
	private String berthInfoEnd;
	private String berthInfoImg;
}
