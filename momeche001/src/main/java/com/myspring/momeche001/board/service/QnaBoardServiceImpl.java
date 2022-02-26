package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.board.dao.QnaBoardDAO;
import com.myspring.momeche001.board.vo.QnaVO;

@Service("qnaboardService")

@Transactional(propagation = Propagation.REQUIRED)

public class QnaBoardServiceImpl implements QnaBoardService {
	
	@Autowired
	QnaBoardDAO qnaboardDAO;
	@Override
	public List<QnaVO> listQna() throws Exception{
		List<QnaVO> qnaList = qnaboardDAO.selectAllQnaList();
		return qnaList;
		}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 �빊遺쏙옙
	@Override
	public int addNewQnaArticle(Map qnaMap) throws Exception{
		int qna_num = qnaboardDAO.insertNewQnaArticle(qnaMap);
		qnaMap.put("qna_num", qna_num);
		return qna_num;
	}


	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄텣占쎌젫
	@Override
	public void removeQnaArticle(int qna_num) throws Exception {
		qnaboardDAO.deleteQnaArticle(qna_num);
		
	}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎄맒占쎄쉭癰귣떯由�
	@Override
	public QnaVO viewQnaArticle(int qna_num) throws Exception {
		QnaVO qnaVO = qnaboardDAO.selectQnaArticle(qna_num);
		return qnaVO;
	}

	//占쎌쁽雅뚯눛釉�占쎈뮉筌욌뜄揆 占쎈땾占쎌젟占쎈릭疫뀐옙
	@Override
	public void modQnaArticle(Map qnaMap) throws Exception {
		qnaboardDAO.updateQnaArticle(qnaMap);
	}

}
