package com.myspring.momeche001.board.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.board.service.NoticeBoardService;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.member.vo.MemberVO;

@Controller("noticeboardController")
public class NoticeBoardControllerImpl implements NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeboardService;
	@Autowired
	private NoticeVO noticeVO;

	
	@Override
	@RequestMapping(value = "/board/listNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = (String)request.getAttribute("viewName");
		List noticeList = noticeboardService.listNotice();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("noticeList", noticeList);
		return mav;
	
	}
	
	// 공지사항 등록
	
	@Override
	@RequestMapping(value="/board/addNewNoticeArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewNoticeArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> noticeMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			noticeMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getMb_id();
		noticeMap.put("mb_id", id);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int qna_num = noticeboardService.addNewNoticeArticle(noticeMap);
			
	
			message = "<script>";
			message += " alert('공지사항 등록 성공');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listNotice.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			
			message = " <script>";
			message +=" alert('공지사항 등록 실패');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/notice_articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	// 공지사항 보기
	@Override
	@RequestMapping(value = "/board/viewNoticeArticle.do",method = RequestMethod.GET)
	public ModelAndView viewNoticeArticle(@RequestParam("notice_num")int notice_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		noticeVO =noticeboardService.viewNoticeArticle(notice_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("notice", noticeVO);
		return mav;
	}
	
	
	// 공지사항 삭제
	@Override
	  @RequestMapping(value="/board/removeNoticeArticle.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity removeNoticeArticle(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
	 	response.setContentType("text/html; charset=UTF-8");
	 	String message;
	 	ResponseEntity resEnt=null;
	 	HttpHeaders responseHeaders = new HttpHeaders();
	 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 	
	 	try {
	 		noticeboardService.removeNoticeArticle(notice_num);
	 	
	 		message = "<script>";
	 		message += " alert('공지사항 삭제 성공');";
	 		message += " location.href='"+request.getContextPath()+"/board/listNotice.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 	 
	 	}catch(Exception e) {
	 		message = "<script>";
	 		message += " alert('공지사항 삭제 실패');";
	 		message += " location.href='"+request.getContextPath()+"/board/listNotice.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 		
	 		e.printStackTrace();
	 	 	}
	 	 	return resEnt;
	 	  }


		@Override
		@RequestMapping(value="/board/modNoticeArticle.do" ,method =RequestMethod.POST)
		@ResponseBody
		  public ResponseEntity modNoticeArticle(MultipartHttpServletRequest multipartRequest,  
		    HttpServletResponse response) throws Exception{
		    multipartRequest.setCharacterEncoding("utf-8");
			Map<String,Object> noticeMap = new HashMap<String, Object>();
			Enumeration enu=multipartRequest.getParameterNames();
			while(enu.hasMoreElements()){
				String name=(String)enu.nextElement();
				String value=multipartRequest.getParameter(name);
				noticeMap.put(name,value);
			}
			
			String notice_num=(String)noticeMap.get("notice_num");
			String message;
			ResponseEntity resEnt=null;
			HttpHeaders responseHeaders = new HttpHeaders();
			
			responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		    try {
		    	noticeboardService.modNoticeArticle(noticeMap);
		       message = "<script>";
			   message += " alert('공지사항 수정 성공');";
			   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewNoticeArticle.do?notice_num="+notice_num+"';";
			   message +=" </script>";
		       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		    }catch(Exception e) {
		      message = "<script>";
			  message += " alert('공지사항 수정 실패');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewNoticeArticle.do?notice_num="+notice_num+"';";
			  message +=" </script>";
		      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }
		    return resEnt;
		  }
		

}
