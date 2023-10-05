package com.ari.festival.model;

import java.sql.*;

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
public class FestivalDTO {
	
	private int festidx;
	private String festtitle;
	private Date festcreatetime;
	private String festtel;
	private String festtelname;
	private String festhome;
	private int area;
	private int festsigungu;
	private String festaddr;
	private String festcont;
	private int festread;
	private String festimg;
	private String festdate;
	private String festprice;
	private String festcontent;
	private String feststart;
	private String festend;
	private int festapi;
}
