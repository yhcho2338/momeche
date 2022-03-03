package com.myspring.momeche001.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.product.vo.ProductVO;
import com.myspring.momeche001.product.vo.ImageFileVO;

public interface ProductDAO {
	
	public List<ProductVO> selectGoodsList(String pdStatus) throws DataAccessException;
	
	public List<ProductVO> selectPdList(ProductVO productVO) throws DataAccessException;
	
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException;
	public ProductVO selectPdDetail(String pd_id) throws DataAccessException;
	public List<ImageFileVO> selectPdDetailImage(String pd_id) throws DataAccessException;
	public List<ProductVO> selectGoodsBySearchWord(String searchWord) throws DataAccessException;

	

}
