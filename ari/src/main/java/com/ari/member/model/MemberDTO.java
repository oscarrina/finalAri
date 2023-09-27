package com.ari.member.model;

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
	
	private int idx;
	private int usertype;
	private String userbn;
	private String userid;
	private String userpwd;
	private String username;
	private String usertel;
	private String useraddr;
	private String userprofile;
	private String usertoken;
	private String userstate;
	

}
