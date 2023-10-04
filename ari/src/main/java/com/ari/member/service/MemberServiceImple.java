package com.ari.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ari.mapper.MemberMapper;
import com.ari.member.model.MemberDTO;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	

	@Override
	public int memberLogin(String userid, String userpwd) throws Exception {
		String pwd=mapper.memberLogin(userid);

		if(pwd==null || pwd.equals("")) {
			return NOT_ID;
		}else{
			if(pwd.equals(userpwd)) {
				return LOGIN_OK;
			}else {
				return NOT_PWD;
			}
		}
	}

	@Override
	public MemberDTO getUserInfo(String userid) throws Exception {
		MemberDTO dto=mapper.getUserInfo(userid);
		return dto;
	}
	
	@Override
	public MemberDTO idFind(String username, String usertel) throws Exception {
		MemberDTO dto=mapper.idFind(username, usertel);
		return dto;
	}
	@Override
	public int idCheck(String userid) throws Exception {
		int result = mapper.idCheck(userid);
		return result;
	}
}
