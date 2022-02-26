package com.myspring.momeche001.product.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.product.vo.ProductVO;
import com.myspring.momeche001.product.vo.ImageFileVO;

@Repository("ProductDAO")
public class ProductDAOImpl implements ProductDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> selectGoodsList(String pdStatus) throws DataAccessException {
		List<ProductVO> productList=(ArrayList)sqlSession.selectList("mapper.product.selectGoodsList",pdStatus);
	   return productList;	
	}  
	   
	public List<ProductVO> selectMWPdList(String pd_group1) throws DataAccessException {
		List<ProductVO> MWpdList=(ArrayList)sqlSession.selectList("mapper.product.selectMWPdList", pd_group1);
	 return MWpdList;
	}
	
	public List<ProductVO> selectPdList(ProductVO productVO) throws DataAccessException {
		List<ProductVO> pdList=(ArrayList)sqlSession.selectList("mapper.product.selectPdList", productVO);
		return pdList;
	}
	
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.product.selectKeywordSearch",keyword);
	   return list;
	}
	
	@Override
	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.product.selectGoodsBySearchWord",searchWord);
		 return list;
	}
	
	@Override
	public ProductVO selectPdDetail(String pd_id) throws DataAccessException{
		ProductVO productVO=(ProductVO)sqlSession.selectOne("mapper.product.selectPdDetail",pd_id);
		return productVO;
	}
	
	@Override
	public List<ImageFileVO> selectPdDetailImage(String pd_id) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.product.selectPdDetailImage",pd_id);
		return imageList;
	}
	
	
	// �ɼǿ� ���� ��ǰ��ȸ DAO
	@Override
	public List<ProductVO> productListToOption(Map<String, String> option) throws DataAccessException {
		
		List<ProductVO> productList = sqlSession.selectList("mapper.product.productListToOption", option);
				
		return productList;
     
	}
	
	

}
