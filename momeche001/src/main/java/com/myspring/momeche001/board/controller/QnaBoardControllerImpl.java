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

import com.myspring.momeche001.board.service.QnaBoardService;
import com.myspring.momeche001.board.vo.QnaVO;
import com.myspring.momeche001.member.vo.MemberVO;


@Controller("qnaboardController")
public class QnaBoardControllerImpl implements QnaBoardController {
	@Autowired
	private QnaBoardService qnaboardService;
	@Autowired
	private QnaVO qnaVO;

	// 자주묻는질문 리스트
	
			@Override
			@RequestMapping(value= "/board/question.do", method = {RequestMethod.GET, RequestMethod.POST})
			public ModelAndView listQna(HttpServletRequest request, HttpServletResponse response) throws Exception {
				String viewName = (String)request.getAttribute("viewName");
				List qnaList= qnaboardService.listQna();
				ModelAndView mav = new ModelAndView(viewName);
				mav.addObject("qnaList", qnaList);
				return mav;
				}
				
			
			
			// 자주묻는질문 글쓰기
			@Override
			@RequestMapping(value="/board/addNewQnaArticle.do" ,method = RequestMethod.POST)
			@ResponseBody
			public ResponseEntity addNewQnaArticle(MultipartHttpServletRequest multipartRequest, 
			HttpServletResponse response) throws Exception {
				multipartRequest.setCharacterEncoding("utf-8");
				Map<String,Object> qnaMap = new HashMap<String, Object>();
				Enumeration enu=multipartRequest.getParameterNames();
				while(enu.hasMoreElements()){
					String name=(String)enu.nextElement();
					String value=multipartRequest.getParameter(name);
					qnaMap.put(name,value);
				}
				
				HttpSession session = multipartRequest.getSession();
				MemberVO memberVO = (MemberVO) session.getAttribute("member");
				String id = memberVO.getMb_id();
				qnaMap.put("mb_id", id);
				
				String message;
				ResponseEntity resEnt=null;
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/html; charset=utf-8");
				try {
					int qna_num = qnaboardService.addNewQnaArticle(qnaMap);
					
			
					message = "<script>";
					message += " alert('자주묻는질문 등록 완료');";
					message += " location.href='"+multipartRequest.getContextPath()+"/board/question.do'; ";
					message +=" </script>";
				    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
				}catch(Exception e) {
					
					message = " <script>";
					message +=" alert('자주묻는질문 등록 오류');');";
					message +=" location.href='"+multipartRequest.getContextPath()+"/board/articleForm.do'; ";
					message +=" </script>";
					resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
					e.printStackTrace();
				}
				return resEnt;
			}
			
			  @RequestMapping(value="/board/qna_articleForm")
			    public String qnaWrite() throws Exception {
			        return "/board/qna_articleForm";
			    }
			  
			  //자주묻는 질문 삭제하기

			  @Override
			  @RequestMapping(value="/board/removeQnaArticle.do" ,method = RequestMethod.POST)
			  @ResponseBody
			  public ResponseEntity removeQnaArticle(@RequestParam("qna_num") int qna_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
			 	response.setContentType("text/html; charset=UTF-8");
			 	String message;
			 	ResponseEntity resEnt=null;
			 	HttpHeaders responseHeaders = new HttpHeaders();
			 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			 	
			 	try {
			 		qnaboardService.removeQnaArticle(qna_num);
			 	
			 		message = "<script>";
			 		message += " alert('자주묻는질문 삭제 완료');";
			 		message += " location.href='"+request.getContextPath()+"/board/question.do';";
			 		message +=" </script>";
			 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			 	 
			 	}catch(Exception e) {
			 		message = "<script>";
			 		message += " alert('자주묻는질문 삭제 오류');";
			 		message += " location.href='"+request.getContextPath()+"/board/question.do';";
			 		message +=" </script>";
			 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			 		
			 		e.printStackTrace();
			 	 	}
			 	 	return resEnt;
			 	  }


			  //자주묻는질문 상세
			@Override
			@RequestMapping(value = "/board/viewQnaArticle.do",method = RequestMethod.GET)
			public ModelAndView viewQnaArticle(@RequestParam("qna_num")int qna_num, HttpServletRequest request, HttpServletResponse response)
					throws Exception {
				String viewName = (String)request.getAttribute("viewName");
				qnaVO = qnaboardService.viewQnaArticle(qna_num);
				ModelAndView mav = new ModelAndView();
				mav.setViewName(viewName);
				mav.addObject("qna", qnaVO);
				return mav;
			}
			
			

			/* 자주묻는질문 수정
			@Override
			@RequestMapping(value="/board/modQnaArticle.do" ,method =RequestMethod.POST)
			  @ResponseBody
			  public ResponseEntity modQnaArticle(MultipartHttpServletRequest multipartRequest,  
			    HttpServletResponse response) throws Exception{
			    multipartRequest.setCharacterEncoding("utf-8");
				Map<String,Object> qnaMap = new HashMap<String, Object>();
				Enumeration enu=multipartRequest.getParameterNames();
				while(enu.hasMoreElements()){
					String name=(String)enu.nextElement();
					String value=multipartRequest.getParameter(name);
					qnaMap.put(name,value);
				}
				
				String qna_num=(String)qnaMap.get("qna_num");
				String message;
				ResponseEntity resEnt=null;
				HttpHeaders responseHeaders = new HttpHeaders();
				responseHeaders.add("Content-Type", "text/html; charset=utf-8");
			    try {
			       boardService.modQnaArticle(qnaMap);
			       message = "<script>";
				   message += " alert('湲��쓣 �닔�젙�뻽�뒿�땲�떎.');";
				   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewQnaArticle.do?qna_num="+qna_num+"';";
				   message +=" </script>";
			       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			       
			    }catch(Exception e) {
			      message = "<script>";
				  message += " alert('�삤瑜섍� 諛쒖깮�뻽�뒿�땲�떎.�떎�떆 �닔�젙�빐二쇱꽭�슂');";
				  message += " location.href='"+multipartRequest.getContextPath()+"/board/QnaviewArticle.do?qna_num="+qna_num+"';";
				  message +=" </script>";
			      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			    }
			    return resEnt;
			  }
			  
			  */
}
