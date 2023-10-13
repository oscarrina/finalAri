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
public class TestDTO {

	private String berthName;
    private int berthPrice;
    private String berthInfoStart;
    private String berthInfoEnd;
    private String berthInfoName;
	private String ReserVisitStart;
	private String ReserVisitEnd;
}
