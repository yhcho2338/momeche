package com.myspring.momeche001.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.momeche001.order.vo.OrderVO;

public interface MyPageController {
	public ModelAndView myPageMain(@RequestParam(required = false, value="message") String message, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView myOrderList(@RequestParam(required = false,value="message") String message, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView myDetailInfo(HttpServletRequest request, HttpServletResponse response)  throws Exception;

	public ResponseEntity modifyMyInfo(@RequestParam("attribute")  String attribute,
            @RequestParam("value")  String value,
          HttpServletRequest request, HttpServletResponse response)  throws Exception;
	
	public ModelAndView myInfoList(HttpServletRequest request, HttpServletResponse response)  throws Exception;


}

