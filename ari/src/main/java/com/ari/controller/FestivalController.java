package com.ari.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ari.festival.model.FestivalDTO;

@Controller
public class FestivalController {
	
	@RequestMapping("/fest")
	public ModelAndView fest(@RequestParam(value = "type", defaultValue = "2")int type,HttpSession session) {
		ModelAndView mav=new ModelAndView();
		if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
			mav.addObject("msg","비정상적인 접근입니다. 고객 센터에 문의해주세요.");
			mav.addObject("url", "admin");
			mav.setViewName("admin/adminMsg");
			return mav;
		}
		File f=new File("c:/student_java/upload");
		File files[]=f.listFiles();
		mav.addObject("files", files);
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
		copyInto(upload);
		ModelAndView mav=new ModelAndView();
		
		mav.setViewName("festival/festivalList");
		return mav;
	}
	
	public void copyInto(MultipartFile upload) {
		
		System.out.println("올린파일명:"+upload.getOriginalFilename());
		
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
