package com.myspring.momeche001.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.momeche001.cart.dao.CartDAO;
import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.product.vo.ProductVO;

@Service("CartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl implements CartService{
	@Autowired
	private CartDAO cartDAO;
/*
	@Override
	public List cartList() throws DataAccessException {
		List cartList = null;
		cartList = cartDAO.selectAllCartList();	
		return cartList;
	}
*/
	@Override
	public boolean findCartProduct(CartVO cartVO) throws DataAccessException {
		
		return cartDAO.selectCountInCart(cartVO);
	}

	@Override
	public void addProductInCart(CartVO cartVO) throws DataAccessException {
		cartDAO.insertProductInCart(cartVO);
		
	}
	
	


	public Map<String, List> myCartList(CartVO cartVO) throws Exception{
		Map<String, List> cartMap = new HashMap<String, List>();
		List<CartVO> myCartList = cartDAO.selectCartList(cartVO);
		if(myCartList.size()==0) {
			return null;
		}
		
		List<ProductVO> myProductList = cartDAO.selectProductList(myCartList);
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList", myProductList);
		return cartMap;
	}
	
	@Override
	public boolean modifyCartCount(CartVO cartVO) throws Exception {
		boolean result=true;
		cartDAO.updateCartProductCount(cartVO);
		return result;
	}

	@Override
	public void removeCartProduct(int cart_num) throws Exception {
		cartDAO.deleteCartProduct(cart_num);
		
	}
	
	
	
	
}
