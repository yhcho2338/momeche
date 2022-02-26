package com.myspring.momeche001.order.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.order.vo.OrderVO;

public interface OrderDAO {
	
	
	public int insertOrderList(Map ProductMap) throws DataAccessException;
	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws DataAccessException;
	
	public int selectCount(CartVO cartVO) throws DataAccessException;

}
