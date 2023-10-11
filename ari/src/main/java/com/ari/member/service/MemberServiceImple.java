package com.ari.member.service;

import java.util.List;

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
	public MemberDTO pwdFind1(String userid) throws Exception {
		MemberDTO dto=mapper.pwdFind1(userid);
		return dto;
	}
	
	@Override
	public MemberDTO pwdFind2(String username, String usertel) throws Exception {
		MemberDTO dto=mapper.pwdFind2(username, usertel);
		return dto;
	}
	
	@Override
	public int pwdFind3(MemberDTO dto) throws Exception {
	    int result = mapper.pwdFind3(dto);
	    return result;
	}
	
	@Override
	public int idCheck(String userid) throws Exception {
		int result = mapper.idCheck(userid);
		return result;
	}
	@Override
	public int memberJoin(MemberDTO dto)throws Exception{
		int result = mapper.memberJoin(dto);
		return result;
	}
	@Override
	public int bnCheck(String userbn){
		int result = mapper.idCheck(userbn);
		return result;
	}
}
