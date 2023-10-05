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
	public ModelAndView fest(@RequestParam(value = "type", defaultValue = "2")int type,
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
		String url="/fest?type="+type+"&area="+area;
		String pageStr=com.ari.page.PageModuleNotice
				.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
		if(lists==null) {pageStr="";}
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.addObject("type", type);
		mav.setViewName("festival/festivalList");
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
			mav.setViewName("redirect:/fest");
		}else {
			mav.addObject("msg", "[ERROR]축제 등록 실패. 문의 바랍니다.");
			mav.addObject("url", "fest?type=2");
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
