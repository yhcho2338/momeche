package com.myspring.momeche001.admin.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.product.vo.ImageFileVO;
import com.myspring.momeche001.product.vo.ProductVO;

public interface AdminProductDAO {
	
	public List selectAllProductList() throws DataAccessException;
	
	public int insertNewProduct(Map newProductMap) throws DataAccessException;
	
	public void insertGoodsImageFile(List fileList)  throws DataAccessException;

	public List selectProductImageFileList(int pd_id) throws DataAccessException;

	
	public void deleteProduct(String pd_id) throws DataAccessException;
	
	public int deleteProduct2(String pd_id) throws DataAccessException;
	
	
	public ProductVO selectProductDetail(int pd_id) throws DataAccessException;
	public void updatePdInfo(Map productMap) throws DataAccessException;
	public void updatePdImage(List<ImageFileVO> imageFileList) throws DataAccessException;
	//이벤트 체크 상품을 이벤트 페이지로 옮기기 위한 설정 추가
	public List selectEventList() throws DataAccessException;
	
	
	
}