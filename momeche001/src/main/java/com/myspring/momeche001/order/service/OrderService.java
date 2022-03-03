package com.myspring.momeche001.order.service;

import java.util.List;
import java.util.Map;

import com.myspring.momeche001.cart.vo.CartVO;
import com.myspring.momeche001.order.vo.OrderVO;

public interface OrderService {
	
	public int orderResultReturn (Map ProductMap) throws Exception;	
	public List<OrderVO> listMyOrderGoods(OrderVO orderVO) throws Exception;
	public int selectCount(CartVO cartVO) throws Exception;

	
}
