package com.ari.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ari.member.model.MemberDTO;
import com.ari.member.service.MemberService;
import com.ari.social.service.KakaoService;

@Controller
public class KakaoController {

	@Autowired
	private KakaoService kakao;
	@Autowired
	private MemberService service;
	
    @GetMapping("/oauth/kakao")
    public ModelAndView login(@RequestParam("code") String code, HttpSession session) {
    	ModelAndView mav = new ModelAndView();
    	
        String access_Token = kakao.getAccessToken(code);
        int userInfo = kakao.getUserInfo(access_Token);
        String userid = (String)session.getAttribute("userid");
        
        MemberDTO dto= null;
        
        try {
			dto = service.getUserInfo(userid);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        if(userInfo == 0) {
        	mav.setViewName("member/kakaoJoin");
        }else if(userInfo == 1) {
        	session.setAttribute("sid", userid);
    		session.setAttribute("sname", dto.getUsername());
        	mav.addObject("msg", dto.getUsername()+"님 환영합니다.");
        	mav.addObject("url", "/");
        	mav.setViewName("member/memberMsg");
        }
        return mav;
    }
    
    @PostMapping("/oauth/kakaoJoin")
    public ModelAndView kakaoJoin(MemberDTO dto) {
    	int result = 0;
    	try {
			result = kakao.kakaoJoin(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
    	String msg = result > 0 ? "회원가입 완료":"회원가입 실패";
    	ModelAndView mav = new ModelAndView();
    	mav.addObject("msg", msg);
    	mav.addObject("url", "/");
    	mav.setViewName("member/memberMsg");
    	return mav;
    	
    }
}
