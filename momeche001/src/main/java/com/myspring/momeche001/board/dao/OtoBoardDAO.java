package com.myspring.momeche001.board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.board.vo.OtoVO;

public interface OtoBoardDAO {
	public List selectAllOtoList() throws DataAccessException;
	public int insertNewOtoArticle(Map otoMap) throws DataAccessException;
	public int insertNewOtoReply(Map otoMap) throws DataAccessException;
	public OtoVO selectOtoArticle(int oto_num) throws DataAccessException;
	public void deleteOtoArticle(int oto_num) throws DataAccessException;
	public void updateOtoArticle(Map otoMap) throws DataAccessException;
	public void updateOtoReply(Map otoMap) throws DataAccessException;
}
