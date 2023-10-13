package com.ari.controller;

import java.io.File;
import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.*;

import com.ari.banner.model.BannerDTO;
import com.ari.banner.service.BannerService;

@Controller
public class BannerController {

	@Autowired
	private BannerService service;
	
	
	@RequestMapping("/bannerList")
	public ModelAndView bannerList() {
		ModelAndView mav=new ModelAndView();
		File f=new File("c:/student_java/upload/");
		File files[]=f.listFiles();
		mav.addObject("files", files);
		List<BannerDTO> lists=null;
		try {
			lists=service.bannerList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("lists", lists);
		mav.setViewName("banner/bannerList");
		return mav;
	}
	
	@GetMapping("/bannerUpload")
	public String bannerUploadForm(ModelMap map) {
		return "banner/bannerUpload";
	}
	
	@PostMapping("/bannerUpload")
	public ModelAndView bannerUpload(
			@RequestParam("banner")MultipartFile banner,
			BannerDTO dto) {
		
		ModelAndView mav=new ModelAndView();
		copyInto(banner);
		dto.setBannerImg(banner.getOriginalFilename());
		int result=0;
		try {
			result=service.bannerUpload(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.setViewName("redirect:bannerList");
		}else {
			mav.addObject("msg", "배너 등록 실패");
			mav.setViewName("banner/bannerMsg");
		}
		return mav;
	}
	
	public void copyInto(MultipartFile banner) {
		
		File f=new File("c:/student_java/upload/"+banner.getOriginalFilename());
		
		try {
			byte[] bytes=banner.getBytes();
			
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@PostMapping("/bannerDel")
	@ResponseBody
	public ModelAndView bannerDel(@RequestParam("bannerIdx") int bannerIdx) {
		ModelAndView mav=new ModelAndView();
		int result=0;
		try {
			BannerDTO dto = new BannerDTO();
		    dto.setBannerIdx(bannerIdx);
			result=service.bannerDel(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg=result>0?"배너삭제 성공":"배너 삭제 실패";
		mav.addObject("msg", msg);
		mav.setViewName("banner/bannerMsg");
		return mav;
	}
}
