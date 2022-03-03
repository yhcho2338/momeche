package com.myspring.momeche001.member.controller;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.momeche001.member.service.MemberService;
import com.myspring.momeche001.member.service.MemberServiceImpl;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.smsService.SmsService;
import com.myspring.momeche001.common.pageable.Pageable;



@Controller("memberController")
public class MemberControllerImpl implements MemberController{
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	
	@RequestMapping(value = { "/" , "/main.do"}, method = RequestMethod.GET)
	private ModelAndView main(HttpServletRequest request, HttpServletResponse response) {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	
	@Override
	@RequestMapping(value="/member/listMembers.do", method = RequestMethod.GET)
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName = getViewName(request); 
		response.setContentType("html/text;charset=utf-8");
		
		Pageable pageable = new Pageable();
		pageable.setPage(1);
		pageable.setCountList(5);
		pageable.setCountPage(6);
		pageable.setTotalCount(memberService.getMemberDAO().getTotalCount());
		if(request.getParameter("pages") != null)
			pageable.setPage(Integer.parseInt(request.getParameter("pages")));
		int offset = (pageable.getPage()-1)*pageable.getCountList();
		
		pageable.Paging();

		List membersList = memberService.listMembers(offset, pageable.getCountList());
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	
	// 회원가입 
	@Override
	@RequestMapping(value="/member/addMember.do", method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("memberVO") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String message = null;
		ResponseEntity resEntity= null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
		    memberService.addMember(memberVO);
		    message  = "<script>";
		    message +=" alert('환영합니다! 회원 가입이 완료되었습니다. 메인화면으로 이동합니다.');";
		    message += " location.href='"+request.getContextPath()+"/main/main.do';";
		    message += " </script>";
		    
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/member/memberForm.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity = new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	
	
	
	@Override
	@RequestMapping(value="/member/removeMember.do", method = RequestMethod.GET)
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		memberService.removeMember(id);
		ModelAndView mav = new ModelAndView("redirect:/member/listMembers.do");
		return mav;
	}
	

	
	@Override
	@RequestMapping(value = "/member/login.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO,
	RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {

	ModelAndView mav = new ModelAndView();
	memberVO = memberService.login(memberVO);
	if(memberVO != null) {
	    HttpSession session = request.getSession();
	    session.setAttribute("member", memberVO); // 세션에 담긴 정보는 뷰페이지에서 ""값으로 불러올 수 있다
	    session.setAttribute("isLogOn", true);
	    mav.setViewName("redirect:/main/main.do");
	    // mav.setViewName("redirect:/member/listMembers.do");
	    
	    String action = (String)session.getAttribute("action");
	    session.removeAttribute("action");
	    if(action != null) {
	    	mav.setViewName("redirect:" + action);
	    }else {
	    	mav.setViewName("redirect:/main/main.do");
	    }
	}else {
		rAttr.addAttribute("result", "loginFailed");
	    mav.setViewName("redirect:/member/loginForm.do");
	}
	return mav;
	}
	
	// 카카오 로그인 부분
	 @RequestMapping(value="/")
	    public String index() {
	        return "/member/loginForm";
	    }

	    @RequestMapping(value="/member/login", method = {RequestMethod.POST, RequestMethod.GET})
	    public ModelAndView login(@ModelAttribute("member")MemberVO member, @RequestParam(value="code", required=false) String code, 
	    						RedirectAttributes rAttr,
	    						HttpServletRequest request,
	    						HttpServletResponse response) throws Exception {
	    	ModelAndView mav = new ModelAndView();
	    	System.out.println("code : " + code);
	        String access_Token = memberService.getAccessToken(code);
	        System.out.println("access_Token : " + access_Token );
	        
	        HashMap<String, Object> userInfo = memberService.getUserInfo(access_Token);
	        System.out.println("login Controller : " + userInfo);
	        HttpSession session = request.getSession();
	        // 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	        if(userInfo != null) {
	        	session.setAttribute("member", userInfo);
	        	session.setAttribute("isLogOn", true);
	        	String action = (String)session.getAttribute("action");
	        	session.removeAttribute("action");
	        	if(action != null) {
	        		mav.setViewName("redirection:action");
	        	} else {
	        		mav.setViewName("redirect:/main/main.do");
	        	}
	        
	        	session.setAttribute("access_Token", access_Token);
	        	
	        }
	    	return mav;
	    	}
	   
	

	@Override
	@RequestMapping(value = "/member/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
	HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/main.do");
	return mav;
	 }
	
	
	// 아이디 유효성 검사 메소드
	@Override
	@RequestMapping(value="/member/overlapped.do" ,method = RequestMethod.POST)
	public ResponseEntity overlapped(@RequestParam("mb_id") String mb_id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		String result = memberService.overlapped(mb_id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	

	@RequestMapping(value="/member/*Form.do", method=RequestMethod.GET)
	public ModelAndView form(@RequestParam(value="result", required=false) String result, 
			                 @RequestParam(value="result", required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String viewName = (String) request.getAttribute("viewName");
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		ModelAndView mav = new ModelAndView();
		mav.addObject("result",result);
		mav.setViewName(viewName);
		return mav;
	}
	
	// 아이디 찾기 메소드
		@RequestMapping(value = "/member/find_id.do")
		public String find_id_form() throws Exception{
			return "/member/find_id";
		}
	
		@Override
		@RequestMapping(value = "/member/find_id_result.do", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email_1") String email_1, Model md) throws Exception{
			md.addAttribute("mb_id", memberService.find_id(response, email_1));
			return "/member/find_id_result";
		}
		
		
		//회원 가입 시 휴대전화 인증 서비스를 위한 컨트롤러 설정
				@RequestMapping(value = "/member/phoneCheck.do", method = RequestMethod.GET) 
				@ResponseBody 
				public String sendSMS(@RequestParam("phone") String userPhoneNumber) { 
					// 휴대폰 문자보내기 
					int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);
					//난수 생성 
					SmsService.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
					return Integer.toString(randomNumber); }
			
	
	
			
	//회원 탈퇴 구현 GET
		@RequestMapping(value="/member/memberDeleteView.do", method=RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "/member/memberDeleteView";
		}
	//회원 탈퇴 구현 POST			
		@RequestMapping(value="/member/memberDelete.do", method= RequestMethod.POST)
		public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception{
			MemberVO member = (MemberVO)session.getAttribute("member");
			String sessionPass = member.getMb_pw();
			String voPass = memberVO.getMb_pw();
								
			if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/member/memberDeleteView.do";
		}
								
			memberService.memberDelete(memberVO);
			session.invalidate();
			return "redirect:/main/main.do";
								
		}
					
		
		
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if(uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}
		
		int begin = 0;
		if(!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}
		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}
		
		String viewName = uri.substring(begin, end);
		if(viewName.indexOf(".")!=-1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if(viewName.lastIndexOf("/")!=-1) {
			viewName = viewName.substring(viewName.lastIndexOf("/", 1),viewName.length());
		}
		return viewName;
	}

}
