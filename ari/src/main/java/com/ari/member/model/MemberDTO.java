package com.ari.member.model;

import java.sql.Date;

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
public class MemberDTO {
	
	private String userid;
	private int usertype;
	private String userbn;
	private String userpwd;
	private String username;
	private String usertel;
	private int useraddr1;
	private String useraddr2;
	private String useraddr3;
	private String usertoken;
	private String userimg;
	private String userstate;
	private int userarea;
	private Date userdate;
	

}
