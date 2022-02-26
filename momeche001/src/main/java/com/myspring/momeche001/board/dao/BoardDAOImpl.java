package com.myspring.momeche001.board.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.board.vo.ArticleVO;
import com.myspring.momeche001.board.vo.ImageVO;
import com.myspring.momeche001.board.vo.NoticeVO;
import com.myspring.momeche001.board.vo.OtoVO;
import com.myspring.momeche001.board.vo.QnaVO;


@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
@Autowired
private SqlSession sqlSession;

@Override
public List selectAllArticlesList() throws DataAccessException {
	List<ArticleVO> articlesList=sqlSession.selectList("mapper.board.selectAllArticlesList");
return articlesList;
}



@Override
public int insertNewArticle(Map articleMap) throws DataAccessException {
	int article_num = selectNewArticle_num();
	articleMap.put("article_num", article_num);
	sqlSession.insert("mapper.board.insertNewArticle",articleMap);
return article_num;
}


@Override
public int insertNewReply(Map articleMap) throws DataAccessException {
	int article_num = selectNewArticle_num();
	articleMap.put("article_num", article_num);
	sqlSession.insert("mapper.board.insertNewReply",articleMap);
return article_num;
}




//占쎈뼄餓ο옙 占쎈솁占쎌뵬 占쎈씜嚥≪뮆諭�

@Override
public void insertNewImage(Map articleMap) throws DataAccessException {
	List<ImageVO> imageFileList = (ArrayList)articleMap.get("imageFileList");
	int article_num = (Integer)articleMap.get("article_num");
	int imageFileNO = selectNewImageFileNO();
	for(ImageVO imageVO : imageFileList){
		imageVO.setImageFileNO(++imageFileNO);
		imageVO.setarticle_num(article_num);
	}
sqlSession.insert("mapper.board.insertNewImage",imageFileList);
}

@Override
public ArticleVO selectArticle(int article_num) throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectArticle", article_num);
}

@Override
public void updateArticle(Map articleMap) throws DataAccessException {
sqlSession.update("mapper.board.updateArticle", articleMap);
}

@Override
public void adminupdateArticle(Map articleMap) throws DataAccessException {
sqlSession.update("mapper.board.updateadminArticle", articleMap);
}

@Override
public void deleteArticle(int article_num) throws DataAccessException {
sqlSession.delete("mapper.board.deleteArticle", article_num);
}

@Override
public List selectImageFileList(int article_num) throws DataAccessException {
List<ImageVO> imageFileList = null;
imageFileList = sqlSession.selectList("mapper.board.selectImageFileList",article_num);
return imageFileList;
}


private int selectNewArticle_num() throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNewArticle_num");
}


private int selectNewImageFileNO() throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNewImageFileNO");
}


//占쎌쁽雅뚯눖硅占쎈뮉筌욌뜄揆
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


//怨듭��궗�빆

//怨듭��궗�빆 由ъ뒪�듃

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





// 1:1臾몄쓽

// 1:1臾몄쓽 由ъ뒪�듃

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
