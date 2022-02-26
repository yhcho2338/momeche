package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.board.vo.NoticeVO;

public interface NoticeBoardService {
	public List<NoticeVO> listNotice() throws Exception;
	public int addNewNoticeArticle(Map noticeMap) throws Exception;
	public NoticeVO viewNoticeArticle(int notice_num) throws Exception;
	public void removeNoticeArticle(int notice_num) throws Exception;
	public void modNoticeArticle(Map noticeMap) throws Exception;

}
