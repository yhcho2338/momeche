package com.myspring.momeche001.info.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.info.vo.InfoVO;

public interface InfoDAO {
	
	//����Ʈ
	public List selectAllInfoList() throws DataAccessException;
	
	// �۾���
	public int insertNewInfo(Map infoMap) throws DataAccessException;
	
	// �󼼺���
	public InfoVO selectInfo(int info_num) throws DataAccessException;
	
	// ����
	public void deleteInfo(int info_num) throws DataAccessException;
	
	// ����
	public void updateInfo(Map infoMap) throws DataAccessException;

}
