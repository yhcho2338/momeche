package com.myspring.momeche001.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.product.vo.ProductVO;

@Repository("CartDAO")
public class CartDAOImpl implements CartDAO{
	@Autowired
	private SqlSession sqlSession;

	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList = (List)sqlSession.selectList("mapper.cart.selectCartList", cartVO);
		return cartList;
	}
	
	public List<ProductVO> selectProductList(List<CartVO> cartList) throws DataAccessException {
		List<ProductVO> myProductList;
		myProductList = sqlSession.selectList("mapper.cart.selectProductList", cartList);
		return myProductList;
	}
	
/*
	@Override
	public List selectAllCartList() throws DataAccessException {
		List<CartVO> cartList = null;
		cartList = sqlSession.selectList("mapper.cart.selectAllCartList");
		return cartList;
	}
*/
	@Override
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String result = sqlSession.selectOne("mapper.cart.selectCountInCart", cartVO);
		return Boolean.parseBoolean(result);
	}

	@Override
	public void insertProductInCart(CartVO cartVO) throws DataAccessException {
		int cart_num=selectMaxCart_num();
		cartVO.setCart_num(cart_num);
		sqlSession.insert("mapper.cart.insertProductInCart", cartVO);
		
		
	}
	
	@Override
	public void updateCartProductCount(CartVO cartVO) throws DataAccessException {
		sqlSession.insert("mapper.cart.updateCartProductCount", cartVO);
		
	}

	@Override
	public void deleteCartProduct(int cart_num) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteCartProduct", cart_num);
		
	}
	
	private int selectMaxCart_num() throws DataAccessException{
		int cart_num = sqlSession.selectOne("mapper.cart.selectMaxCart_num");
		return cart_num;
	}

	
	
	
}
