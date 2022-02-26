package com.myspring.momeche001.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface NoticeBoardController {

	public ModelAndView listNotice(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity addNewNoticeArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
	public ModelAndView viewNoticeArticle(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity removeNoticeArticle(@RequestParam("notice_num") int notice_num, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity modNoticeArticle(MultipartHttpServletRequest multipartRequest, HttpServletResponse response) throws Exception;
}
