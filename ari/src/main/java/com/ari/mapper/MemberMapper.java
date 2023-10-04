package com.ari.mapper;

import com.ari.member.model.MemberDTO;

public interface MemberMapper {
	
	public String memberLogin(String userid);
	public MemberDTO getUserInfo(String userid);
	public MemberDTO idFind(String username, String usertel);
	public boolean idCheck(String userid);
	public int kakaoCheck(String userid);
	public int kakaoJoin(MemberDTO dto);
	public String kakaoToken(String userid);

}
