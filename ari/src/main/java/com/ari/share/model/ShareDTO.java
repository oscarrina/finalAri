package com.ari.share.model;

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
public class ShareDTO {

	private int idx;
	private String userid;
	private int palnidx;
	private String shareTitle;
	private String sharecontent;
	private Date shareDate;
	private int shareRead;
	private int shareLike;
	
}
