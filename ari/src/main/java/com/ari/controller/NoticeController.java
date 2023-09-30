package com.ari.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.notice.model.NoticeDTO;
import com.ari.notice.service.NoticeService;

import java.util.*;

import javax.servlet.http.HttpSession;

import java.text.*;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	@RequestMapping("/notice")
	public String notice(@RequestParam(value = "type", defaultValue = "1")int type, HttpSession session) {
		if(type==service.admin) {
			if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
				return "admin/login/adminLogin";
			}
			return "notice/adminNotice";
		}else if(type==service.ceo) {
			return "notice/ceoNotice";
		}else {
			return "notice/userNotice";
		}
	}
	
	@RequestMapping("/cateList")
	public ModelAndView cateList(@RequestParam(value = "cate",defaultValue = "3")int cate) {
		
		String str="<notices><notice><title>제목</title><content>내용</content><cate>"+cate+"</cate></notice></notices>";
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists", str);
		mav.setViewName("notice/cateList");
		return mav;
	}
	
	@GetMapping("/noticeAdd")
	public ModelAndView noticeAddForm(HttpSession session) {
		
		Date now=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd E요일");
		String date=sdf.format(now);
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("adminid", session.getAttribute("sid"));
		mav.addObject("date", date);
		mav.setViewName("notice/noticeAdd");		
		return mav;
	}
	
	@PostMapping("/noticeAdd")
	public ModelAndView noticeAddSubmit(@RequestParam(value = "topcheck",defaultValue = "pass")String topcheck,
			@RequestParam(value = "adminid",defaultValue = "admin")String adminid,
			@RequestParam(value = "noticetype", defaultValue = "3")int type,
			@RequestParam(value = "noticetitle",defaultValue = "새로운 공지사항입니다.")String title,
			@RequestParam(value = "noticecontent", defaultValue = "공지사항 점검 중입니다.")String content,
			@RequestParam(value = "noticetop", required = false)String ck) {
		ModelAndView mav=new ModelAndView();
		if(topcheck.equals("fail")) {
			mav.addObject("msg","고정 공지사항을 추가할 수 없습니다.\n다시 작성하십시오.");
			mav.addObject("url", "notice?type=3");
			mav.setViewName("admin/adminMsg");
			return mav;
		}
		int cknum=0;
		if(ck!=null) {cknum=1;}
		NoticeDTO dto=new NoticeDTO(adminid, type, title, content, cknum);
		
		int result=0;
		try {
			result=service.noticeAdd(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg=result>0?"공지사항이 정상적으로 등록되었습니다.":"공지사항 등록에 실패하였습니다.";

		mav.addObject("msg", msg);
		mav.addObject("url", "notice?type=3");
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	
	@RequestMapping("/topCheck")
	public ModelAndView topCheck(@RequestParam(value = "cate", defaultValue = "3")int cate) {
		ModelAndView mav=new ModelAndView();
		int count=0;
		if(cate==3) {
			try {
				count=service.CheckTopA();
				System.out.println(count);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(count==6) {
				mav.addObject("msg", "*고정 가능한 공지는 총 6개까지입니다.");
			}else {
				mav.addObject("msg", "0");
			}
		}else {
			try {
				count=service.checkTopU(cate);
				System.out.println(count);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(count==3) {
				mav.addObject("msg", "*고정 가능한 공지는 3개까지입니다.");
			}else {
				mav.addObject("msg", "0");
			}
		}
		
		
		mav.setViewName("notice/topCheckMsg");
		return mav;
	}

}
