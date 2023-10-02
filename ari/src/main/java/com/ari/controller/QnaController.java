package com.ari.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ari.qna.model.QnaDTO;
import com.ari.qna.service.QnaService;

@Controller
public class QnaController {

	@Autowired
	private QnaService service;
	
	@RequestMapping("/writeQForm")
	public ModelAndView writeQForm(HttpSession session) {
		
		ModelAndView mav=new ModelAndView();
		
		if(session.getAttribute("sid")==null) {
			mav.setViewName("member/memberLogin");
		}else {
			mav.setViewName("qna/writeQForm");
		}
		
		return mav;
		
	}
	
	@RequestMapping("/writeQ")
	public ModelAndView writeQ(QnaDTO dto,HttpSession session) {
		
		dto.setUserId((String) session.getAttribute("sid"));
		
		int result=0;
		
		try {
			result=service.qnaWrite(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg=result>0?"문의가 등록되었습니다. 문의 내역은 마이페이지에서 확인하여 주세요.":"문의 등록에 실패하였습니다. 자세한 사항은 고객센터로 전화주세요.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("where","/");
		mav.setViewName("qna/qnaMsg");
		return mav;
		
	}
}
