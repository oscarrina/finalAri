package com.ari.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.member.model.MemberDTO;
import com.ari.member.service.*;
import com.ari.password.PasswordModule;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	
	@RequestMapping("/memberJoinChoice")
	public String memberJoinChoice() {
		return "memberJoin/memberJoinChoice";
	}
	
	@RequestMapping("/memberJoin")
	public String memberJoin() {
		return "memberJoin/memberJoin";
	}
	
	@GetMapping("/memberLogin")
	public ModelAndView memberLoginForm() {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/memberLogin");
		return mav;
	}

	@PostMapping("/memberLogin")
	public ModelAndView memberLogin(@RequestParam(value = "userid", defaultValue = "notid") String userid,
			@RequestParam(value = "userpwd", required = false) String userpwd,
			@RequestParam(value="autologin", required = false) String autologin,
			HttpSession session,
			HttpServletResponse resp) {
		
		String shapwd=PasswordModule.testSHA256(userpwd);
		
		int result=0;
		try {
			result=service.memberLogin(userid, shapwd);
		} catch (Exception e) {
			result=service.ERROR;
			e.printStackTrace();
		}
		
		ModelAndView mav=new ModelAndView();
		if(result==service.LOGIN_OK){
			
			if(autologin==null) {
				Cookie ck=new Cookie("saveid", userid);
				ck.setMaxAge(0);
				resp.addCookie(ck);
				
			}else {
				Cookie ck=new Cookie("saveid", userid);
				ck.setMaxAge(60*60*24*1);
				resp.addCookie(ck);
			}
			
			MemberDTO dto=null;
			try {
				dto=service.getUserInfo(userid);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(dto.getUserstate().equals("N")) {
				if(dto.getUsertype()==1) {
					//mav.addObject("msg",dto.getUsername()+"님 환영합니다!");
					mav.setViewName("member/memberLoginOk");
				}else {
					mav.setViewName("ceo/ceoIndex");
				}
				session.setAttribute("sid", userid);
				session.setAttribute("sname", dto.getUsername());
			}else {
				mav.addObject("msg", "탈퇴한 회원입니다.");
				mav.addObject("url", "/memberLogin");
				mav.setViewName("member/memberMsg");
			}

			
		}else if(result==service.NOT_ID ||  result==service.NOT_PWD) {
			mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			mav.addObject("url", "/memberLogin");
			mav.setViewName("member/memberMsg");
		}else{
			mav.addObject("msg", "[ERROR] 고객 센터로 문의 바랍니다.");
			mav.addObject("url", "/memberLogin");
			mav.setViewName("member/memberMsg");
		}
		return mav;
	}
	
	@RequestMapping("/autoLogin")
	public ModelAndView autoLogin(@RequestParam("userid")String userid,
			HttpSession session) {
		
		MemberDTO dto=null;
		try {
			dto=service.getUserInfo(userid);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",dto.getUsername()+"님 환영합니다!");
		mav.setViewName("member/memberLoginOk");
		
		session.setAttribute("sid", userid);
		session.setAttribute("sname", dto.getUsername());
			
		return mav;
	}
	
	@RequestMapping("/memberLogout")
	public ModelAndView logout(HttpSession session) {
		
		session.invalidate();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "로그아웃 되었습니다");
		mav.addObject("url","/");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@GetMapping("/idFind")
	public ModelAndView idFindForm() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("member/idFind");
		return mav;
	}
	
	@PostMapping("/idFind")
	public ModelAndView idFind(@RequestParam(value = "username", required = false) String username,
				@RequestParam(value = "usertel", required = false) String usertel) {
		ModelAndView mav=new ModelAndView();
		
		if (username == null || usertel == null) {
	        mav.addObject("msg", "이름 또는 핸드폰번호를 입력하세요.");
	        mav.setViewName("member/memberMsg");
	        return mav;
	    }
		
		MemberDTO dto=null;
		
		try {
			dto=service.idFind(username, usertel);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		System.out.println(username);
		System.out.println(usertel);
		if (dto != null) {
	        mav.addObject("dto", dto);
	        mav.setViewName("member/idFindOk");
	    } else {
	        mav.addObject("msg", "일치하는 정보가 없습니다.");
	        mav.setViewName("member/memberMsg");
	    }
		return mav;
	}
	
	@RequestMapping("/pwdFind1")
	public String pwdFind1() {
		return "member/pwdFind1";
	}
	
	@RequestMapping("/pwdFind2")
	public String pwdFind2() {
		return "member/pwdFind2";
	}
	
	@RequestMapping("/pwdFind3")
	public String pwdFind3() {
		return "member/pwdFind3";
	}
}
