package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.board.vo.NoticeVO;

public interface NoticeBoardDAO {
	
	
	public List selectAllNoticeList() throws DataAccessException;
	public int insertNewNoticeArticle(Map noticeMap) throws DataAccessException;
	public NoticeVO selectNoticeArticle(int notice_num) throws DataAccessException;
	public void deleteNoticeArticle(int notice_num) throws DataAccessException;
	public void updateNoticeArticle(Map noticeMap) throws DataAccessException;

}
