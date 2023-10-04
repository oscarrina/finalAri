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
	public ModelAndView notice(@RequestParam(value = "type", defaultValue = "3")int type,
			@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=0;
		int listSize=0;
		int pageSize=5;
		
		List<NoticeDTO> topLists=null;
		List<NoticeDTO> lists=null;
		if(type==service.admin) {
			if(session.getAttribute("sid")==null || session.getAttribute("sid").equals("")) {
				mav.setViewName("admin/login/adminLogin");
			}else {
				
				try {
					totalCnt=service.totalCntA();
					listSize=10;
						
					lists=service.noticeAllList(cp, listSize);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				mav.setViewName("notice/adminNotice");
			}
		}else {
			try {
				topLists=service.getUserTop(type);
				totalCnt=service.totalCntU(type)-topLists.size();
				listSize=10-topLists.size();
					
				lists=service.noticeUserList(type, cp, listSize);
				
				for(int i=0;i<topLists.size();i++) {
					lists.add(i, topLists.get(i));
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}
		String url="/notice?type="+type;
		String pageStr=com.ari.page.PageModuleNotice
					.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
		mav.addObject("pageStr", pageStr);
		mav.addObject("lists", lists);
		mav.setViewName("notice/adminNotice");
		mav.addObject("type", type);
		return mav;
	}
	@RequestMapping("/not")
	public ModelAndView userNotice(@RequestParam(value = "type", defaultValue = "1")int type,
			@RequestParam(value = "cp", defaultValue = "1")int cp,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		int totalCnt=0;
		int listSize=0;
		int pageSize=5;
		
		List<NoticeDTO> topLists=null;
		List<NoticeDTO> lists=null;
		
			try {
				topLists=service.getUserTop(type);
				totalCnt=service.totalCntU(type)-topLists.size();
				listSize=10-topLists.size();
					
				lists=service.getUserList(type, cp, listSize);
				
				for(int i=0;i<topLists.size();i++) {
					lists.add(i, topLists.get(i));
				}
				
				for(int i=0;i<lists.size();i++) {
					lists.get(i).setNoticecontent(lists.get(i).getNoticecontent().replaceAll("\n", "<br>"));
				}

			} catch (Exception e) {
				// TODO: handle exception
			}
			String url="/not?type="+type;
			String pageStr=com.ari.page.PageModuleNotice
					.makeNoticePage(url, totalCnt, listSize, pageSize, cp);
			mav.addObject("pageStr", pageStr);
			mav.addObject("lists", lists);
			if(type==1) {
				mav.setViewName("notice/userNotice");
			}else {
				mav.setViewName("notice/ceoNotice");
			}
		
		mav.addObject("type", type);


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
			mav.addObject("msg","고정 공지사항을 추가할 수 없습니다. 다시 작성하십시오.");
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
		String msg=result>0?"정상적으로 등록되었습니다.":"등록에 실패하였습니다.";

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
			int temp1=0;
			int temp2=0;
			try {
				temp1=service.checkTopU(1);
				temp2=service.checkTopU(2);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(temp1>=3 || temp2>=3) {
				mav.addObject("msg", "고정 가능한 공지는 3개까지입니다.");
			}else {
				mav.addObject("msg", "0");
			}
		}else {
			try {
				count=service.checkTopU(cate);
				//System.out.println(count);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			if(count>=3) {
				mav.addObject("msg", "고정 가능한 공지는 3개까지입니다.");
			}else {
				mav.addObject("msg", "0");
			}
		}
		
		
		mav.setViewName("notice/topCheckMsg");
		return mav;
	}
	@RequestMapping("/noticeCont")
	public ModelAndView noticeContent(@RequestParam(value = "noticeidx")int noticeidx,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=null;
		try {
			dto=service.getNoticeContent(noticeidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto==null) {
			mav.addObject("msg","삭제된 게시물 혹은 비정상적인 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("admin/adminMsg");
		}else {
			dto.setNoticecontent(dto.getNoticecontent().replaceAll("\n", "<br>"));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 E요일 hh:mm:ss");
			mav.addObject("noticedate", sdf.format(dto.getNoticedate()));
			mav.addObject("dto", dto);
			mav.setViewName("notice/noticeContent");
		}
		return mav;
	}
	@RequestMapping("/noticeDel")
	public ModelAndView noticeDel(@RequestParam(value = "noticeidx", defaultValue = "0")int noticeidx) {
		ModelAndView mav=new ModelAndView();
		int result=0;
		try {
			result=service.noticeDel(noticeidx);
			if(noticeidx==0) {
				result=-1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg=result>0?"공지사항이 삭제되었습니다.":"[ERROR] 삭제 실패.\n 고객센터에 문의해주세요";
		mav.addObject("msg", msg);
		mav.addObject("url", "/notice");
		mav.setViewName("admin/adminMsg");
		return mav;
	}
	@GetMapping("/noticeUpd")
	public ModelAndView noticeUpdate(@RequestParam(value = "noticeidx", defaultValue = "0")int noticeidx, HttpSession session) {
		ModelAndView mav=new ModelAndView();
		NoticeDTO dto=null;
		try {
			dto=service.getNoticeContent(noticeidx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(dto==null) {
			mav.addObject("msg","삭제된 게시물 혹은 비정상적인 접근입니다.");
			mav.addObject("url", "/");
			mav.setViewName("admin/adminMsg");
		}else {
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 E요일 hh:mm");
			mav.addObject("noticedate", sdf.format(dto.getNoticedate()));
			mav.addObject("dto", dto);
			mav.addObject("adminid", session.getAttribute("sid"));
			mav.setViewName("notice/noticeUpdate");
		}
		
		return mav;
	}
	@PostMapping("/noticeUpd")
	public ModelAndView noticeUpdateSubmit(@RequestParam(value = "topcheck",defaultValue = "pass")String topcheck,
			@RequestParam(value = "noticeidx", required = false)int noticeidx,
			@RequestParam(value = "noticetype", defaultValue = "3")int type,
			@RequestParam(value = "noticetitle",defaultValue = "수정한 공지사항입니다.")String title,
			@RequestParam(value = "noticecontent", defaultValue = "공지사항 점검 중입니다.")String content,
			@RequestParam(value = "noticetop", required = false)String ck,
			HttpSession session) {
		ModelAndView mav=new ModelAndView();
		if(topcheck.equals("fail")) {
			mav.addObject("msg","고정 공지사항을 추가할 수 없습니다. 다시 작성하십시오.");
			mav.addObject("url", "notice?type=3");
			mav.setViewName("admin/adminMsg");
			return mav;
		}
		int cknum=0;
		if(ck!=null) {cknum=1;}
		String adminid="";
		adminid=(String) session.getAttribute("sid");
		NoticeDTO dto=new NoticeDTO(noticeidx,adminid, type, title, content, cknum);
		int result=0;
		try {
			result=service.noticeUpd(dto);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String msg=result>0?"정상적으로 수정되었습니다.":"[ERROR]수정에 실패하였습니다.";

		mav.addObject("msg", msg);
		mav.addObject("url", "noticeCont?noticeidx="+noticeidx);
		mav.setViewName("admin/adminMsg");
		
		
		return mav;
	}

}
