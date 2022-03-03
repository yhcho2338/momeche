package com.myspring.momeche001.mypage.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.board.service.OtoBoardService;
import com.myspring.momeche001.common.base.BaseController;
import com.myspring.momeche001.member.vo.MemberVO;
import com.myspring.momeche001.mypage.service.MyPageService;
import com.myspring.momeche001.order.vo.OrderVO;


@Controller("MyPageContoller")
@RequestMapping(value="/mypage")
public class MyPageControllerImpl extends BaseController implements MyPageController{
	
	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberVO memberVO;
	
	@Autowired
	private OtoBoardService otoboardService;

	@Override
	@RequestMapping(value="/myPageMain.do", method = RequestMethod.GET)
	
	public ModelAndView myPageMain(@RequestParam(required = false,value="message") String message, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		memberVO = (MemberVO)session.getAttribute("member");
		String mb_id = memberVO.getMb_id();
		
		List<OrderVO> myOrderList = myPageService.findMyOrderInfo(mb_id);
		List otoList = otoboardService.listOto();
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);
		mav.addObject("otoList",otoList);
		return mav;
	}

	
	@Override
	@RequestMapping(value="/myOrderList.do", method = {RequestMethod.GET})
	public ModelAndView myOrderList(@RequestParam(required = false,value="message") String message, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session=request.getSession();
		session=request.getSession();
		
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		memberVO=(MemberVO)session.getAttribute("member");
		String mb_id=memberVO.getMb_id();
		
		List<OrderVO> myOrderList=myPageService.findMyOrderInfo(mb_id);
		
		System.out.println("myOrderList: " +  myOrderList.toString());
		mav.addObject("message", message);
		mav.addObject("myOrderList", myOrderList);
		
		return mav;
	}
	
	
		@Override
		@RequestMapping(value="/myInfoList.do" ,method = RequestMethod.GET)
		public ModelAndView myInfoList(HttpServletRequest request, HttpServletResponse response)  throws Exception {
			HttpSession session=request.getSession();
			session=request.getSession();
		
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			memberVO=(MemberVO)session.getAttribute("member");
			String mb_id=memberVO.getMb_id();
			
			List<MemberVO> myInfoList=myPageService.findMyInfo(mb_id);
			
			mav.addObject("myInfoList", myInfoList);
			
			
			
			return mav;
		}	
		
		
		@Override
		@RequestMapping(value="/myDetailInfo.do" ,method = RequestMethod.GET)
		public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception {
			String viewName=(String)request.getAttribute("viewName");
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
		}	
		
		
		@Override
		@RequestMapping(value="/modifyMyInfo.do" ,method = RequestMethod.POST)
		public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
				                 @RequestParam("value")  String value,
				               HttpServletRequest request, HttpServletResponse response)  throws Exception {
			Map<String,String> mbMap=new HashMap<String,String>();
			String val[]=null;
			HttpSession session=request.getSession();
			memberVO=(MemberVO)session.getAttribute("member");
			String  mb_id=memberVO.getMb_id();
			if(attribute.equals("tel")){
				val=value.split(",");
				mbMap.put("tel_1",val[0]);
				mbMap.put("tel_2",val[1]);
				mbMap.put("tel_3",val[2]);
				
			}else if(attribute.equals("email")){
				val=value.split(",");
				mbMap.put("email_1",val[0]);
				
			}else if(attribute.equals("address")){
				val=value.split(",");
				mbMap.put("zipcode",val[0]);
				mbMap.put("road_address",val[1]);
				mbMap.put("jibun_address",val[2]);
				mbMap.put("other_address",val[3]);
			}else {
				mbMap.put(attribute,value);	
			}
			
			mbMap.put("mb_id", mb_id);
			
			
			memberVO=(MemberVO)myPageService.modifyMyInfo(mbMap);
			session.removeAttribute("member");
			session.setAttribute("member", memberVO);
			
			String message = null;
			ResponseEntity resEntity = null;
			HttpHeaders responseHeaders = new HttpHeaders();
			message  = "mod_success";
			resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
			return resEntity;
		}
		
		
	
	
}
