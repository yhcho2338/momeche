package com.myspring.momeche001.info.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.info.vo.InfoVO;

public interface InfoService {
	
	// ����Ʈ
	public List<InfoVO> listInfo() throws Exception;
	
	// �۾���
	public int addNewInfo(Map infoMap) throws Exception;
	
	// �󼼺���
	public Map viewInfo(int info_num) throws Exception;
	
	// ����
	public void removeInfo(int info_num) throws Exception;
	
	// ����
	public void modInfo(Map infoMap) throws Exception;

}
