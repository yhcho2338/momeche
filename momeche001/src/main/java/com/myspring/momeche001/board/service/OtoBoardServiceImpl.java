package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.board.dao.OtoBoardDAO;
import com.myspring.momeche001.board.vo.OtoVO;

@Service("otoboardService")

@Transactional(propagation = Propagation.REQUIRED)

public class OtoBoardServiceImpl implements OtoBoardService{
	
	@Autowired
	OtoBoardDAO otoboardDAO;
	
	// 1:1臾몄쓽 由ъ뒪�듃
	@Override
	public List<OtoVO> listOto() throws Exception{
		List<OtoVO> otoList = otoboardDAO.selectAllOtoList();
		return otoList;
		}

	@Override
	public int addNewOtoArticle(Map otoMap) throws Exception {
		int oto_num = otoboardDAO.insertNewOtoArticle(otoMap);
		otoMap.put("oto_num", oto_num);
		return oto_num;
	}


	// 1:1臾몄쓽 湲� �긽�꽭
	@Override
	public OtoVO viewOtoArticle(int oto_num) throws Exception {
		OtoVO otoVO = otoboardDAO.selectOtoArticle(oto_num);
		return otoVO;

	}

	//1:1臾몄쓽 湲� �궘�젣
	@Override
	public void removeOtoArticle(int oto_num) throws Exception {
		otoboardDAO.deleteOtoArticle(oto_num);
		
	}


	// 1:1 臾몄쓽 �닔�젙
	@Override
	public void modOtoArticle(Map otoMap) throws Exception {
		otoboardDAO.updateOtoArticle(otoMap);	
	}

	@Override
	public void modOtoReply(Map otoMap) throws Exception {
		otoboardDAO.updateOtoReply(otoMap);	
	}


	@Override
	public int addNewOtoReply(Map otoMap) throws Exception {
		int oto_num = otoboardDAO.insertNewOtoReply(otoMap);
		otoMap.put("oto_num", oto_num);
		return oto_num;
	}

}
