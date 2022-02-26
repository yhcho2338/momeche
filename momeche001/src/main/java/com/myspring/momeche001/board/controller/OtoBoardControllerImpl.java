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

import com.myspring.momeche001.board.service.OtoBoardService;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.member.vo.MemberVO;

@Controller("otoboardController")
public class OtoBoardControllerImpl implements OtoBoardController {
	
	@Autowired
	private OtoBoardService otoboardService;
	@Autowired
	private OtoVO otoVO;
	
	//1:1���� ����Ʈ
	@Override
	@RequestMapping(value= "/board/listOto.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listOto(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<OtoVO> otoList = otoboardService.listOto();
		mav.addObject("otoList", otoList);
		return mav;
		}
	
	
	@Override
	@RequestMapping(value="/board/addNewOtoArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewOtoArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> otoMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			otoMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getMb_id();
		otoMap.put("mb_id", id);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int qna_num = otoboardService.addNewOtoArticle(otoMap);
			
	
			message = "<script>";
			message += " alert('1:1문의글이 등록되었습니다.');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listOto.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			
			message = " <script>";
			message +=" alert('오류가 발생했습니다.');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/oto_articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	
	// 1:1���� �� �󼼺���
	
	@Override
	@RequestMapping(value = "/board/viewOtoArticle.do",method = RequestMethod.GET)
	public ModelAndView viewOtoArticle(@RequestParam("oto_num")int oto_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		OtoVO oto = otoboardService.viewOtoArticle(oto_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("oto", oto);
		return mav;
	}
	
	@Override
	  @RequestMapping(value="/board/removeOtoArticle.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity removeOtoArticle(@RequestParam("oto_num") int oto_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
	 	response.setContentType("text/html; charset=UTF-8");
	 	String message;
	 	ResponseEntity resEnt=null;
	 	HttpHeaders responseHeaders = new HttpHeaders();
	 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 	
	 	try {
	 		otoboardService.removeOtoArticle(oto_num);
	 	
	 		message = "<script>";
	 		message += " alert('1:1���� ���� �Ϸ�');";
	 		message += " location.href='"+request.getContextPath()+"/board/listOto.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 	 
	 	}catch(Exception e) {
	 		message = "<script>";
	 		message += " alert('1:1���� ���� ����');";
	 		message += " location.href='"+request.getContextPath()+"/board/listOto.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 		
	 		e.printStackTrace();
	 	 	}
	 	 	return resEnt;
	 	  }
	
	@Override
	@RequestMapping(value={"/board/modOtoArticle.do","/board/modOtoReply"} ,method =RequestMethod.POST)
	@ResponseBody
	  public ResponseEntity modOtoArticle(MultipartHttpServletRequest multipartRequest,  
	    HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> otoMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			otoMap.put(name,value);
		}
		
		String oto_num=(String)otoMap.get("oto_num");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	otoboardService.modOtoArticle(otoMap);
	       message = "<script>";
		   message += " alert('������ �Ϸ�Ǿ����ϴ�.');";
		   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewOtoArticle.do?oto_num="+oto_num+"';";
		   message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
	    }catch(Exception e) {
	      message = "<script>";
		  message += " alert('���� ����');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewOtoArticle.do?oto_num="+oto_num+"';";
		  message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }
	    
	    try {
	    	otoboardService.modOtoReply(otoMap);
		       message = "<script>";
			   message += " alert('������ �Ϸ�Ǿ����ϴ�.');";
			   message += " location.href='"+multipartRequest.getContextPath()+"/board/viewOtoArticle.do?oto_num="+oto_num+"';";
			   message +=" </script>";
		       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		       
		    }catch(Exception e) {
		      message = "<script>";
			  message += " alert('���� ����');";
			  message += " location.href='"+multipartRequest.getContextPath()+"/board/viewOtoArticle.do?oto_num="+oto_num+"';";
			  message +=" </script>";
		      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		    }
	    return resEnt;
	  }
	
	
	@RequestMapping (value="/board/oto_replyForm.do")
	public ModelAndView otoreplyForm(@RequestParam("oto_parentNO") int oto_parentNO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mv = new ModelAndView();
		mv.addObject("oto_parentNO",oto_parentNO);
		mv.setViewName("/board/oto_replyForm");
		return mv;
	}
	
	
	
	@Override
	@RequestMapping(value="/board/addOtoReply.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addOtoReply(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> otoMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			otoMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getMb_id();
		otoMap.put("mb_id", id);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int oto_num = otoboardService.addNewOtoReply(otoMap);
			
	
			message = "<script>";
			message += " alert('��� ��� �Ϸ�');";
			message += " location.href='"+multipartRequest.getContextPath()+"/board/listOto.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			
			message = " <script>";
			message +=" alert('��� ��� ����');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/board/oto_articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	

}
