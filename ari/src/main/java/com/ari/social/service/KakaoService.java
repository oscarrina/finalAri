package com.ari.social.service;

import java.io.IOException;

import org.springframework.stereotype.Service;

import com.ari.member.model.MemberDTO;

@Service
public interface KakaoService {

	public int getUserInfo (String access_Token);
	public String getAccessToken (String authorize_code);
	public int kakaoJoin (MemberDTO dto)throws Exception;
}
