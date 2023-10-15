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
		
		int result=0;
		try {
			result=service.reviewContent(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(result>0) {
			mav.addObject("userid", userid);
			mav.setViewName("redirect:myReviewWrite");
		}else {
			mav.addObject("msg", "리뷰 등록 실패");
			mav.addObject("url", "myReviewWrite");
			mav.setViewName("msg");
		}
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
	public ModelAndView reviewDel(@RequestParam("reviewIdx") int reviewIdx) {
		ModelAndView mav=new ModelAndView();
		int result=0;
		try {
			ReviewDTO dto = new ReviewDTO();
		    dto.setReviewIdx(reviewIdx);
			result=service.reviewDel(dto);
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
