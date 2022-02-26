package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.board.vo.OtoVO;


@Repository("otoboardDAO")
public class OtoBoardDAOImpl implements OtoBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllOtoList() throws DataAccessException {
		List<OtoVO> otoList=sqlSession.selectList("mapper.board.selectAllOtoList");
	return otoList;
	}


	//1:1臾몄쓽 湲��벐湲곗갹
	@Override
	public int insertNewOtoArticle(Map otoMap) throws DataAccessException {
		int oto_num = selectNewOtoArticle_num();
		otoMap.put("oto_num", oto_num);
		sqlSession.insert("mapper.board.insertNewOtoArticle",otoMap);
		return oto_num;
	}

	//1:1臾몄쓽 湲�踰덊샇
	private int selectNewOtoArticle_num() throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectNewOtoArticle_num");
	}

	// 1:1臾몄쓽 �긽�꽭�젙蹂�
	@Override
	public OtoVO selectOtoArticle(int oto_num) throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectOtoArticle", oto_num);
	}

	//1:1臾몄쓽 �궘�젣

	@Override
	public void deleteOtoArticle(int oto_num) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteOtoArticle", oto_num);
		
	}


	// 1:1臾몄쓽 �뾽�뜲�씠�듃
	@Override
	public void updateOtoArticle(Map otoMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateOtoArticle", otoMap);
		
	}

	@Override
	public void updateOtoReply(Map otoMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateOtoReply", otoMap);
		
	}

	//1:1 臾몄쓽 �떟蹂�

	@Override
	public int insertNewOtoReply(Map otoMap) throws DataAccessException {
		int oto_num = selectNewOtoArticle_num();
		otoMap.put("oto_num", oto_num);
		sqlSession.insert("mapper.board.insertNewOtoReply",otoMap);
	return oto_num;
	}
}
