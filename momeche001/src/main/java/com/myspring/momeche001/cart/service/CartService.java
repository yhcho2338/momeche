package com.myspring.momeche001.cart.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.cart.vo.CartVO;

public interface CartService {
	public Map<String, List> myCartList(CartVO cartVO) throws Exception;
	
	
	public boolean findCartProduct(CartVO cartVO) throws DataAccessException;
	public void addProductInCart(CartVO cartVO) throws DataAccessException;
	public boolean modifyCartCount(CartVO cartVO) throws Exception;
	public void removeCartProduct(int cart_num) throws Exception;
}
