package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.board.vo.ArticleVO;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.board.vo.QnaVO;

public interface BoardService {
	
	public List<ArticleVO> listArticles() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public int addNewReply(Map articleMap) throws Exception;
	public Map viewArticle(int article_num) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void adminmodArticle(Map articleMap) throws Exception;
	public void removeArticle(int article_num) throws Exception;
}
