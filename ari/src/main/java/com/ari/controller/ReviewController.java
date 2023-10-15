package com.ari.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ari.banner.model.BannerDTO;
import com.ari.reser.model.ReserDTO;
import com.ari.review.model.ReviewDTO;
import com.ari.review.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("/reviewContent")
	public ModelAndView reviewContent(
			@RequestParam(value = "reseridx")int reseridx) {
		ModelAndView mav=new ModelAndView();
		
		int berthidx=0;
		try {
			System.out.println(reseridx);
			berthidx=service.getBerthidx(reseridx);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("aaa:"+reseridx);
		mav.addObject("reseridx", reseridx);
		mav.addObject("berthidx", berthidx);
		System.out.println(berthidx);
		mav.setViewName("mypage/reviewContent");
		return mav;
	}
	
	@PostMapping("/reviewContent")
	public ModelAndView reviewContent(ReviewDTO dto,
			@RequestParam(value = "review",	required = false)MultipartFile review,
			HttpSession session,HttpServletRequest req,
			@RequestParam("berthidx")int berthidx,
			@RequestParam("reseridx")int reseridx
			) {
		ModelAndView mav=new ModelAndView();
		copyInto(review);
		dto.setReviewImg(review.getOriginalFilename());
		session=req.getSession();
		String userid=(String)session.getAttribute("sid");
		dto.setUserId(userid);
		dto.setBerthIdx(berthidx);
		dto.setReserIdx(reseridx);
		
		
		int result=0;
		try {
			result=service.reviewContent(dto);
			ReserDTO reserDTO = new ReserDTO();
            reserDTO.setUserId(userid);
            reserDTO.setBerthIdx(berthidx);
            reserDTO.setReserIdx(reseridx);
            service.reserReviewUpdate(reserDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:myReview");
		}else {
			mav.addObject("msg", "리뷰 등록 실패");
			mav.addObject("url", "myReviewWrite");
			mav.setViewName("msg");
		}
		System.out.println("bbb:"+reseridx);
		System.out.println("아이디"+userid);
		return mav;
	}
	
	public void copyInto(MultipartFile review) {
		
		File f=new File("c:/student_java/upload/"+review.getOriginalFilename());
		
		try {
			byte[] bytes=review.getBytes();
			
			FileOutputStream fos=new FileOutputStream(f);
			fos.write(bytes);
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@PostMapping("/reviewDel")
	@ResponseBody
	public ModelAndView reviewDel(@RequestParam("reseridx")int reseridx) {
		ModelAndView mav=new ModelAndView();
		ReviewDTO dto = new ReviewDTO();
		dto.setReserIdx(reseridx);
		System.out.println("ccc"+reseridx);
		
		int result=0;
		try {
		    dto.setReserIdx(reseridx);
			result=service.reviewDel(dto);
			ReserDTO reserDTO = new ReserDTO();
			reserDTO.setReserIdx(reseridx);
            service.reserReviewDel(reserDTO);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.addObject("msg", "리뷰삭제 성공");
			mav.addObject("url", "myReview");
			mav.setViewName("msg");
		}else {
			mav.addObject("msg", "리뷰삭제 실패");
			mav.addObject("url", "myReview");
			mav.setViewName("msg");
		}
		return mav;
	}
}
