package com.myspring.momeche001.info.controller;

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

import com.myspring.momeche001.info.service.InfoService;
import com.myspring.momeche001.info.vo.InfoVO;
import com.myspring.momeche001.member.vo.MemberVO;

@Controller("infoController")
public class InfoControllerImpl implements InfoController {
	@Autowired
	private InfoService infoService;
	@Autowired
	private InfoVO infoVO;
	
	// 영상게시판 리스트
	@Override
	@RequestMapping(value= "/info/listInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		List<InfoVO> infoList = infoService.listInfo();
		System.out.println(infoList.toString());
		mav.addObject("infoList", infoList);
		return mav;
		}
	
	 @RequestMapping(value = "/info/*Form.do", method = {RequestMethod.GET, RequestMethod.POST})
	 private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		 
		 String viewName = (String)request.getAttribute("viewName");
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName(viewName);
		 
		 return mav;
		 
	 }
	
	// 영상게시판 글 등록
	
	@Override
	@RequestMapping(value="/info/addNewInfo.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewInfo(@RequestParam("info_url") String info_url, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> infoMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			infoMap.put(name,value);
		}
		
		HttpSession session = multipartRequest.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String id = memberVO.getMb_id();
		infoMap.put("mb_id", id);
		
		String info_url1 = infoVO.setInfo_url("https://youtu.be/" + info_url);
		infoMap.put("info_url", info_url1);
		String info_url2 = infoVO.setInfo_url_origin(info_url);
		infoMap.put("info_url_origin", info_url2);
		
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int info_num = infoService.addNewInfo(infoMap);
			
	
			message = "<script>";
			message += " alert('영상게시글 등록');";
			message += " location.href='"+multipartRequest.getContextPath()+"/info/listInfo.do'; ";
			message +=" </script>";
		    resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}catch(Exception e) {
			
			message = " <script>";
			message +=" alert('영상게시글 등록 실패');');";
			message +=" location.href='"+multipartRequest.getContextPath()+"/info/info_articleForm.do'; ";
			message +=" </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	// 영상게시판 글 보기
	
	@Override
	@RequestMapping(value = "/info/viewInfo.do",method = RequestMethod.GET)
	public ModelAndView viewInfo(@RequestParam("info_num")int info_num, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		Map infoMap = infoService.viewInfo(info_num);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		mav.addObject("infoMap", infoMap);
		System.out.println(infoMap.toString());
		return mav;
	}
	
	// 영상게시판 글 삭제
	
	@Override
	  @RequestMapping(value="/info/removeInfo.do" ,method = RequestMethod.POST)
	  @ResponseBody
	  public ResponseEntity removeInfo(@RequestParam("info_num") int info_num, HttpServletRequest request, HttpServletResponse response) throws Exception{
	 	response.setContentType("text/html; charset=UTF-8");
	 	String message;
	 	ResponseEntity resEnt=null;
	 	HttpHeaders responseHeaders = new HttpHeaders();
	 	responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	 	
	 	try {
	 		infoService.removeInfo(info_num);
	 	
	 		message = "<script>";
	 		message += " alert('영상게시글 삭제');";
	 		message += " location.href='"+request.getContextPath()+"/info/listInfo.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 	 
	 	}catch(Exception e) {
	 		message = "<script>";
	 		message += " alert('영상게시글 삭제 실패');";
	 		message += " location.href='"+request.getContextPath()+"/board/listInfo.do';";
	 		message +=" </script>";
	 		resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	 		
	 		e.printStackTrace();
	 	 	}
	 	 	return resEnt;
	 	  }
	
	// 영상게시판 글 수정
	
	@Override
	@RequestMapping(value="/info/modInfo.do",method =RequestMethod.POST)
	@ResponseBody
	  public ResponseEntity modInfo(@RequestParam("info_url") String info_url, MultipartHttpServletRequest multipartRequest,  HttpServletResponse response) throws Exception{
	    multipartRequest.setCharacterEncoding("utf-8");
		Map<String,Object> infoMap = new HashMap<String, Object>();
		Enumeration enu=multipartRequest.getParameterNames();
		while(enu.hasMoreElements()){
			String name=(String)enu.nextElement();
			String value=multipartRequest.getParameter(name);
			infoMap.put(name,value);
		}
		
		String info_url1 = infoVO.setInfo_url("https://youtu.be/" + info_url);
		infoMap.put("info_url", info_url1);
		String info_url2 = infoVO.setInfo_url_origin(info_url);
		infoMap.put("info_url_origin", info_url2);
		
		String info_num=(String)infoMap.get("info_num");
		String message;
		ResponseEntity resEnt=null;
		HttpHeaders responseHeaders = new HttpHeaders();
		
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
	    try {
	    	infoService.modInfo(infoMap);
	       message = "<script>";
		   message += " alert('영상게시글 수정');";
		   message += " location.href='"+multipartRequest.getContextPath()+"/info/viewInfo.do?info_num="+info_num+"';";
		   message +=" </script>";
	       resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	       
	    }catch(Exception e) {
	      message = "<script>";
		  message += " alert('영상게시글 수정 실패');";
		  message += " location.href='"+multipartRequest.getContextPath()+"/info/viewInfo.do?info_num="+info_num+"';";
		  message +=" </script>";
	      resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
	    }
	    
	    return resEnt;
	  }
	
}
