package com.myspring.momeche001.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface OtoBoardController {

	public ModelAndView listOto(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewOtoArticle(MultipartHttpServletRequest multipartRequest,HttpServletResponse response) throws Exception;	
	public ResponseEntity addOtoReply(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView viewOtoArticle(@RequestParam("oto_num") int oto_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeOtoArticle(@RequestParam("oto_num") int oto_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modOtoArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
