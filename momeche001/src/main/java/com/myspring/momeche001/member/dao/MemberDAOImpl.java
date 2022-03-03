package com.myspring.momeche001.member.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.member.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
		@Autowired
		private SqlSession sqlSession;
		@Autowired
		private SqlSessionFactory sqlSessionFactory;
		@Autowired
		static MemberDAO memberDAO;
		int totalCount;
		int countPerId;
		
		
		public MemberDAOImpl() {
			
		}
		
		public MemberDAOImpl(SqlSessionFactory sqlSessionFactory) {
			this.sqlSessionFactory = sqlSessionFactory;
		}
		
		public int getTotalCount() {
			return totalCount;
		}
		
		public int getCountPerId() {
			return countPerId;
		}
		
		
		@Override
		public List selectAllMemberList(int offset, int count) throws DataAccessException {
			List<MemberVO> membersList = new ArrayList<MemberVO>();
			SqlSession session = sqlSessionFactory.openSession();
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			params.put("offset", offset);
			params.put("count", count);
			
			try {
				membersList = session.selectList("mapper.member.selectAllMemberList",params);
				this.totalCount = session.selectOne("mapper.member.allMemberCount");
			}finally {
				session.close();
			}
			return membersList;
		}
		
		
		
		@Override
		public int insertMember(MemberVO memberVO) throws DataAccessException {
			int result = sqlSession.insert("mapper.member.insertMember", memberVO);
			return result;
			
		}
		
		@Override
		public int deleteMember(String id) throws DataAccessException {
			int result = sqlSession.delete("mapper.member.deleteMember", id);
			return result;
			
		}
		
		
		@Override
		public String selectOverlappedID(String mb_id) throws DataAccessException {
			String result = sqlSession.selectOne("mapper.member.selectOverlappedID",mb_id);
			return result;
		}
		
		
		
		
		@Override
		public String find_id(String email_1) throws Exception{
			return sqlSession.selectOne("mapper.member.find_id", email_1);
		}
		
		
		
		
		@Override
		public MemberVO loginById(MemberVO memberVO) throws DataAccessException {
			MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
			return vo;

		
		}
		
		
		// 회원 탈퇴 
		@Override
		public void deleteMember(MemberVO memberVO) throws DataAccessException {
			sqlSession.delete("mapper.member.deleteMember", memberVO);
			
		}
		
		
		
		
		
	}
