package com.myspring.momeche001.info.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.info.vo.InfoVO;

public interface InfoDAO {
	
	//리스트
	public List selectAllInfoList() throws DataAccessException;
	
	// 글쓰기
	public int insertNewInfo(Map infoMap) throws DataAccessException;
	
	// 상세보기
	public InfoVO selectInfo(int info_num) throws DataAccessException;
	
	// 삭제
	public void deleteInfo(int info_num) throws DataAccessException;
	
	// 수정
	public void updateInfo(Map infoMap) throws DataAccessException;

}
