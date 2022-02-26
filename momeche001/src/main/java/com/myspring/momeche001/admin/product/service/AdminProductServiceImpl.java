package com.myspring.momeche001.admin.product.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.admin.product.dao.AdminProductDAO;
import com.myspring.momeche001.product.dao.ProductDAO;
import com.myspring.momeche001.product.service.ProductService;
import com.myspring.momeche001.product.vo.ImageFileVO;
import com.myspring.momeche001.product.vo.ProductVO;



@Service("AdminProductService")
@Transactional(propagation = Propagation.REQUIRED)
public class AdminProductServiceImpl implements AdminProductService {

	@Autowired
	private AdminProductDAO adminProductDAO;
	
	
	@Override
	public List listProducts() throws DataAccessException{
		List adminProductList = null;
		adminProductList = adminProductDAO.selectAllProductList();
		return adminProductList;
	}
	
	
	@Override
	public int addNewProduct(Map newProductMap) throws Exception{
		int pd_id = adminProductDAO.insertNewProduct(newProductMap);
		ArrayList<ImageFileVO> imageFileList = (ArrayList)newProductMap.get("imageFileList");
		for(ImageFileVO imageFileVO : imageFileList) {
			imageFileVO.setPd_id(pd_id);
		}
		adminProductDAO.insertGoodsImageFile(imageFileList);
		return pd_id;
	}
	
	
	@Override
	public List goodsImageFile(int pd_id) throws Exception{
		List imageList =adminProductDAO.selectProductImageFileList(pd_id);
		return imageList;
	}
	

	@Override
	public void removePd(String pd_id) throws DataAccessException{
		 adminProductDAO.deleteProduct(pd_id);
	}
	
	@Override
	public int removePd2(String pd_id) throws DataAccessException{
		return adminProductDAO.deleteProduct2(pd_id);
	}
	
	
	@Override
	public Map pd_Detail(int pd_id) throws Exception {
		Map productMap = new HashMap();
		ProductVO productVO=adminProductDAO.selectProductDetail(pd_id);
		List imageFileList =adminProductDAO.selectProductImageFileList(pd_id);
		productMap.put("product", productVO);
		productMap.put("imageFileList", imageFileList);
		return productMap;
	}
	
	
	@Override
	public void modifyGoodsInfo(Map productMap) throws Exception{
		adminProductDAO.updatePdInfo(productMap);
		
	}	
	@Override
	public void modifyGoodsImage(List<ImageFileVO> imageFileList) throws Exception{
		adminProductDAO.updatePdImage(imageFileList); 
	}
	// 이벤트 상품 설정을 위한 추가 구문 설정
	@Override
	public List eventChk() throws DataAccessException {
		List eventList = null;
		eventList = adminProductDAO.selectEventList();
		return eventList;
	}
	
	
	
}
