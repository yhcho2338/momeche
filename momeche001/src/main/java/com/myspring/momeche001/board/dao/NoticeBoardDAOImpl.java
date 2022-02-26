package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.board.vo.NoticeVO;

@Repository("noticeboardDAO")
public class NoticeBoardDAOImpl implements NoticeBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllNoticeList() throws DataAccessException {
		List<NoticeVO> noticeList=sqlSession.selectList("mapper.board.selectAllNoticeList");
	return noticeList;
	}


	// 怨듭��궗�빆 湲��벐湲� 李� 
	@Override
	public int insertNewNoticeArticle(Map noticeMap) throws DataAccessException {
		int notice_num = selectNewNoticeArticle_num();
		noticeMap.put("notice_num", notice_num);
		sqlSession.insert("mapper.board.insertNewNoticeArticle",noticeMap);
		return notice_num;
	}

	//怨듭��궗�빆 湲�踰덊샇
	private int selectNewNoticeArticle_num() throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectNewNoticeArticle_num");
	}

	//怨듭��궗�빆 �긽�꽭�젙蹂�
	@Override
	public NoticeVO selectNoticeArticle(int notice_num) throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectNoticeArticle", notice_num);
	}

	//怨듭��궗�빆 �궘�젣

	@Override
	public void deleteNoticeArticle(int notice_num) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteNoticeArticle", notice_num);
		
	}
	
	@Override
	public void updateNoticeArticle(Map noticeMap) throws DataAccessException {
		sqlSession.update("mapper.board.updateNoticeArticle", noticeMap);
		
	}


}
