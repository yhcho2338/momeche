package com.myspring.momeche001.admin.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface AdminProductController {
	
	public ModelAndView adminPdMain(@RequestParam Map<String, String> dateMap,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public ResponseEntity addNewPd(@RequestParam("pd_id") int pd_id, MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;

	public String removeProduct (HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView removeProduct2(@RequestParam("pd_id") String pd_id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ResponseEntity modifyGoodsInfo( @RequestParam("pd_id") String pd_id,
            @RequestParam("mod_type") String mod_type,
            @RequestParam("value") String value,
            HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public void modifyGoodsImageInfo(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)  throws Exception;
	//이번트 상품 설정을 위한 추가 구문 설정
	public ModelAndView eventChk(HttpServletRequest request, HttpServletResponse response) throws Exception;
	

}
