package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.board.dao.NoticeBoardDAO;
import com.myspring.momeche001.board.vo.NoticeVO;

@Service("noticeboardService")

@Transactional(propagation = Propagation.REQUIRED)

public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	NoticeBoardDAO noticeboardDAO;
	
	@Override
	public List<NoticeVO> listNotice() throws Exception{
		List<NoticeVO> noticeList = noticeboardDAO.selectAllNoticeList();
		
		return noticeList;
		}

	// 怨듭��궗�빆 湲��벐湲�
	@Override
	public int addNewNoticeArticle(Map noticeMap) throws Exception {
		int notice_num = noticeboardDAO.insertNewNoticeArticle(noticeMap);
		noticeMap.put("notice_num", notice_num);
		return notice_num;
	}


	// 怨듭��궗�빆 湲� �긽�꽭
	@Override
	public NoticeVO viewNoticeArticle(int notice_num) throws Exception {
		NoticeVO noticeVO = noticeboardDAO.selectNoticeArticle(notice_num);
		return noticeVO;

	}

	// 怨듭��궗�빆 �궘�젣
	@Override
	public void removeNoticeArticle(int notice_num) throws Exception {
		noticeboardDAO.deleteNoticeArticle(notice_num);
		
	}

	// 怨듭��궗�빆 �뾽�뜲�씠�듃
	@Override
	public void modNoticeArticle(Map noticeMap) throws Exception {
		noticeboardDAO.updateNoticeArticle(noticeMap);
		
	}


}
