package com.ari.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ari.member.model.MemberDTO;
import com.ari.member.service.*;
import com.ari.password.PasswordModule;
import com.ari.sms.service.SmsService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private SmsService smsservice;
	
	@RequestMapping("/memberJoinChoice")
	public String memberJoinChoice() {
		return "member/memberJoinChoice";
	}
	
	@RequestMapping("/memberJoin")
	public ModelAndView memberJoin(@RequestParam(value="userType")int userType) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("userType",userType);
		mav.setViewName("member/memberJoin");
		return mav;
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
					session.setAttribute("suserArea", dto.getUserarea());
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
		if(dto.getUsertype()==2) {
			session.setAttribute("suserArea", dto.getUserarea());
		}
		session.setAttribute("sid", userid);
		session.setAttribute("sname", dto.getUsername());
			
		return mav;
	}
	
	@RequestMapping("/memberLogout")
	public ModelAndView logout(HttpSession session) {
		
		session.invalidate();
//		String access_Token = (String)session.getAttribute("access_Token");
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("Authorization", "Bearer "+ access_Token);
		
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
	
	@GetMapping("/idCheck")
	public ModelAndView idCheck(@RequestParam(value = "userid", required=false)String userid) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.idCheck(userid);
			String msg = result>=1?"중복된 아이디 입니다.":"사용가능한 아이디 입니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/idCheck_ok");
		} catch (Exception e) {
		}
		return mav;
	}
	
	@PostMapping("/sendNum")
	public ModelAndView sendNum(@RequestParam(value = "tel", required = false)String tel){
		ModelAndView mav = new ModelAndView();
		System.out.println(tel);
		String ranNum = "111111";
		//String ranNum = smsservice.sendRandomMessage(tel);
		mav.addObject("msg",ranNum);
		mav.setViewName("member/idCheck_ok");
		return mav;
	}
	@GetMapping("/bnCheck")
	public ModelAndView bnCheck(@RequestParam(value = "userbn", required=false)String userbn) {
		ModelAndView mav = new ModelAndView();
		try {
			int result = service.idCheck(userbn);
			String msg = result>=1?"이미 존재하는 번호 입니다.":"사용가능한 번호 입니다.";
			mav.addObject("msg", msg);
			mav.setViewName("member/idCheck_ok");
		} catch (Exception e) {
		}
		return mav;
	}
	@PostMapping("/memberJoin")
    public ModelAndView memberJoin(MemberDTO dto)throws Exception {
		String shapwd = PasswordModule.testSHA256(dto.getUserpwd());
		dto.setUserpwd(shapwd);
    	int result = 0;
    	try {
			result = service.memberJoin(dto);
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
