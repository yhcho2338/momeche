package com.myspring.momeche001.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.board.dao.BoardDAO;
import com.myspring.momeche001.board.vo.ArticleVO;
import com.myspring.momeche001.board.vo.ImageVO;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.board.vo.QnaVO;


@Service("boardService")

@Transactional(propagation = Propagation.REQUIRED)
	public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;


	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
}
	

//占쎈뼊占쎌뵬 占쎌뵠沃섎챷占� �빊遺쏙옙占쎈릭疫뀐옙
	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		int article_num = boardDAO.insertNewArticle(articleMap);
		articleMap.put("article_num", article_num);
		boardDAO.insertNewImage(articleMap);
		return article_num;
	}

@Override
public int addNewReply(Map articleMap) throws Exception {
	int article_num = boardDAO.insertNewReply(articleMap);
	articleMap.put("article_num", article_num);
	boardDAO.insertNewImage(articleMap);
	return article_num;
}

//占쎈뼄餓ο옙 占쎈솁占쎌뵬 癰귣똻�뵠疫뀐옙
@Override
public Map viewArticle(int article_num) throws Exception {
	Map articleMap = new HashMap();
	ArticleVO articleVO = boardDAO.selectArticle(article_num);
	List<ImageVO> imageFileList = boardDAO.selectImageFileList(article_num);
	articleMap.put("article", articleVO);
	articleMap.put("imageFileList", imageFileList);
return articleMap;
}

@Override
public void modArticle(Map articleMap) throws Exception {
	boardDAO.updateArticle(articleMap);
}

public void adminmodArticle(Map articleMap) throws Exception {
	boardDAO.adminupdateArticle(articleMap);
}

@Override
public void removeArticle(int article_num) throws Exception {
	boardDAO.deleteArticle(article_num);
}
	
}


