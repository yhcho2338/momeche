package com.myspring.momeche001.member.controller;


import java.awt.print.Pageable;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.myspring.momeche001.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView listMembers(HttpServletRequest request, HttpServletResponse response) throws Exception;
	/*20220216 회원 가입 완료 얼럿 설정을 위해 기존 회원 가입 메서드 주석 처리  신우주
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO,RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	*/
	/*20220216 회원 가입 완료 얼럿 설정을 위해 기존 회원 가입 메서드 삽입  신우주*/
public ResponseEntity addMember(@ModelAttribute("member") MemberVO member, HttpServletRequest request, HttpServletResponse response) throws Exception;
	/*//20220216 회원 가입 완료 얼럿 설정을 위해 기존 회원 가입 메서드 삽입 끝  신우주*/
	public ModelAndView removeMember(@RequestParam("id") String id, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(@ModelAttribute("member") MemberVO memberVO, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	public ResponseEntity   overlapped(@RequestParam("mb_id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;

	public String find_id(HttpServletResponse response, @RequestParam("email_1") String email_1, Model md) throws Exception;
	
}

