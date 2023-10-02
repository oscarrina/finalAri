package com.ari.mapper;

import com.ari.member.model.MemberDTO;

public interface MemberMapper {
	
	public String memberLogin(String userid);
	public MemberDTO getUserInfo(String userid);
	public MemberDTO idFind(String username, String usertel);

}
