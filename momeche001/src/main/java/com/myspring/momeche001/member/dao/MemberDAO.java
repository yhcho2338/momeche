package com.myspring.momeche001.member.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;
import com.myspring.momeche001.member.vo.MemberVO;

public interface MemberDAO {
	public int getTotalCount();
	public int getCountPerId();
	public List selectAllMemberList(int offset, int count) throws DataAccessException;
	//public int addMember(MemberVO memberVO) throws DataAccessException;
	public int insertMember(MemberVO memberVO) throws DataAccessException;
	public int deleteMember(String id) throws DataAccessException;
	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;
	
	
	public String selectOverlappedID(String mb_id) throws DataAccessException;
	
	public String find_id(String email_1) throws Exception;
	
	public void deleteMember(MemberVO memberVO) throws DataAccessException;
	
	
}
