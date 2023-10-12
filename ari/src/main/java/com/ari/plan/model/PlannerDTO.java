package com.ari.plan.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PlannerDTO {
	private int plannerIdx;
	private String userID;
	private int plannerType;
	private int plannerDay;
	private int plannerStep;
	private int Idx;
	private int plannerGroup;
	private int plannerImg;
	private int plannerReser;

}
