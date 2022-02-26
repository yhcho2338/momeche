package com.myspring.momeche001.member.service;

import java.awt.print.Pageable;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.myspring.momeche001.member.dao.MemberDAO;
import com.myspring.momeche001.member.vo.MemberVO;

public interface MemberService {
	public MemberDAO getMemberDAO();
	public List listMembers(int offset, int count) throws DataAccessException;
	public int addMember(MemberVO memberVO) throws DataAccessException;
	public int removeMember(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;
	
	
	public String overlapped(String mb_id) throws Exception;
	
	public String find_id(HttpServletResponse response, String email_1) throws Exception; 
	public void memberDelete(MemberVO memberVO) throws Exception;
	
	/**/
	public String getAccessToken (String authorize_code) throws Exception;
	public HashMap<String, Object> getUserInfo (String access_Token) throws Exception;
	/**/
	
}

