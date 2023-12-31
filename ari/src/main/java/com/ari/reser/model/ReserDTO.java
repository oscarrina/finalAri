package com.ari.reser.model;

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
public class ReserDTO {

	private int reserIdx;
	private int idx;
	private int berthIdx;
	private String userId;
	private String reserName;
	private String reserVisitStart;
	private String reserVisitEnd;
	private int reserPrice;
	private Date reserPriceDay;
	private int reserPayState;
	private String reserTel;
	private int reserState;
	private String reserReview;
	private String reserPaymentKey; //결제 키
	private String berthInfoImg; //숙박 타이틀 이미지
	private String berthInfoName; //숙박 업체 이름
	private String berthName; //객실 명
	private String berthInfoStart; //입실 시간
	private String berthInfoEnd; //퇴실 시간
	private String reserVisit; //숙박일
}
