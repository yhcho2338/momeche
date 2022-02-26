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
	


	public Map<String,List<ProductVO>> listProduct() throws Exception {
		Map<String,List<ProductVO>> productMWMap=new HashMap<String,List<ProductVO>>();
		
		List<ProductVO> MWpdList=productDAO.selectMWPdList("man");
		productMWMap.put("man",MWpdList);
		
		MWpdList=productDAO.selectMWPdList("woman");
		productMWMap.put("woman", MWpdList);
		
	return productMWMap;	
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
	
	
	@Override
	public Map<String, Map<String, Object>> productListToOption(Map<String, String> option) throws Exception {

		// �ɼǿ� ���� ��ǰ����Ʈ ����
		List<ProductVO> productList = productDAO.productListToOption(option);
		
		
		// �������� ȣ���� ��ǰ���� + �̹����� ���� ��ü ����
		Map<String, Map<String, Object>> fullProductList = new HashMap<String, Map<String, Object>>();
		// �̹��� ȣ���� ���� option Map ��ü ����
		Map<String, String> imageOption = new HashMap<String, String>();
			
		if(productList != null && !productList.isEmpty() ) {
		for (int i = 0; i < productList.size(); i++) {

			ProductVO product = productList.get(i);
			
			if (product != null) {
				
				//String match_id = product.getProduct_id();
				
				//imageOption.put("match_id", match_id);
				//imageOption.put("image_category", "main");

				// �ش� ��ǰ�� ������ ���� �̹��� ȣ��
				//ImageVO productImage = imageService.selectProductImage(imageOption);
				// byte�� img�� ��ȯ�ϱ� ���� encode
				
				// ��ǰ ����� �̹����� ���� ��ü ����
				Map<String, Object> productInfo = new HashMap<String, Object>();
				
				// byte[] �ڷḦ img �±׿� ��밡���ϵ��� encode
				//String encodeImage = Base64.getEncoder().encodeToString(productImage.getImage_file());
				
				productInfo.put("product_main_title", product.getPd_name());
				//productInfo.put("product_sub_title", product.getProduct_sub_title());
				productInfo.put("product_price", product.getPd_price());
				//productInfo.put("product_discount", product.getProduct_discount());
				//productInfo.put("image_file", encodeImage);
				productInfo.put("product_id", product.getPd_id());

				fullProductList.put("product" + (i+1), productInfo);
				
			}

		}
		}

		return fullProductList;

	}
	
	
	
}
	

