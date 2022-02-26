package com.myspring.momeche001.admin.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.product.vo.ImageFileVO;

public interface AdminProductService {

	
	public List listProducts() throws DataAccessException;
	
	public int addNewProduct(Map newProductMap) throws Exception;
	
	public List goodsImageFile(int pd_id) throws Exception;
	
	
	public void removePd(String pd_id) throws DataAccessException;
	
	public int removePd2(String pd_id) throws DataAccessException;

	
	public Map pd_Detail(int pd_id) throws Exception;
	
	
	public void modifyGoodsInfo(Map productMap) throws Exception;
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception;
	//이벤트 상품 설정을 위한 추가 구문
	public List eventChk() throws DataAccessException;
	
	
}
