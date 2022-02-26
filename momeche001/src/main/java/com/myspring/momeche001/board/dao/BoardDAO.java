package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.board.vo.ArticleVO;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.board.vo.QnaVO;

public interface BoardDAO {
	
	public List selectAllArticlesList() throws DataAccessException;
	public int insertNewArticle(Map articleMap) throws DataAccessException;
	public int insertNewReply(Map articleMap) throws DataAccessException;
	public void insertNewImage(Map articleMap) throws DataAccessException;
	public ArticleVO selectArticle(int article_num) throws DataAccessException;
	public void updateArticle(Map articleMap) throws DataAccessException;
	public void adminupdateArticle(Map articleMap) throws DataAccessException;
	public void deleteArticle(int article_num) throws DataAccessException;
	public List selectImageFileList(int article_num) throws DataAccessException;
	
	//占쎌쁽雅뚯눖硅占쎈뮉筌욌뜄揆
	public List selectAllQnaList() throws DataAccessException;
	public int insertNewQnaArticle(Map qnaMap) throws DataAccessException;
	public void deleteQnaArticle(int qna_num) throws DataAccessException;
	public QnaVO selectQnaArticle(int qna_num) throws DataAccessException;
	public void updateQnaArticle(Map qnaMap) throws DataAccessException;
	
	
	//怨듭��궗�빆
	
	public List selectAllNoticeList() throws DataAccessException;
	public int insertNewNoticeArticle(Map noticeMap) throws DataAccessException;
	public NoticeVO selectNoticeArticle(int notice_num) throws DataAccessException;
	public void deleteNoticeArticle(int notice_num) throws DataAccessException;
	public void updateNoticeArticle(Map noticeMap) throws DataAccessException;
	
	// 1:1臾몄쓽
	public List selectAllOtoList() throws DataAccessException;
	public int insertNewOtoArticle(Map otoMap) throws DataAccessException;
	public int insertNewOtoReply(Map otoMap) throws DataAccessException;
	public OtoVO selectOtoArticle(int oto_num) throws DataAccessException;
	public void deleteOtoArticle(int oto_num) throws DataAccessException;
	public void updateOtoArticle(Map otoMap) throws DataAccessException;
	public void updateOtoReply(Map otoMap) throws DataAccessException;
}
