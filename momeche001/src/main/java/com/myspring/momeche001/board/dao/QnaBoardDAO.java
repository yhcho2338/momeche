package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.board.vo.QnaVO;

public interface QnaBoardDAO {
	public List selectAllQnaList() throws DataAccessException;
	public int insertNewQnaArticle(Map qnaMap) throws DataAccessException;
	public void deleteQnaArticle(int qna_num) throws DataAccessException;
	public QnaVO selectQnaArticle(int qna_num) throws DataAccessException;
	public void updateQnaArticle(Map qnaMap) throws DataAccessException;
}
