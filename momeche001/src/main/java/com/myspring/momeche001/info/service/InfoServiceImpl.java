package com.myspring.momeche001.info.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.info.dao.InfoDAO;
import com.myspring.momeche001.info.vo.InfoVO;

@Service("infoService")
@Transactional(propagation=Propagation.REQUIRED)
public class InfoServiceImpl implements InfoService {
	
	@Autowired
	InfoDAO infoDAO;
	
	@Override
	public List<InfoVO> listInfo() throws Exception{
		List<InfoVO> infoList = infoDAO.selectAllInfoList();
		return infoList;
		}

	
	@Override
	public int addNewInfo(Map infoMap) throws Exception {
		int info_num = infoDAO.insertNewInfo(infoMap);
		infoMap.put("info_num", info_num);
		return info_num;
	}


	
	@Override
	public Map viewInfo(int info_num) throws Exception {
		Map infoMap = new HashMap();
		InfoVO infoVO = infoDAO.selectInfo(info_num);
		infoMap.put("info", infoVO);
		return infoMap;

	}


	@Override
	public void removeInfo(int info_num) throws Exception {
		infoDAO.deleteInfo(info_num);
		
	}

	
	@Override
	public void modInfo(Map infoMap) throws Exception {
		infoDAO.updateInfo(infoMap);
		
	}

}
