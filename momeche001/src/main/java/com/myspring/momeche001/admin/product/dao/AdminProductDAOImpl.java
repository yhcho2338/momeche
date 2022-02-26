package com.myspring.momeche001.admin.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.product.vo.ProductVO;
import com.myspring.momeche001.product.vo.ImageFileVO;

@Repository("adminProductDAO")
public class AdminProductDAOImpl implements AdminProductDAO {

	
	@Autowired
	private ProductVO productVO;
	
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public List selectAllProductList() throws DataAccessException {
		List<ProductVO> adminProductList = null;
		adminProductList = sqlSession.selectList("mapper.admin.product.selectAllProductList");
		return adminProductList;
		
	}
	
	
	@Override
	public int insertNewProduct(Map newProductMap) throws DataAccessException {
		sqlSession.insert("mapper.admin.product.insertNewProduct",newProductMap);
		return Integer.parseInt((String)newProductMap.get("pd_id"));
	}
	
	@Override
	public void insertGoodsImageFile(List fileList)  throws DataAccessException {
		for(int i=0; i<fileList.size();i++){
			ImageFileVO imageFileVO=(ImageFileVO)fileList.get(i);
			sqlSession.insert("mapper.admin.product.insertProductImageFile",imageFileVO);
		}
	}
	
	@Override
	public List selectProductImageFileList(int pd_id) throws DataAccessException {
		List imageList=new ArrayList();
		imageList=(List)sqlSession.selectList("mapper.admin.product.selectProductImageFileList",pd_id);
		return imageList;
	}
	
	
	@Override
	public void deleteProduct(String pd_id) throws DataAccessException {
		sqlSession.delete("mapper.admin.product.deleteProduct", pd_id);
				
	}
	
	@Override
	public int deleteProduct2(String pd_id) throws DataAccessException {
		int result = sqlSession.delete("mapper.admin.product.deleteProduct2", pd_id);
		return result;
		
	}
	
	
	@Override
	public ProductVO selectProductDetail(int pd_id) throws DataAccessException {
		ProductVO pdBean = new ProductVO();
		pdBean=(ProductVO)sqlSession.selectOne("mapper.admin.product.selectProductDetail",pd_id);
		return pdBean;
	}
	
	@Override
	public void updatePdInfo(Map productMap) throws DataAccessException{
		sqlSession.update("mapper.admin.product.updatePdInfo",productMap);
	}
	
	@Override
	public void updatePdImage(List<ImageFileVO> imageFileList) throws DataAccessException {
		
		for(int i=0; i<imageFileList.size();i++){
			ImageFileVO imageFileVO = imageFileList.get(i);
			sqlSession.update("mapper.admin.product.updatePdImage",imageFileVO);	
		}
	}
	
	// 이벤트 상품 설정을 위한 추가
		@Override
		public List selectEventList() throws DataAccessException {
			List<ProductVO> eventList = null;
			eventList = sqlSession.selectList("mapper.admin.product.selectEventList");
			return eventList;
		}
	
	
}
