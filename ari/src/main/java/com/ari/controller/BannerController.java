package com.ari.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.security.Provider.Service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.Banner;
import org.springframework.boot.ImageBanner;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.json.ByteSourceJsonBootstrapper;
import java.io.*;

import com.ari.banner.model.BannerDTO;
import com.ari.banner.service.BannerService;

@Controller
public class BannerController {

	@Autowired
	private BannerService service;

	
	@RequestMapping("/banner/bannerList")
	public List<BannerDTO> bannerList() {
		List<BannerDTO> lists=null;
		try {
			lists=service.bannerList();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return lists;
	}
	
	
	@GetMapping("/bannerUpload")
	public String bannerUploadForm(ModelMap map) {
		
		File f=new File("c:/student_java/upload/");
		File files[]=f.listFiles();
		map.addAttribute("files", files);
		
		return "banner/bannerUpload";
	}
	
	@PostMapping("/bannerUpload")
	public String bannerUpload(
			@RequestParam("bannerName")String bannerName,
			@RequestParam("bannerImg")MultipartFile bannerImg) {
		
		copyInto(bannerName, bannerImg);
		
		return "banner/bannerUpload";
	}
	
	public void copyInto(String bannerName, MultipartFile bannerImg) {
		
		File f=new File("c:/student_java/upload/"+bannerImg.getOriginalFilename());
		
		try {
			byte[] bytes=bannerImg.getBytes();
			
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
