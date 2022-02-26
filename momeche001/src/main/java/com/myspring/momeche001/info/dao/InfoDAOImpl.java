package com.myspring.momeche001.info.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.info.vo.InfoVO;

@Repository("infoDAO")
public class InfoDAOImpl implements InfoDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List selectAllInfoList() throws DataAccessException {
		List<InfoVO> infoList=sqlSession.selectList("mapper.info.selectAllInfoList");
	return infoList;
	}


	
	@Override
	public int insertNewInfo(Map infoMap) throws DataAccessException {
		int info_num = selectNewInfo_num();
		infoMap.put("info_num", info_num);
		sqlSession.insert("mapper.info.insertNewInfo",infoMap);
		return info_num;
	}

	
	private int selectNewInfo_num() throws DataAccessException {
	return sqlSession.selectOne("mapper.info.selectNewInfo_num");
	}

	
	@Override
	public InfoVO selectInfo(int info_num) throws DataAccessException {
	return sqlSession.selectOne("mapper.info.selectInfo", info_num);
	}

	

	@Override
	public void deleteInfo(int info_num) throws DataAccessException {
		sqlSession.delete("mapper.info.deleteInfo", info_num);
		
	}
	
	@Override
	public void updateInfo(Map infoMap) throws DataAccessException {
		sqlSession.update("mapper.info.updateInfo", infoMap);
		
	}

}
