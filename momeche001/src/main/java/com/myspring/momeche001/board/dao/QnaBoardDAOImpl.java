package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.board.vo.QnaVO;

@Repository("qnaboardDAO")
public class QnaBoardDAOImpl implements QnaBoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllQnaList() throws DataAccessException {
		List<QnaVO> qnaList=sqlSession.selectList("mapper.board.selectAllQnaList");

		return qnaList;
	}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄땜占쎌뿯
	@Override
	public int insertNewQnaArticle(Map qnaMap) throws DataAccessException {
		int qna_num = selectNewQnaArticle_num();
		qnaMap.put("qna_num", qna_num);
		sqlSession.insert("mapper.board.insertNewQnaArticle",qnaMap);
		return qna_num;
	}


	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄퐨占쎄문
	private int selectNewQnaArticle_num() throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectNewQnaArticle_num");
	}


	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄텣占쎌젫
	@Override
	public void deleteQnaArticle(int qna_num) throws DataAccessException {
		sqlSession.delete("mapper.board.deleteQnaArticle", qna_num);
		
	}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄맒占쎄쉭癰귣떯由�
	@Override
	public QnaVO selectQnaArticle(int qna_num) throws DataAccessException {
	return sqlSession.selectOne("mapper.board.selectQnaArticle", qna_num);
	}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎈땾占쎌젟
	@Override
	public void updateQnaArticle(Map qnaMap) throws DataAccessException {
	sqlSession.update("mapper.board.updateQnaArticle", qnaMap);
	}



}
