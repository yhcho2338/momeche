package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.board.vo.QnaVO;

public interface QnaBoardService {

	 public List<QnaVO> listQna() throws Exception;
	 public int addNewQnaArticle(Map qnaMap) throws Exception;
	 public void removeQnaArticle(int qna_num) throws Exception;
	 public void modQnaArticle(Map qnaMap) throws Exception;
	 public QnaVO viewQnaArticle(int qna_num) throws Exception;
}
