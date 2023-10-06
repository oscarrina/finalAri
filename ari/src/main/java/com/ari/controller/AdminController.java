package com.ari.controller;

import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.admin.service.AdminService;
import com.ari.member.model.MemberDTO;
import com.ari.member.service.MemberService;
import com.ari.password.PasswordModule;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@RequestMapping("/admin")
	public String admin() {
		return "admin/login/adminLogin";
	}
	
	
	@RequestMapping("/adminLogin")
	public ModelAndView adminLogin(@RequestParam(value = "adminid", defaultValue ="notid" )String adminid,
			@RequestParam(value = "adminpwd")String adminpwd,
			@RequestParam(value =  "autologin", required = false)String autologin,
			HttpSession session,
			HttpServletResponse resp) {
		
		String shapwd=PasswordModule.testSHA256(adminpwd);
		
		int result=0;
		try {
			result=service.adminLogin(adminid, shapwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ModelAndView mav=new ModelAndView();
		if(result==MemberService.NOT_ID || result==MemberService.NOT_PWD) {
			
				mav.addObject("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
				mav.addObject("url", "/admin");
				mav.setViewName("admin/adminMsg");
				System.out.println("아이디랑 비번 틀림");
		}else if(result==MemberService.LOGIN_OK){
			
			if(autologin==null) {
				Cookie ck=new Cookie("saveid", adminid);
				ck.setMaxAge(0);
				resp.addCookie(ck);
				
			}else {
				Cookie ck=new Cookie("saveid", adminid);
				ck.setMaxAge(60*60*24*7);
				resp.addCookie(ck);
			}
			
			mav.setViewName("admin/adminIndex");
			
			session.setAttribute("sid", adminid);
		}else {
			mav.addObject("msg", "[ERROR] 고객 센터로 문의 바랍니다.");
			mav.addObject("url", "/admin");
			mav.setViewName("admin/adminMsg");
			
		}
		
		return mav;
	}
	
	@RequestMapping("/autoAdminLogin")
	public ModelAndView autoLogin(@RequestParam("adminid")String adminid,
			HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/adminIndex");
		
		session.setAttribute("sid", adminid);
			
		return mav;
	}
	
	@RequestMapping("/adminLogout")
	public ModelAndView adminLogout(HttpSession session, HttpServletRequest req,
			HttpServletResponse resp) {
		
		session.invalidate();
		
		Cookie[] cookies = req.getCookies(); 
	    if (cookies != null) { 
	        for (int i = 0; i < cookies.length; i++) {
	            cookies[i].setMaxAge(0); 
	            resp.addCookie(cookies[i]); 
	        }
	    }

		ModelAndView mav=new ModelAndView();
		mav.addObject("msg", "로그아웃 되었습니다");
		mav.addObject("url","/admin");
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	@GetMapping("/adminUser")
	public ModelAndView userManager(@RequestParam("type")int type,
			@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int totalCnt=service.userManagerTotalCnt(type);
		int listSize=10;
		int pageSize=5;
		
		if(session.getAttribute("sid") == null || session.getAttribute("sid").equals("")) {
			mav.setViewName("admin/login/adminLogin");
			return mav;
		}else {
			List<MemberDTO> list = service.userManager(type,cp,listSize);
			String url = "/adminUser?type="+type;
			String pageStr = com.ari.page.PageModuleNotice.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
			if(list == null) {pageStr = "";}
			mav.addObject("pageStr", pageStr);
			mav.addObject("list", list);
			mav.addObject("type", type);
			mav.setViewName("admin/adminUserManager");
		}
		
		return mav;
	}

}
