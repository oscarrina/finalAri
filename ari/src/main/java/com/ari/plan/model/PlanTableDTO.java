package com.ari.plan.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PlanTableDTO {
	private int planIdx;
	private String userID;
	private Date planDate;
	private int planGroup;
	private String planStart;
	private String planEnd;
	private String planBigImg;
	private int planPoint;
}
