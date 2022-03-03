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


// 추천게시판 부분 시작

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


// 추천게시판 사진 등록
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

// 추천게시판 끝


//QnA 부분 시작
// QnA 리스트
@Override
public List selectAllQnaList() throws DataAccessException {
	List<QnaVO> qnaList=sqlSession.selectList("mapper.board.selectAllQnaList");

	return qnaList;
}

// QnA글 등록
@Override
public int insertNewQnaArticle(Map qnaMap) throws DataAccessException {
	int qna_num = selectNewQnaArticle_num();
	qnaMap.put("qna_num", qna_num);
	sqlSession.insert("mapper.board.insertNewQnaArticle",qnaMap);
	return qna_num;
}


// QnA글 번호 등록
private int selectNewQnaArticle_num() throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNewQnaArticle_num");
}


// QnA글 삭제
@Override
public void deleteQnaArticle(int qna_num) throws DataAccessException {
	sqlSession.delete("mapper.board.deleteQnaArticle", qna_num);
	
}

// QnA글 보기
@Override
public QnaVO selectQnaArticle(int qna_num) throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectQnaArticle", qna_num);
}

// QnA글 수정
@Override
public void updateQnaArticle(Map qnaMap) throws DataAccessException {
sqlSession.update("mapper.board.updateQnaArticle", qnaMap);
}

// QnA 부분 끝



// 공지사항 부분
@Override
public List selectAllNoticeList() throws DataAccessException {
	List<NoticeVO> noticeList=sqlSession.selectList("mapper.board.selectAllNoticeList");
return noticeList;
}


@Override
public int insertNewNoticeArticle(Map noticeMap) throws DataAccessException {
	int notice_num = selectNewNoticeArticle_num();
	noticeMap.put("notice_num", notice_num);
	sqlSession.insert("mapper.board.insertNewNoticeArticle",noticeMap);
	return notice_num;
}


private int selectNewNoticeArticle_num() throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNewNoticeArticle_num");
}


@Override
public NoticeVO selectNoticeArticle(int notice_num) throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNoticeArticle", notice_num);
}


@Override
public void deleteNoticeArticle(int notice_num) throws DataAccessException {
	sqlSession.delete("mapper.board.deleteNoticeArticle", notice_num);	
}


@Override
public void updateNoticeArticle(Map noticeMap) throws DataAccessException {
	sqlSession.update("mapper.board.updateNoticeArticle", noticeMap);
}

//공지사항 부분 끝



// 1:1게시판 부분 시작
@Override
public List selectAllOtoList() throws DataAccessException {
	List<OtoVO> otoList=sqlSession.selectList("mapper.board.selectAllOtoList");
return otoList;
}


@Override
public int insertNewOtoArticle(Map otoMap) throws DataAccessException {
	int oto_num = selectNewOtoArticle_num();
	otoMap.put("oto_num", oto_num);
	sqlSession.insert("mapper.board.insertNewOtoArticle",otoMap);
	return oto_num;
}


private int selectNewOtoArticle_num() throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectNewOtoArticle_num");
}


@Override
public OtoVO selectOtoArticle(int oto_num) throws DataAccessException {
return sqlSession.selectOne("mapper.board.selectOtoArticle", oto_num);
}


@Override
public void deleteOtoArticle(int oto_num) throws DataAccessException {
	sqlSession.delete("mapper.board.deleteOtoArticle", oto_num);	
}


@Override
public void updateOtoArticle(Map otoMap) throws DataAccessException {
	sqlSession.update("mapper.board.updateOtoArticle", otoMap);	
}

@Override
public void updateOtoReply(Map otoMap) throws DataAccessException {
	sqlSession.update("mapper.board.updateOtoReply", otoMap);	
}

//1:1게시판 답변
@Override
public int insertNewOtoReply(Map otoMap) throws DataAccessException {
	int oto_num = selectNewOtoArticle_num();
	otoMap.put("oto_num", oto_num);
	sqlSession.insert("mapper.board.insertNewOtoReply",otoMap);
return oto_num;
}

// 1:1게시판 부분 끝




}
