package com.ari.admin.service;

import java.util.List;

import com.ari.member.model.MemberDTO;

public interface AdminService {
	
	static final int user=1;
	static final int ceo=2;
	static final int admin=3;
	
	public int adminLogin(String adminid,String adminpwd) throws Exception;
	public List<MemberDTO> userManager(int usertype,int cp,int listSize);
	public int userManagerTotalCnt(int usertype);

}
