package com.ari.mapper;


import java.util.List;
import java.util.Map;

import com.ari.member.model.MemberDTO;

public interface AdminMapper {

	public String adminLogin(String adminid);
	public List<MemberDTO> userManager(Map map);
	public int userManagerTotalCnt(int usertype);
}
