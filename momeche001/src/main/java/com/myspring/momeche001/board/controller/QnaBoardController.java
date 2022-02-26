package com.myspring.momeche001.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface QnaBoardController {
	
	public ModelAndView listQna(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewQnaArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ResponseEntity removeQnaArticle(@RequestParam("qna_num") int qna_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView viewQnaArticle(@RequestParam("qna_num") int qna_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// public ResponseEntity modQnaArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;

}
