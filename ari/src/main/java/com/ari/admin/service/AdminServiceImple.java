package com.ari.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.AdminMapper;
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
}
