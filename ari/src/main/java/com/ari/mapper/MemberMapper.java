package com.ari.mapper;

import com.ari.member.model.MemberDTO;

public interface MemberMapper {
	
	public String memberLogin(String userid);
	public MemberDTO getUserInfo(String userid);
	public MemberDTO idFind(String username, String usertel);
	public int idCheck(String userid);
	public int kakaoCheck(String userid);
	public int kakaoJoin(MemberDTO dto);
	public int memberJoin(MemberDTO dto);
	public int bnCheck(String userbn);

}
