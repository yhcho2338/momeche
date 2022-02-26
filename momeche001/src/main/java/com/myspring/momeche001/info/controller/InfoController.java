package com.myspring.momeche001.info.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface InfoController {
	
	// ����Ʈ
	
	public ModelAndView listInfo(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// �۾���
	public ResponseEntity addNewInfo(@RequestParam("info_url") String info_url, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	// �󼼺���
	public ModelAndView viewInfo(@RequestParam("info_num") int info_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	// ����
	public ResponseEntity removeInfo(@RequestParam("info_num") int info_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	//����
	public ResponseEntity modInfo(@RequestParam("info_url") String info_url, MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	
	
}
