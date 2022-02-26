package com.myspring.momeche001.board.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.board.vo.OtoVO;

public interface OtoBoardService {
	
	public List<OtoVO> listOto()throws Exception;
	public int addNewOtoArticle(Map otoMap) throws Exception;
	public int addNewOtoReply(Map otoMap) throws Exception;
	public OtoVO viewOtoArticle(int oto_num) throws Exception;
	public void removeOtoArticle(int oto_num) throws Exception;
	public void modOtoArticle(Map otoMap) throws Exception;
	public void modOtoReply(Map otoMap) throws Exception;

}
