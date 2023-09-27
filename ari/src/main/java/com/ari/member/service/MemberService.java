package com.ari.member.service;

import com.ari.member.model.*;

public interface MemberService {
	
	int NOT_ID=1;
	int NOT_PWD=2;
	int LOGIN_OK=3;
	int ERROR=-1;
	
	public int memberLogin(String userid,String userpwd) throws Exception;
	public MemberDTO getUserInfo(String userid)throws Exception;

}
