package com.myspring.momeche001.product.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myspring.momeche001.product.vo.ProductVO;

public interface ProductService {
	
	public Map<String,List<ProductVO>> listGoods() throws Exception;
	public Map pdDetail(String _pd_id) throws Exception;
	
	public Map<String,List<ProductVO>> listProduct() throws Exception;
	
	public List<ProductVO> listProducts(ProductVO productVO) throws Exception;
	
	public List<String> keywordSearch(String keyword) throws Exception;
	public List<ProductVO> searchGoods(String searchWord) throws Exception;
	
	
	
	public Map<String, Map<String, Object>> productListToOption(Map<String, String> option) throws Exception;

}
