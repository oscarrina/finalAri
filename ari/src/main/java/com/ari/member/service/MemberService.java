package com.ari.member.service;

import java.util.List;

import com.ari.member.model.*;

public interface MemberService {
	
	int NOT_ID=1;
	int NOT_PWD=2;
	int LOGIN_OK=3;
	int ERROR=-1;
	
	public int memberLogin(String userid,String userpwd) throws Exception;
	public MemberDTO getUserInfo(String userid)throws Exception;
	public MemberDTO idFind(String username,String usertel)throws Exception;
	public MemberDTO pwdFind1(String userid)throws Exception;
	public MemberDTO pwdFind2(String username,String usertel)throws Exception;
	public int pwdFind3(MemberDTO dto)throws Exception;
	public int idCheck(String userid)throws Exception;
	public int memberJoin(MemberDTO dto)throws Exception;
	public int bnCheck(String userbn);
	public int userUpdate(MemberDTO dto)throws Exception;
	public int ceoUpdate(MemberDTO dto)throws Exception;

}
