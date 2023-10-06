package com.ari.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.http.HttpRequest;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ari.festival.model.FestivalDTO;
import com.ari.festival.service.FestivalService;

@Controller
public class FestivalController {
	
	@Autowired
	private FestivalService service;
	
	@RequestMapping("/fest")
	public ModelAndView fest(
			HttpSession session,
			@RequestParam(value = "area", defaultValue = "0")int area,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
			mav.setViewName("admin/login/adminLogin");
			return mav;
		}
		int totalCnt=0;
		int listSize=5;
		int pageSize=5;
		
		List<FestivalDTO> lists=null;
		try {
			if(area==0) { //전체
				totalCnt=service.totalCnt();
				lists=service.festList(cp, listSize);
				
			}else {
				totalCnt=service.totalCntArea(area);
				lists=service.festListArea(area, cp, listSize);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		String url="/fest?area="+area;
		String pageStr=com.ari.page.PageModuleNotice
				.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
		if(lists==null) {pageStr="";}
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("area", area);
		mav.setViewName("festival/festivalList");
		return mav;
	}
	@RequestMapping("/festival")
	public ModelAndView ceofest(
			HttpSession session,
			@RequestParam(value = "type", defaultValue = "1")int type,
			@RequestParam(value = "cp", defaultValue = "1")int cp) {
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("suserArea")==null || session.getAttribute("suserArea").equals("")) {
			mav.setViewName("member/memberLogin");
			return mav;
		}
//		int area=(int) session.getAttribute("suserArea");
		int area=6;
		int totalCnt=0;
		int listSize=5;
		int pageSize=5;
		
		List<FestivalDTO> lists=null;
		try {
			if(type==1) { //최신등록순
				totalCnt=service.totalCntArea(area);
				lists=service.festListArea(area, cp, listSize);
			}else { //제목순
				totalCnt=service.totalCntArea(area);
				lists=service.festListAreaTitleDesc(area, cp, listSize);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		String url="/fest?type="+type;
		String pageStr=com.ari.page.PageModuleNotice
				.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
		if(lists==null) {pageStr="";}
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		
		mav.setViewName("festival/ceoFestivalList");
		return mav;
	}
	
	
	@GetMapping("/festAdd")
	public ModelAndView festAdd() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("festival/festivalAdd");
		return mav;
	}
	@PostMapping("/festAdd")
	public ModelAndView festAddSubmit(FestivalDTO dto,
			@RequestParam("upload")MultipartFile upload,
			HttpServletRequest request) {
		ModelAndView mav=new ModelAndView();
		copyInto(upload);
		dto.setFestimg(upload.getOriginalFilename());
		
		int result=0;
		try {
			result=service.festAdd(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.setViewName("redirect:/festival");
		}else {
			mav.addObject("msg", "[ERROR]축제 등록 실패. 문의 바랍니다.");
			mav.addObject("url", "festival");
			mav.setViewName("admin/adminMsg");
		}
		return mav;
	}
	@RequestMapping("/festCont")
	public ModelAndView festContent(
			@RequestParam(value = "festidx", defaultValue = "0")int festidx,
			@RequestParam(value = "type", defaultValue = "2")int type) {//2-사업자 / 3-관리자
		ModelAndView mav=new ModelAndView();
		FestivalDTO dto=null;
		try {
			dto=service.festContent(festidx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(dto==null) {
			mav.addObject("msg", "[ERROR]삭제된 게시물이거나 비정상적인 접근입니다.");
			mav.addObject("url", "festival");
			mav.setViewName("admin/adminMsg");
		}
		dto.setFestcont(dto.getFestcont().replaceAll("\n", "<br>"));
		dto.setFestcontent(dto.getFestcontent().replaceAll("\n", "<br>"));
		mav.addObject("dto", dto);
		mav.setViewName("festival/festCont");
		mav.addObject("type", type);
		return mav;
	}
	@RequestMapping("/festDel")
	public ModelAndView festDel(@RequestParam(value = "festidx", defaultValue = "0")int festidx,
			@RequestParam(value = "type", defaultValue = "2")int type) {
		ModelAndView mav=new ModelAndView();
		int result=0;
		try {
			result=service.festDel(festidx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			if(type==2) {
				mav.setViewName("redirect:/festival"); //사업자
			}else {
				mav.setViewName("redirect:/fest"); //관리자
			}
		}else {
			mav.addObject("msg", "[ERROR]축제 삭제 실패");
			if(type==2) {
				mav.addObject("url", "festival");
			}else {
				mav.addObject("url", "fest");
			}
			mav.setViewName("admin/adminMsg");
		}

		return mav;
	}
	
	
	public void copyInto(MultipartFile upload) {
		File f=new File("c:/student_java/upload/"+upload.getOriginalFilename());
		
		try {
			byte[] bytes=upload.getBytes(); //원본을 byte 단위로 다 가져오는 것
			
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	@RequestMapping("/getArea")
	public String getAreacode() {
		return "festival/getAreacodeXML";
	}
	

}
