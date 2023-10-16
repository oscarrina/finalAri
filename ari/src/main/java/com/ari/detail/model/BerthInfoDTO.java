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
	private String userBN;
	private String userId;
	private String addr;
	private String tel;
	private String infoName;
	private String info;
	private int parking;
	private int berthInfoSeat;
	private int area;
	private int sigungu;
	private String berthInfoStart;
	private String berthInfoEnd;
	private String infoImg;
	private Double reviewScore;
}
