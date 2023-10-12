package com.ari.controller;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ari.page.PageModuleNotice;
import com.ari.qna.model.QnaDTO;
import com.ari.qna.model.ReplyDTO;
import com.ari.qna.service.QnaService;
import java.util.*;

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
		mav.addObject("url","myQna");
		mav.setViewName("member/memberMsg");
		return mav;
		
	}
	
	@RequestMapping("/ceoWriteQForm")
	public ModelAndView ceowriteQForm(HttpSession session) {
    ModelAndView mav=new ModelAndView();
		
		if(session.getAttribute("sid")==null) {
			mav.setViewName("member/memberLogin");
		}else {
			mav.setViewName("qna/ceoWriteQForm");
		}
		
		return mav;
	}
	
	@RequestMapping("/ceoWriteQ")
	public ModelAndView ceoWriteQ(QnaDTO dto,HttpSession session) {
		dto.setUserId((String) session.getAttribute("sid"));
		int result=0;
		
		try {
			result=service.ceoQnaWrite(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String msg=result>0?"문의가 등록되었습니다. 문의 내역은 '나의문의'에서 확인하여 주세요.":"문의 등록에 실패하였습니다. 자세한 사항은 고객센터로 전화주세요.";
		ModelAndView mav=new ModelAndView();
		mav.addObject("msg",msg);
		mav.addObject("url","ceo");
		mav.setViewName("member/memberMsg");
		return mav;
	}
	
	@RequestMapping("/ceoQnaList")
	public ModelAndView ceoQnaList(HttpSession session,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		
		String sid=(String) session.getAttribute("sid");
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=0;
		int listSize=10;
		int pageSize=5;
		List<QnaDTO> lists=null;
		
		try {
			lists=service.QnaList(sid);
			totalCnt=service.totalCnt();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String pageStr=PageModuleNotice.makeNoticePage("ceoQnaList", totalCnt, listSize, pageSize, cp);
		
		mav.setViewName("qna/ceoQnaList");
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists",lists);
		return mav;
	}
	
	@RequestMapping("/ceoQnaDetail")
	public ModelAndView ceoQnaDetail(@RequestParam("qnaIdx")int qnaIdx) {
		
		List<QnaDTO> lists=null;
		List<ReplyDTO> list=null;
		
		HashMap<Integer,String> map=new HashMap<Integer,String>();
		map.put(1, "이용문의");
		map.put(2, "제휴관련");
		map.put(3, "사업자정보");
		map.put(4, "기타");
		try {
			lists=service.QnaDetail(qnaIdx);
			list=service.replyList(qnaIdx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("reply",list);
		mav.addObject("cate",map);
		mav.setViewName("qna/ceoQnaDetail");
		return mav;
		
	}
	
	@RequestMapping("/myQna")
	public ModelAndView QnaList(HttpSession session,
		@RequestParam(value = "cp", defaultValue = "1")int cp) {
		String sid=(String) session.getAttribute("sid");
		
		ModelAndView mav=new ModelAndView();
		
		int totalCnt=0;
		int listSize=10;
		int pageSize=5;
		List<QnaDTO> lists=null;
		
		try {
			lists=service.QnaList(sid);
			totalCnt=service.totalCnt();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String pageStr=PageModuleNotice.makeNoticePage("myQna", totalCnt, listSize, pageSize, cp);
		
		mav.setViewName("mypage/myQna");
		mav.addObject("pageStr",pageStr);
		mav.addObject("lists",lists);
		return mav;
	}
	
	@RequestMapping("myQnaDetail")
	public ModelAndView QnaDetail(@RequestParam("qnaIdx")int qnaIdx) {
		
		List<QnaDTO> lists=null;
		List<ReplyDTO> list=null;
		
		try {
			lists=service.QnaDetail(qnaIdx);
			list=service.replyList(qnaIdx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		HashMap<Integer,String> map=new HashMap<Integer,String>();
		map.put(1, "예약/결제");
		map.put(2, "취소/환불");
		map.put(3, "이용문의");
		map.put(4, "회원정보");
		map.put(5, "기타");
		
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("lists",lists);
		mav.addObject("reply",list);
		mav.addObject("cate",map);
		mav.setViewName("mypage/myQnaDetail");
		return mav;

	}
}
