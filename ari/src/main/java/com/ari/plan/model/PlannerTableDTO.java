package com.ari.plan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlannerTableDTO {
	private int plannerIdx;
	private String userID;
	private String plannerName;
	private int plannerType;
	private int plannerDay;
	private int plannerStep;
	private int Idx;
	private int plannerGroup;
	private String plannerImg;
	private int plannerReser;
}
