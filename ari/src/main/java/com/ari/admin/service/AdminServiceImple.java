package com.ari.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.AdminMapper;
import com.ari.member.model.MemberDTO;
import com.ari.member.service.MemberService;

@Service
public class AdminServiceImple implements AdminService {

	@Autowired
	private AdminMapper mapper;
	
	@Override
	public int adminLogin(String adminid, String adminpwd) throws Exception {
		String pwd=mapper.adminLogin(adminid);
		
		if(pwd==null || pwd.equals("")) {
			return MemberService.NOT_ID;
		}else {
			if(pwd.equals(adminpwd)) {
				return MemberService.LOGIN_OK;
			}else {
				return MemberService.NOT_PWD;
			}
		}
	}
	@Override
	public List<MemberDTO> userManager(int usertype,int cp,int listSize) {
		int start=(cp-1)*listSize+1;
		int end=cp*listSize;
		Map map=new HashMap();
		map.put("usertype", usertype);
		map.put("start", start);
		map.put("end", end);
		List<MemberDTO> list = mapper.userManager(map);
		return list;
	}
	@Override
	public int userManagerTotalCnt(int usertype) {
		int result = mapper.userManagerTotalCnt(usertype);
		return result;
	}
	
}
