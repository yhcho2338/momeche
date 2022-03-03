package com.myspring.momeche001.product.service;

import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

//import com.myspring.momeche001.image.vo.ImageVO;
import com.myspring.momeche001.product.dao.ProductDAO;
import com.myspring.momeche001.product.vo.ProductVO;
import com.myspring.momeche001.product.vo.ImageFileVO;


@Service("productService")
@Transactional(propagation=Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDAO productDAO;
	
	
	// 메인페이지 
	public Map<String,List<ProductVO>> listGoods() throws Exception {
		Map<String,List<ProductVO>> productMap=new HashMap<String,List<ProductVO>>();
		List<ProductVO> productList=productDAO.selectGoodsList("bestseller");
		productMap.put("bestseller",productList);
		productList=productDAO.selectGoodsList("newperfume");
		productMap.put("newperfume",productList);
		
		productList=productDAO.selectGoodsList("steadyseller");
		productMap.put("steadyseller",productList);
		
		return productMap;
	}

	
	// 상품 정렬
	public List<ProductVO> listProducts(ProductVO productVO) throws Exception {		
		return productDAO.selectPdList(productVO);
	}
	
	
	
	public Map pdDetail(String _pd_id) throws Exception {
		Map productMap=new HashMap();
		ProductVO productVO = productDAO.selectPdDetail(_pd_id);
		productMap.put("productVO", productVO);
		List<ImageFileVO> imageList =productDAO.selectPdDetailImage(_pd_id);
		productMap.put("imageList", imageList);
		return productMap;
	}
	
	
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list=productDAO.selectKeywordSearch(keyword);
		return list;
	}
	
	
	public List<ProductVO> searchGoods(String searchWord) throws Exception{
		List productList=productDAO.selectGoodsBySearchWord(searchWord);
		return productList;
	}
	
	
	
	
}
	

